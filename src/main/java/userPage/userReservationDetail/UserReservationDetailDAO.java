package userPage.userReservationDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserReservationDetailDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserReservationDetailDAO() {
		System.out.println("생성 체크");
		
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
		} catch (Exception e) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	
	// reservation detail 출력
	public UserReservationDetailVO reservationList(String reservation_id) {
		System.out.println("reservationList method 호출");
		
		UserReservationDetailVO vo = new UserReservationDetailVO();
		String sql = "SELECT r.property_id, p.property_name, p.property_photo_url, "
				+ "p.price_per_night, p.property_description"
				+ "l.location_country, l.location_city, "
				+ "h.host_id, u.user_name, h.host_bio, "
				+ "r.reservation_check_in, r.reservation_check_out, "
				+ "pay.payment_id, pay.payment_price, "
				+ "pre.property_review_id, pre.property_review_rating, "
				+ "pre.property_review_content, pre.property_review_created_at "
				+ "FROM reservation r "
				+ "JOIN property p ON r.property_id = p.property_id "
        		+ "JOIN location l ON p.location_id = l.location_id "
        		+ "JOIN host h ON p.host_id = h.host_id "
        		+ "JOIN user u ON h.user_id = u.user_id "
        		+ "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
        		+ "LEFT JOIN property_review pre ON p.property_id = pre.property_id "
        		+ "WHERE r.reservation_id = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setProperty_id(rs.getString("property_id"));
				vo.setProperty_photo_url(rs.getString("property_photo_url"));
				vo.setProperty_name(rs.getString("property_name"));
				vo.setProperty_description(rs.getString("property_description"));
				vo.setLocation_country(rs.getString("location_country"));
				vo.setLocation_city(rs.getString("location_city"));
				vo.setPrice_per_night(rs.getInt("price_per_night"));
				vo.setHost_id(rs.getString("host_id"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setHost_bio(rs.getString("host_bio"));
				vo.setReservation_check_in(rs.getDate("reservation_check_in"));
				vo.setReservation_check_out(rs.getDate("reservation_check_out"));
				vo.setPayment_id(rs.getString("payment_id"));
				vo.setPayment_price(rs.getInt("payment_price"));
				vo.setProperty_review_id(rs.getString("property_review_id"));
				vo.setProperty_review_rating(rs.getInt("property_review_rating"));
				vo.setProperty_review_content(rs.getString("property_review_content"));
				vo.setProperty_review_created_at(rs.getTimestamp("property_review_created_at"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			closeCon();
		}
		
		return vo;
	}

}
