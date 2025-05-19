package reservationPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservationPage.reservationPayment.ReservationPaymentVO;
import reservationPage.reservationRequest.ReservationRequestVO;

import java.sql.Date;

public class ReservationDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ReservationDAO() {
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
	
	// reservation default 값 불러오기
	public String getReservationType(String propertyId) {
	    String reservationDefault = null;
		String sql = "SELECT property_reservation_request FROM property WHERE property_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, propertyId);
			rs = pstmt.executeQuery();
			
	        if (rs.next()) {
	        	reservationDefault = rs.getString("property_reservation_request");
	        }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeCon();
		}
	    return reservationDefault;
	}
	
	// db에 저장된 마지막 예약 번호 가져오기
	public String getLastReservationId() {
	    String lastId = "res000";
	    try {
	        String sql = "SELECT reservation_id FROM reservation ORDER BY reservation_id DESC LIMIT 1";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            lastId = rs.getString(1);
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	    return lastId;
	}
	
	// 예약 db에 값 등록
	public int reservationRequest(ReservationRequestVO vo) {
		int result = 0;
		
	    try {
	        String sql = "INSERT INTO reservation (reservation_id, property_id, user_id, reservation_check_in, reservation_check_out, reservation_created_at) " +
	                     "VALUES (?, ?, ?, ?, ?, NOW())";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vo.getReservation_id());
	        pstmt.setString(2, vo.getProperty_id());
	        pstmt.setString(3, vo.getUser_id());
	        pstmt.setDate(4, vo.getReservation_check_in());
	        pstmt.setDate(5, vo.getReservation_check_out());

	        result = pstmt.executeUpdate();

	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	    
		return result;
	}
	
	// db에 저장된 마지막 payment id 불러오기
	public String getLastPaymentId() {
		String lastId = "pay000";
	    try {
	        String sql = "SELECT payment_id FROM payment ORDER BY payment_id DESC LIMIT 1";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            lastId = rs.getString(1);
	        }
	    }
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	    return lastId;
	}
	
	// 전체 요금 가져오기
	public int getTotalPrice(String propertyId) {
		int totalPrice = 0;
		try {
			String sql = "SELECT r.reservation_check_in, r.reservation_check_out, p.price_per_night "
					+ "FROM reservation r"
		            + "JOIN property p ON r.property_id = p.property_id"
		            + "WHERE r.reservation_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            Date checkIn = rs.getDate("reservation_check_in");
	            Date checkOut = rs.getDate("reservation_check_out");
	            int pricePerNight = rs.getInt("price_per_night");

	            // 일수 계산 (체크아웃 - 체크인)
	            long millis = checkOut.getTime() - checkIn.getTime();
	            int days = (int) (millis / (1000 * 60 * 60 * 24));

	            totalPrice = days * pricePerNight;
	        }
	    } 
		catch (Exception e) {
	        e.printStackTrace();
	    } 
		finally {
	        closeCon();
	    }
		return totalPrice;
	}
	
	// 결제 db에 값 등록
	public int reservationPayment(ReservationPaymentVO vo) {
		int result = 0;
		
	    try {
	        String sql = "INSERT INTO payment (payment_id, reservation_id, payment_price, payment_method, payment_status, payment_created_at) "
	        		+ "VALUES (?, ?, ?, ?, ?, NOW())";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vo.getPayment_id());
	        pstmt.setString(2, vo.getReservation_id());
	        pstmt.setInt(3, vo.getPayment_price());
	        pstmt.setString(4, vo.getPayment_method());
	        pstmt.setString(5, "결제 완료");

	        result = pstmt.executeUpdate();
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
		
		return result;
	}


}
