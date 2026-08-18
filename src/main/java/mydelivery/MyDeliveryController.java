package mydelivery;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("*.do")
public class MyDeliveryController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String page = "index.jsp";
		String uri = req.getRequestURI(); // http://localhost:8080/empapp/list.do
		String requestUri = uri.substring(uri.lastIndexOf("/"), uri.length());
		System.out.println("requestUri=" + requestUri);
		
		DeliveryDAO menuDAO = new DeliveryDAO();

		switch (requestUri) {

		case "/loginform.do": {
			page = "login.jsp";
			break;
		}

		case "/login.do": {
			String customerId = req.getParameter("customerId");
			String customerPw = req.getParameter("customerPw");

			CustomerTO customerTO = menuDAO.login(customerId, customerPw);

			if (customerTO != null) {
				HttpSession session = req.getSession();
				session.setAttribute("customer", customerTO);
				page = "menu_choice1.jsp";
			} else {
				req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
				page = "login.jsp";
			}
			break;
		}
		case "/logout.do": {
			HttpSession session = req.getSession(false); // 세션이 이미 있으면 가져오고 없으면 null
			if (session != null)
				session.invalidate(); // session이 존재한다면 삭제
			page = "login.jsp";
			break;
		}

		case "/menu.do": 
		case "/store.do": {
			page = "menu_choice1.jsp";
			break;
		}
		case "/chicken.do": {
			req.setAttribute("menu", menuDAO.getMenuDetail(3));
			page = "chicken.jsp";
			break;
		}
		case "/pizza.do": {
			req.setAttribute("menu", menuDAO.getMenuDetail(2));
			page = "menuPizza.jsp";
			break;
		}
		case "/Dduck.do": 
		 {
			req.setAttribute("menu", menuDAO.getMenuDetail(4));
			page = "menuDduck.jsp";
			break;
		}
		case "/gukbap.do": {
			req.setAttribute("menu", menuDAO.getMenuDetail(1));
			page = "gukbap.jsp";
			break;
		}

		// ===== 장바구니 담기 (CartTO 없이 MenuTO 그대로 사용) =====
		case "/addcart.do": 
		case "/cartAdd.do": {
			// 1. client가 보내준 데이터를 꺼내온다.
			int menuId = Integer.parseInt(req.getParameter("menuId"));
			String selectedOptions = req.getParameter("selectedOptions");
			int finalPrice = Integer.parseInt(req.getParameter("finalPrice"));
			
			int qty = 1;
			if(req.getParameter("quantity") != null) {
				qty = Integer.parseInt(req.getParameter("quantity"));
			}

			// 2. DB에서 해당 메뉴 조회
			MenuTO menu = menuDAO.getMenuDetail(menuId);
			
			if (menu != null) {
				// MenuTO에 장바구니 옵션과 금액을 채워넣음
				menu.setOptionText(selectedOptions);
				menu.setQty(qty);
				menu.setItemTotal(finalPrice);
				
				// 장바구니 내 고유 구분을 위해 메뉴ID 살짝 변경 (중복 담기 방지)
				menu.setMenuId(menuId * 1000 + (int)(Math.random() * 999));
				
				// 3. 세션의 장바구니 리스트에 담는다.
				HttpSession session = req.getSession();
				
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart"); 
				if (cart == null) {
					cart = new ArrayList<>();
				}
				cart.add(menu);
				session.setAttribute("cart", cart);
			}
			
			// 화면 이동 대신 통신 성공 응답만 반환
			resp.getWriter().print("success");
			return; 
		}

		case "/cart.do": {
			String cmd = req.getParameter("cmd");
			HttpSession session = req.getSession();
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			if (cart == null) cart = new ArrayList<>();
			
			// 🛒 수량 업데이트 및 삭제 (AJAX 비동기 처리)
			if ("update".equals(cmd) || "delete".equals(cmd)) {
				int menuId = Integer.parseInt(req.getParameter("menuId"));
				int qty = "update".equals(cmd) ? Integer.parseInt(req.getParameter("qty")) : 0;
				
				boolean removed = false;
				int itemTotal = 0;
				int grandTotal = 0;
				
				for (int i = 0; i < cart.size(); i++) {
					MenuTO m = cart.get(i);
					if (m.getMenuId() == menuId) {
						if (qty <= 0) {
							cart.remove(i);
							removed = true;
							i--; 
						} else {
							int unitPrice = m.getItemTotal() / m.getQty(); // 1개당 단가 역산
							m.setQty(qty);
							m.setItemTotal(unitPrice * qty);
							itemTotal = m.getItemTotal();
						}
					}
				}
				for (MenuTO m : cart) grandTotal += m.getItemTotal();
				
				boolean empty = cart.isEmpty();
				String json = String.format("{\"removed\": %b, \"qty\": %d, \"itemTotal\": %d, \"total\": %d, \"empty\": %b}", 
						removed, qty, itemTotal, grandTotal, empty);
				
				resp.setContentType("application/json;charset=UTF-8");
				resp.getWriter().print(json);
				return;
				
			} else {
				// 🛒 단순 장바구니 화면 이동
				int total = 0;
				for (MenuTO m : cart) total += m.getItemTotal();
				
				req.setAttribute("list", cart); // JSP에 보낼 장바구니 리스트
				req.setAttribute("total", total);
				page = "cart.jsp";
			}
			break;
		}

		case "/order.do": {
			// 1. 세션에서 고객 정보와 장바구니를 꺼낸다.
			HttpSession session = req.getSession();
			CustomerTO customerTO = (CustomerTO) session.getAttribute("customer");		
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			
			if (customerTO != null && cart != null && !cart.isEmpty()) {
				// 2. 주문 객체를 만들어 DB에 저장한다.
				OrderTO order = makeOrder(req, customerTO, cart);
				menuDAO.insertOrder(order);
				
				// 완료 화면(order.jsp)을 위한 값 전달
				int total = 0;
				for (MenuTO m : cart) total += m.getItemTotal();
				req.setAttribute("list", cart);
				req.setAttribute("total", total);
				
				// 3. 장바구니를 비운다.
				session.removeAttribute("cart");
			}
			page = "order.jsp";
			break;
		}
		default:
		}
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}

	OrderTO makeOrder(HttpServletRequest req, CustomerTO customer, List<MenuTO> cart) {
		OrderTO order = new OrderTO();
		if (customer != null) {
			order.setCustomerNumber(customer.getCustomerId()); 
			order.setCustomerName(customer.getCustomerName());
			order.setCustomerAddress(customer.getCustomerAddress());
			order.setCustomerPhone(customer.getCustomerPhone());
		}
		
		// 장바구니(cart)를 돌면서 selectedOptions, finalPrice 채우는 로직
		StringBuilder sb = new StringBuilder();
		int total = 0;
		
		if (cart != null && !cart.isEmpty()) {
			int rawMenuId = cart.get(0).getMenuId() / 1000;
			order.setMenuId(rawMenuId > 0 ? rawMenuId : 1);
			
			for (int i = 0; i < cart.size(); i++) {
				MenuTO menu = cart.get(i);
				sb.append(menu.getMenuName()).append("(").append(menu.getOptionText()).append(")");
				if (i < cart.size() - 1) sb.append(", ");
				total += menu.getItemTotal();
			}
		}
		
		order.setSelectedOptions(sb.toString());
		order.setFinalPrice(total);
		order.setOrderTime(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));

		return order;
	}
}