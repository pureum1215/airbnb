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
	public List<UserReservationListVO> getUpcomingReservations(String user_id) {
	    List<UserReservationListVO> list = new ArrayList<>();
	    try {
	    	String sql = "SELECT r.reservation_id, r.property_id, p.property_name, p.property_photo_url,"
        		+ "l.location_city, l.location_country, "
        		+ "r.reservation_check_in, r.reservation_check_out, r.reservation_confirm, "
        		+ "pay.payment_status "
        		+ "FROM reservation r "
        		+ "JOIN property p ON r.property_id = p.property_id "
        		+ "JOIN location l ON p.location_id = l.location_id "
        		+ "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
        		+ "WHERE r.user_id = ? "
        		+ "AND r.reservation_check_in > CURRENT_DATE "
        		+ "ORDER BY r.reservation_check_in ASC;";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	UserReservationListVO vo = new UserReservationListVO();
	        	vo.setProperty_id(rs.getString("property_id"));
	        	vo.setProperty_photo_url(rs.getString("property_photo_url"));
	        	vo.setProperty_name(rs.getString("property_name"));
	        	vo.setCountry(rs.getString("location_country"));
	        	vo.setCity(rs.getString("location_city"));
	        	vo.setReservation_id(rs.getString("reservation_id"));
	        	vo.setReservation_confirm(rs.getString("reservation_confirm"));
	        	vo.setPayment_status(rs.getString("payment_status"));
	        	vo.setReservation_check_in(rs.getDate("reservation_check_in"));
	        	vo.setReservation_check_out(rs.getDate("reservation_check_out"));
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
	
	public List<UserReservationListVO> getHistoryReservations(String user_id) {
	    List<UserReservationListVO> list = new ArrayList<>();
	    try {
	    	String sql = "SELECT r.reservation_id, r.property_id, p.property_name, p.property_photo_url,"
        		+ "l.location_city, l.location_country, "
        		+ "r.reservation_check_in, r.reservation_check_out, r.reservation_confirm, "
        		+ "pay.payment_status "
        		+ "FROM reservation r "
        		+ "JOIN property p ON r.property_id = p.property_id "
        		+ "JOIN location l ON p.location_id = l.location_id "
        		+ "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
        		+ "WHERE r.user_id = ? "
        		+ "ORDER BY r.reservation_check_in ASC;";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	UserReservationListVO vo = new UserReservationListVO();
	        	vo.setProperty_id(rs.getString("property_id"));
	        	vo.setProperty_photo_url(rs.getString("property_photo_url"));
	        	vo.setProperty_name(rs.getString("property_name"));
	        	vo.setCountry(rs.getString("location_country"));
	        	vo.setCity(rs.getString("location_city"));
	        	vo.setReservation_id(rs.getString("reservation_id"));
	        	vo.setReservation_confirm(rs.getString("reservation_confirm"));
	        	vo.setPayment_status(rs.getString("payment_status"));
	        	vo.setReservation_check_in(rs.getDate("reservation_check_in"));
	        	vo.setReservation_check_out(rs.getDate("reservation_check_out"));
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
