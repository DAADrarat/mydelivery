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
		String uri = req.getRequestURI(); //http://localhost:8080/empapp/list.do
		String requestUri = uri.substring(uri.lastIndexOf("/"), uri.length());
		System.out.println("requestUri=" + requestUri);
	switch (requestUri) {
		
			case "/loginform.do" :{
			page = "login.jsp";
			break;
		}
			
			case "/login.do" : {
			    String customerId = req.getParameter("customerId");
			    String customerPw = req.getParameter("customerPw");
			    
			    DeliveryDAO menuDAO = new DeliveryDAO();
			    CustomerTO customerTO = menuDAO.login(customerId, customerPw);

			    if (customerTO != null) {
			        HttpSession session = req.getSession();
			        session.setAttribute("customer", customerTO);
			        
			        page = "store.jsp"; 
			    } else {
			        req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			        page = "login.jsp";
			    }
			    break;
			}
			case "/logout.do" : {
				HttpSession session = req.getSession(false); // =req.getSession(false): 세션이 이미 있으면 가져오고 없으면 null
				if (session != null) session.invalidate(); // session이 존재한다면 session을 삭제해라 
				page = "login.jsp";
				
				break;
			}
			
			case"/store.do" : {
				//List<MenuTO> list = MenuDAO.getList(); menuto객체를 여러개 담는 List 컨트롤러가 menudao에게 메뉴 목록을 가져오라고 요청하는거
				//req.setAttribute("data", list); jsp로 전달하는 역할, request객체에 data라는 이름으로 list를 저장
				page = "store.jsp";
				break;
			}
			
			case "/optionform.do" : {
				//1. client가 보내준 menuId를 꺼내온다.
				String menuIdStr = req.getParameter("menuId");
				int menuId = 0;
				if (menuIdStr != null) menuId = Integer.parseInt(menuIdStr);
				// MenuTO menu = MenuDAO.getById(menuId); 내가 받은 메뉴가 3번이다 그럼 3번 메뉴를 다오에서 찾아줘
				// req.setAttribute("menu", menu);
				//3. 옵션 선택 폼으로 포워딩한다.
				page = "option_form.jsp"; //여기서 request객체에 저장해놓은 menu를 사용할 수 있다.
				break;
			}
			case "/addcart.do" : {
				//1. client가 보내준 menuId를 꺼내온다.
				String menuIdStr = req.getParameter("menuId");
				int menuId = 0;
				if (menuIdStr != null) menuId = Integer.parseInt(menuIdStr);
				// MenuTO menu = MenuDAO.getById(menuId);
				//3. 세션의 장바구니 리스트에 담는다. (CartTO 없이 MenuTO 그대로 사용)
				HttpSession session = req.getSession();
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart"); // (List<MenuTO>):뒤에게 object라 형변환
				if (cart == null) {
					cart = new ArrayList<>();
				}
				// cart.add(menu); 앞에서 가져온 menuto menu를 cart에 넣는것
				session.setAttribute("cart", cart);
				req.setAttribute("cartList", cart); // 이건 세션에서 저장한 장바구니를 이번 요청에서 cart.jsp가 사용할 수 있도록 request에도 넣는것
				page = "cart.jsp";
				break;
			}
			case "/cart.do" : {
				//1. 세션에서 장바구니 리스트를 꺼내온다.
				HttpSession session = req.getSession();
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
				if (cart == null) {
					cart = new ArrayList<>();
				}
				req.setAttribute("cartList", cart);
				page = "cart.jsp";
				break;
			}
			case "/editcart.do" : {
				//1. client가 보내준 menuId(수정할 항목)를 꺼내온다.
				String menuIdStr = req.getParameter("menuId");
				int menuId = 0;
				if (menuIdStr != null) menuId = Integer.parseInt(menuIdStr);
				//2. DB에서 해당 메뉴를 조회해서 옵션 선택 화면에 다시 넘긴다.
				// ??? MenuDAO.getById(menuId) 확인 필요 ???
				// MenuTO menu = MenuDAO.getById(menuId);
				// req.setAttribute("menu", menu);
				page = "option_form.jsp";
				break;
			}
			case "/deletecart.do" : {
				//1. client가 보내준 삭제할 항목의 menuId를 꺼내온다.
				String menuIdStr = req.getParameter("menuId");
				int menuId = 0;
				if (menuIdStr != null) menuId = Integer.parseInt(menuIdStr);
				//2. 세션의 장바구니 리스트에서 해당 항목을 제거한다.
				HttpSession session = req.getSession();
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
				if (cart != null) {
					// ??? menuId 기준으로 제거하는 로직 필요 (예: removeIf) ???
					// cart.removeIf(m -> m.getMenu_id() == menuId);
				}
				req.setAttribute("cartList", cart);
				page = "cart.jsp";
				break;
			}
			case "/payform.do" : {
				//1. 세션에서 장바구니 리스트를 꺼내온다.
				HttpSession session = req.getSession();
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
				req.setAttribute("cartList", cart);
				// ??? 총액 계산 로직 필요 (price 합산) ???
				page = "pay_form.jsp";
				break;
			}
			case "/pay.do" : {
				//1. 세션에서 고객 정보와 장바구니를 꺼낸다.
				HttpSession session = req.getSession();
				CustomerTO customerTO = (CustomerTO) session.getAttribute("customer");
				List<MenuTO> cart = (List<MenuTO>) session.getAttribute("cart");
				//2. 주문 객체를 만들어 DB에 저장한다.
				OrderTO order = makeOrder(req, customerTO, cart);
				System.out.println(order);
				// ??? OrderDAO 확인 필요 ???
				// OrderDAO.insert(order);
				//3. 장바구니를 비운다.
				session.removeAttribute("cart");
				page = "pay_complete.jsp";
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
			order.setCustomerNumber(customer.getCustNum());
			order.setCustomerName(customer.getCustName());
			order.setCustomerAddress(customer.getCustAddr());
			order.setCustomerPhone(customer.getCustPhone());
		}
		// ??? 장바구니(cart)를 돌면서 selectedOptions, finalPrice 채우는 로직 필요 ???
		// 예: cart가 여러 개면 selectedOptions는 메뉴 이름들을 이어붙이고, finalPrice는 price 합산
		// StringBuilder sb = new StringBuilder();
		// int total = 0;
		// for (MenuTO menu : cart) {
		//     sb.append(menu.getMenu_name()).append(",");
		//     total += menu.getPrice();
		// }
		// order.setSelectedOptions(sb.toString());
		// order.setFinalPrice(total);

		order.setOrderTime(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));

		return order;
	}

}