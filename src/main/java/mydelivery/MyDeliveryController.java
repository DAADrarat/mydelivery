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
			// 자바스크립트(AJAX)에서 보낸 cmd 파라미터 확인 (update 또는 delete)
			String cmd = req.getParameter("cmd");

			if (cmd != null) {
				// 1. AJAX 요청일 경우 (JSON으로 응답을 내려줌)
				resp.setContentType("application/json;charset=UTF-8");
				int menuId = Integer.parseInt(req.getParameter("menuId"));

				HttpSession session = req.getSession();
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
				if (cart == null)
					cart = new ArrayList<>();

				boolean removed = false;
				int newQty = 0;
				int itemTotal = 0;

				if ("update".equals(cmd)) {
					// 수량 변경 로직
					int qty = Integer.parseInt(req.getParameter("qty"));
					for (int i = 0; i < cart.size(); i++) {
						MenuTO m = cart.get(i);
						if (m.getMenuId() == menuId) {
							if (qty <= 0) {
								cart.remove(i);
								removed = true;
							} else {
								m.setQty(qty);
								newQty = m.getQty();
								itemTotal = m.getItemTotal(); // 단일 메뉴 총액 갱신
							}
							break;
						}
					}
				} else if ("delete".equals(cmd)) {
					// 삭제 로직
					cart.removeIf(m -> m.getMenuId() == menuId);
					removed = true;
				}

				// 전체 장바구니 총액 다시 계산
				int total = 0;
				for (MenuTO m : cart) {
					total += m.getItemTotal();
				}
				boolean empty = cart.isEmpty();

				// 세션에 갱신된 장바구니 저장
				session.setAttribute("cart", cart);

				// JSON 문자열을 만들어 자바스크립트로 전송
				String json = String.format(
						"{\"removed\": %b, \"qty\": %d, \"itemTotal\": %d, \"total\": %d, \"empty\": %b}", removed,
						newQty, itemTotal, total, empty);
				resp.getWriter().print(json);

				// ★ 중요: AJAX 요청이므로 여기서 바로 종료 (JSP로 포워딩 안 함)
				return;
			}

			// 2. 일반 화면 이동일 경우 (단순히 /cart.do로 접속했을 때)
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
		case "/order.do": {
			HttpSession session = req.getSession();
			CustomerTO customerTO = (CustomerTO) session.getAttribute("customer");
			List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
			if (cart == null)
				cart = new ArrayList<>();

			OrderTO order = makeOrder(req, customerTO, cart);
			System.out.println(order);
			if (cart != null) {
				setCartAttr(req, cart);
				req.setAttribute("orderInfo", order);
			}
			// DB 저장
			DeliveryDAO dao = new DeliveryDAO();
			if (customerTO != null)
				order.setCustomerNumber(customerTO.getCustomerId());
			for (MenuTO m : cart) {
				order.setMenuId(m.getMenuId());
				order.setSelectedOptions(m.getOptionText());
				order.setFinalPrice(m.getItemTotal());
				dao.insertOrder(order);
			}

			// 화면에 뿌릴 데이터를 먼저 넣고
			setCartAttr(req, cart);
			req.setAttribute("order", order);
			req.setAttribute("customer", customerTO);

			// 그 다음에 비우기
			session.removeAttribute("cart");

			page = "order.jsp";
			break;
		}
		// 주문 목록
		case "/orderlist.do": {
			HttpSession session = req.getSession();
			CustomerTO c = (CustomerTO) session.getAttribute("customer");
			if (c == null) {
				page = "login.jsp";
				break;
			}

			req.setAttribute("orderList", new DeliveryDAO().getOrderList(c.getCustomerId()));
			page = "orderList.jsp";
			break;
		}
		// crud
		// 수정 폼
		case "/orderedit.do": {
			int orderId = Integer.parseInt(req.getParameter("orderId"));
			req.setAttribute("order", new DeliveryDAO().getOrderDetail(orderId));
			page = "orderEdit.jsp";
			break;
		}

		// 수정 처리 (Update)
		case "/orderupdate.do": {
			OrderTO to = new OrderTO();
			to.setOrderId(Integer.parseInt(req.getParameter("orderId")));
			to.setCustomerAddress(req.getParameter("customerAddress"));
			to.setCustomerPhone(req.getParameter("customerPhone"));

			new DeliveryDAO().updateOrder(to);
			resp.sendRedirect("orderlist.do");
			return; // forward 하면 안 됨
		}

		// 주문 취소 (Delete)
		case "/ordercancel.do": {
			int orderId = Integer.parseInt(req.getParameter("orderId"));
			new DeliveryDAO().deleteOrder(orderId);
			resp.sendRedirect("orderlist.do");
			return;
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