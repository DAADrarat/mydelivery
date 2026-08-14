package mydelivery;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
	static String url = "jdbc:mysql://localhost:3306/newhr";
	static String userName = "root";
	static String password = "rootroot";
	
	//방명록 목록을 리턴한다.
	public static List<CustomerTO> getList() {
		List<CustomerTO> result = new ArrayList<CustomerTO>();
		try(Connection conn = DBUtil.getConnection()) {
			String sql = "select * from CustomerTO";
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				CustomerTO cu = new CustomerTO();
				cu.setCuId(rs.getInt("cu_id"));
				cu.setCuUserId(rs.getString("cu_name"));
				cu.setCuPasswd(rs.getString("cu_comdept"));
				cu.setCuName(rs.getString("cu_email"));
				cu.setCuPhone(rs.getString("cu_birth"));
				cu.setCuAddress(rs.getString("cu_tel"));
				result.add(cu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
