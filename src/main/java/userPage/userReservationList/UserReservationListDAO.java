package userPage.userReservationList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserReservationListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserReservationListDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeCon() {
		try {
			if (rs != null)
				rs.close();
		} 
		catch (Exception e) {}
		try {
			if (pstmt != null)
				pstmt.close();
		} 
		catch (Exception e) {}
		try {
			if (conn != null)
				conn.close();
		} 
		catch (Exception e) {}
	}
	
	// user page 에서 upcoming 예약 목록 불러오기
	public List<UserReservationListVO> getUpcomingReservations(String userId) {
	    List<UserReservationListVO> list = new ArrayList<>();
        String sql = "SELECT * FROM reservation "
        		+ "WHERE user_id = ? AND reservation_check_in >= CURDATE() "
        		+ "ORDER BY reservation_check_in ASC";
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	UserReservationListVO vo = new UserReservationListVO();
	        	vo.setProperty_id(rs.getString("Property_id"));
	        	vo.setReservation_check_in(rs.getDate("check_in"));
	        	vo.setReservation_check_out(rs.getDate("check_out"));
	            list.add(vo);
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }

	    return list;
	} 

}
