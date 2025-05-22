package hostPage.hostReservationList;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class HostReservationDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostReservationDAO() {
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
	
	// host page 에서 upcoming 예약 목록 불러오기
	public List<HostReservationListVO> getUpcomingReservations(String host_id) {
	    List<HostReservationListVO> list = new ArrayList<>();
	    try {
	    	String sql = "SELECT r.reservation_id, r.property_id, r.user_id, "
	    			+ "r.reservation_check_in, r.reservation_check_out, r.reservation_created_at, r.reservation_confirm, " 
	    			+ "p.property_name, p.price_per_night, p.property_photo_url, "
	                + "u.user_name, "
	                + "l.location_city, l.location_country, "
	                + "pay.payment_id, pay.payment_status "
	                + "FROM reservation r " 
	                + "JOIN property p ON r.property_id = p.property_id "
	                + "JOIN host h ON p.host_id = h.host_id "
	                + "JOIN user u ON r.user_id = u.user_id "
	                + "JOIN location l ON p.location_id = l.location_id "
	                + "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
	                + "WHERE h.host_id = ? "
	        		+ "AND r.reservation_check_in > CURRENT_DATE "
	        		+ "ORDER BY r.reservation_created_at ASC;";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, host_id);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Date checkIn = rs.getDate("reservation_check_in");
	            Date checkOut = rs.getDate("reservation_check_out");
	            int pricePerNight = rs.getInt("price_per_night");

	            // 일수 계산 (체크아웃 - 체크인)
	            long millis = checkOut.getTime() - checkIn.getTime();
	            int days = (int) (millis / (1000 * 60 * 60 * 24));

	            int totalPrice = days * pricePerNight;
	            
	        	HostReservationListVO vo = new HostReservationListVO();
	        	vo.setProperty_id(rs.getString("property_id"));
	        	vo.setProperty_photo_url(rs.getString("property_photo_url"));
	        	vo.setProperty_name(rs.getString("property_name"));
	        	vo.setLocation_country(rs.getString("location_country"));
	        	vo.setLocation_city(rs.getString("location_city"));
	        	vo.setTotal_price(totalPrice);
	        	vo.setReservation_id(rs.getString("reservation_id"));
	        	vo.setUser_id(rs.getString("user_id"));
	        	vo.setUser_name(rs.getString("user_name"));
	        	vo.setReservation_check_in(checkIn);
	        	vo.setReservation_check_out(checkOut);
	        	vo.setReservation_confirm(rs.getString("reservation_confirm"));
	        	vo.setPayment_status(rs.getString("payment_status"));
	        	vo.setReservation_created_at(rs.getTimestamp("reservation_created_at"));
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
	
	public List<HostReservationListVO> getHistoryReservations(String host_id) {
	    List<HostReservationListVO> list = new ArrayList<>();
	    try {
	    	String sql = "SELECT r.reservation_id, r.property_id, r.user_id, "
	    			+ "r.reservation_check_in, r.reservation_check_out, r.reservation_created_at, r.reservation_confirm, " 
	    			+ "p.property_name, p.price_per_night, p.property_photo_url, "
	                + "u.user_name, "
	                + "l.location_city, l.location_country, "
	                + "pay.payment_id, pay.payment_status "
	                + "FROM reservation r " 
	                + "JOIN property p ON r.property_id = p.property_id "
	                + "JOIN host h ON p.host_id = h.host_id "
	                + "JOIN user u ON r.user_id = u.user_id "
	                + "JOIN location l ON p.location_id = l.location_id "
	                + "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
	                + "WHERE h.host_id = ? "
	        		+ "ORDER BY r.reservation_created_at ASC;";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, host_id);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Date checkIn = rs.getDate("reservation_check_in");
	            Date checkOut = rs.getDate("reservation_check_out");
	            int pricePerNight = rs.getInt("price_per_night");

	            // 일수 계산 (체크아웃 - 체크인)
	            long millis = checkOut.getTime() - checkIn.getTime();
	            int days = (int) (millis / (1000 * 60 * 60 * 24));

	            int totalPrice = days * pricePerNight;
	            
	        	HostReservationListVO vo = new HostReservationListVO();
	        	vo.setProperty_id(rs.getString("property_id"));
	        	vo.setProperty_photo_url(rs.getString("property_photo_url"));
	        	vo.setProperty_name(rs.getString("property_name"));
	        	vo.setLocation_country(rs.getString("location_country"));
	        	vo.setLocation_city(rs.getString("location_city"));
	        	vo.setTotal_price(totalPrice);
	        	vo.setReservation_id(rs.getString("reservation_id"));
	        	vo.setUser_id(rs.getString("user_id"));
	        	vo.setUser_name(rs.getString("user_name"));
	        	vo.setReservation_check_in(checkIn);
	        	vo.setReservation_check_out(checkOut);
	        	vo.setReservation_confirm(rs.getString("reservation_confirm"));
	        	vo.setPayment_status(rs.getString("payment_status"));
	        	vo.setReservation_created_at(rs.getTimestamp("reservation_created_at"));
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
