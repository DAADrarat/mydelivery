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
		String page = "index.jsp";
		String uri = req.getRequestURI(); // http://localhost:8080/empapp/list.do
		String requestUri = uri.substring(uri.lastIndexOf("/"), uri.length());
		System.out.println("requestUri=" + requestUri);
		switch (requestUri) {

		case "/loginform.do": {
			page = "login.jsp";
			break;
		}

		case "/login.do": {
			String customerId = req.getParameter("customerId");
			String customerPw = req.getParameter("customerPw");

			DeliveryDAO menuDAO = new DeliveryDAO();
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
			HttpSession session = req.getSession(false); // =req.getSession(false): 세션이 이미 있으면 가져오고 없으면 null
			if (session != null)
				session.invalidate(); // session이 존재한다면 session을 삭제해라
			page = "login.jsp";

			break;
		}

		case "/menu.do": {
			page = "menu_choice1.jsp";
			break;
		}
		case "/gukbap.do": {
			req.setAttribute("menu", new DeliveryDAO().getMenuDetail(1));
			page = "gukbap.jsp";
			break;
		}
		case "/pizza.do": {
			req.setAttribute("menu", new DeliveryDAO().getMenuDetail(2));
			page = "menuPizza.jsp";
			break;
		}
		case "/chicken.do": {
			req.setAttribute("menu", new DeliveryDAO().getMenuDetail(3));
			page = "chicken.jsp";
			break;
		}
		case "/Dduck.do": {
			req.setAttribute("menu", new DeliveryDAO().getMenuDetail(4));
			page = "menuDduck.jsp";
			break;
		}

		case "/store.do": {
			// List<MenuTO> list = MenuDAO.getList(); menuto객체를 여러개 담는 List 컨트롤러가 menudao에게
			// 메뉴 목록을 가져오라고 요청하는거
			// req.setAttribute("data", list); jsp로 전달하는 역할, request객체에 data라는 이름으로 list를 저장
			page = "menu_choice1.jsp";
			break;
		}

		case "/optionform.do": {
			// 1. client가 보내준 menuId를 꺼내온다.
			String menuIdStr = req.getParameter("menuId");
			int menuId = 0;
			if (menuIdStr != null)
				menuId = Integer.parseInt(menuIdStr);
			// MenuTO menu = MenuDAO.getById(menuId); 내가 받은 메뉴가 3번이다 그럼 3번 메뉴를 다오에서 찾아줘
			// req.setAttribute("menu", menu);
			// 3. 옵션 선택 폼으로 포워딩한다.
			page = "option_form.jsp"; // 여기서 request객체에 저장해놓은 menu를 사용할 수 있다.
			break;
		}
		case "/addcart.do": {
			int menuId = 0;
			String s = req.getParameter("menuId");
			if (s != null)
				menuId = Integer.parseInt(s);

			String selectedOptions = req.getParameter("selectedOptions");
			int finalPrice = 0;
			String fp = req.getParameter("finalPrice");
			if (fp != null)
				finalPrice = Integer.parseInt(fp);

			DeliveryDAO dao = new DeliveryDAO();
			MenuTO menu = dao.getMenuDetail(menuId);
			
			System.out.println(">>> menuId=" + menuId + " / menu=" + menu + " / opt=" + selectedOptions);

			HttpSession session = req.getSession();
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			if (cart == null)
				cart = new ArrayList<>();

			if (menu != null) {
				menu.setQty(1);
				menu.setOptionText(selectedOptions);
				if (finalPrice > 0)
					menu.setPrice(finalPrice);
				cart.add(menu);
			}
			System.out.println(">>> cart 크기=" + cart.size());
			
			session.setAttribute("cart", cart);
			setCartAttr(req, cart);
			page = "cart.jsp";
			break;
		
			

		}
		case "/cart.do": {
			// 1. 세션에서 장바구니 리스트를 꺼내온다.
			HttpSession session = req.getSession();
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			if (cart == null) {
				cart = new ArrayList<>();
			}
			setCartAttr(req, cart);  
			page = "cart.jsp";
			break;
		}
		case "/editcart.do": {
			// 1. client가 보내준 menuId(수정할 항목)를 꺼내온다.
			String menuIdStr = req.getParameter("menuId");
			int menuId = 0;
			if (menuIdStr != null)
				menuId = Integer.parseInt(menuIdStr);
			// 2. DB에서 해당 메뉴를 조회해서 옵션 선택 화면에 다시 넘긴다.
			// ??? MenuDAO.getById(menuId) 확인 필요 ???
			// MenuTO menu = MenuDAO.getById(menuId);
			// req.setAttribute("menu", menu);
			page = "option_form.jsp";
			break;
		}
		case "/deletecart.do": {
			// 1. client가 보내준 삭제할 항목의 menuId를 꺼내온다.
			String menuIdStr = req.getParameter("menuId");
			int menuId = 0;
			if (menuIdStr != null)
				menuId = Integer.parseInt(menuIdStr);
			// 2. 세션의 장바구니 리스트에서 해당 항목을 제거한다.
			HttpSession session = req.getSession();
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			if (cart != null) {
				final int delId = menuId;
				cart.removeIf(m -> m.getMenuId() == delId);
			} else {
				cart = new ArrayList<>();
			}
			setCartAttr(req, cart);
			page = "cart.jsp";
			break;
		}
		case "/payform.do": {
			// 1. 세션에서 장바구니 리스트를 꺼내온다.
			HttpSession session = req.getSession();
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			req.setAttribute("cartList", cart);
			// ??? 총액 계산 로직 필요 (price 합산) ???
			page = "pay_form.jsp";
			break;
		}
		case "/order.do": {
			// 1. 세션에서 고객 정보와 장바구니를 꺼낸다.
			HttpSession session = req.getSession();
			CustomerTO customerTO = (CustomerTO) session.getAttribute("customer");
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			// 2. 주문 객체를 만들어 DB에 저장한다.
			OrderTO order = makeOrder(req, customerTO, cart);
			System.out.println(order);
			// ??? OrderDAO 확인 필요 ???
			// OrderDAO.insert(order);
			// 3. 장바구니를 비운다.
			session.removeAttribute("cart");
			page = "order.jsp";
			break;

			// Controller 내부의 주문 처리 부분 예시 MenuDAO menuDAO = new MenuDAO();
			// int result = menuDAO.insertOrder(order); if (result > 0)
			// { // result가 1이면 DB 저장 성공! // 주문 완료 화면으로 이동 page = "orderResult.jsp"; }
			// else { // result가 0이면 저장 실패 // 실패 메시지를 띄우거나 이전 화면으로 돌아감 }
		}
		default:
		}
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}

	OrderTO makeOrder(HttpServletRequest req, CustomerTO customer, List<MenuTO> cart) {
		OrderTO order = new OrderTO();
		if (customer != null) {

			order.setCustomerName(customer.getCustomerName());
			order.setCustomerAddress(customer.getCustomerAddress());
			order.setCustomerPhone(customer.getCustomerPhone());
		}
		// ??? 장바구니(cart)를 돌면서 selectedOptions, finalPrice 채우는 로직 필요 ???
		// 예: cart가 여러 개면 selectedOptions는 메뉴 이름들을 이어붙이고, finalPrice는 price 합산
		// StringBuilder sb = new StringBuilder();
		// int total = 0;
		// for (MenuTO menu : cart) {
		// sb.append(menu.getMenu_name()).append(",");
		// total += menu.getPrice();
		// }
		// order.setSelectedOptions(sb.toString());
		// order.setFinalPrice(total);

		order.setOrderTime(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));

		return order;
	}

	void setCartAttr(HttpServletRequest req, List<MenuTO> cart) {
		int total = 0;
		for (MenuTO m : cart)
			total += m.getItemTotal();
		req.setAttribute("list", cart);
		req.setAttribute("total", total);
	}

}