package mydelivery;

import java.sql.Connection;
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.Statement; 
import java.util.ArrayList; 
import java.util.List; 

public class DeliveryDAO { 

	public CustomerTO login(String customerId, String customerPw) { 
        CustomerTO customer = null; 

        String sql = "select * from customer where customer_id = ? and customer_pw = ?";

        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement psmt = conn.prepareStatement(sql)) { 

            psmt.setString(1, customerId); 
            psmt.setString(2, customerPw); 

            try (ResultSet rs = psmt.executeQuery()) { 
                if (rs.next()) {
                    customer = new CustomerTO(); 
                    customer.setCustomerNumber(rs.getInt("customer_number"));
                    customer.setCustomerId(rs.getString("customer_id"));      
                    customer.setPasswd(rs.getString("customer_pw"));      
                    customer.setCustomerName(rs.getString("customer_name")); 
                    customer.setCustomerAddress(rs.getString("customer_address"));
                    customer.setCustomerPhone(rs.getString("customer_phone"));    
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        return customer;
    }

    /**
     * 2. 가게별 전체 메뉴 목록 조회 (store.jsp)
     * - store_id에 해당하는 모든 메뉴를 조회하여 List 형태로 반환합니다.
     */
    public List<MenuTO> getMenuList(int storeId) { 
        List<MenuTO> menuList = new ArrayList<>(); 
        String sql = "select * from menu where store_id = ?"; 

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) { 

            psmt.setInt(1, storeId); 
            try (ResultSet rs = psmt.executeQuery()) { 
                while (rs.next()) { 
                    MenuTO menu = new MenuTO(); 
                    menu.setMenuId(rs.getInt("menu_id"));
                    menu.setStoreId(rs.getInt("store_id")); 
                    menu.setMenuName(rs.getString("menu_name")); 
                    menu.setPrice(rs.getInt("price")); 
                    menuList.add(menu); 
                }
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }

        return menuList; 
    }

    /**
     * 3. 특정 메뉴 상세 정보 조회 (chicken.jsp 등)
     * - menu_id에 해당하는 단일 메뉴 정보를 조회합니다.
     */
    public MenuTO getMenuDetail(int menuId) {
        MenuTO menu = null; 
        String sql = "select * from menu where menu_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, menuId);
            try (ResultSet rs = psmt.executeQuery()) { 
                if (rs.next()) { 
                    menu = new MenuTO(); 
                    menu.setMenuId(rs.getInt("menu_id")); 
                    menu.setStoreId(rs.getInt("store_id")); 
                    menu.setMenuName(rs.getString("menu_name"));
                    menu.setPrice(rs.getInt("price")); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu; 
    }

    public int insertOrder(OrderTO order) {
        int result = 0;
        
        String sql = "insert into orders (customer_number, menu_id, selected_options, final_price, customer_name, customer_address, customer_phone) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, order.getCustomerNumber());
            psmt.setInt(2, order.getMenuId()); 
            psmt.setString(3, order.getSelectedOptions());
            psmt.setInt(4, order.getFinalPrice()); 
            psmt.setString(5, order.getCustomerName()); 
            psmt.setString(6, order.getCustomerAddress());
            psmt.setString(7, order.getCustomerPhone());

            result = psmt.executeUpdate(); 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * 5. 주문 결과 조회 (orderResult.jsp)
     * - order_id에 해당하는 주문 상세 내역을 조회합니다.
     */
    public OrderTO getOrderDetail(int orderId) { 
        OrderTO order = null;
        String sql = "select * from orders where order_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, orderId);
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    order = new OrderTO();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setCustomerNumber(rs.getInt("customer_number"));
                    order.setMenuId(rs.getInt("menu_id"));
                    order.setSelectedOptions(rs.getString("selected_options"));
                    order.setFinalPrice(rs.getInt("final_price"));
                    order.setOrderTime(rs.getString("order_time"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setCustomerAddress(rs.getString("customer_address"));
                    order.setCustomerPhone(rs.getString("customer_phone"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    /**
     * 6. 주문 취소/삭제 (Delete 평가 항목 충족)
     * - orders 테이블에서 해당 주문 내역을 삭제합니다.
     */
    public int deleteOrder(int orderId) {
        int result = 0;
        String sql = "delete from orders where order_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, orderId);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    //crud 항목추가
 // 내 주문 목록 (Read)
    public List<OrderTO> getOrderList(int customerNumber) {
        List<OrderTO> list = new ArrayList<>();
        String sql = "select * from orders where customer_number = ? order by order_id desc";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, customerNumber);
            try (ResultSet rs = psmt.executeQuery()) {
                while (rs.next()) {
                    OrderTO order = new OrderTO();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setMenuId(rs.getInt("menu_id"));
                    order.setSelectedOptions(rs.getString("selected_options"));
                    order.setFinalPrice(rs.getInt("final_price"));
                    order.setOrderTime(rs.getString("order_time"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setCustomerAddress(rs.getString("customer_address"));
                    order.setCustomerPhone(rs.getString("customer_phone"));
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 배송지 수정 (Update) ★ 평가 항목
    public int updateOrder(OrderTO order) {
        int result = 0;
        String sql = "update orders set customer_address = ?, customer_phone = ? where order_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

        	psmt.setString(1, order.getCustomerAddress());
        	psmt.setString(2, order.getCustomerPhone());
        	psmt.setInt(3, order.getOrderId());
        	
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}