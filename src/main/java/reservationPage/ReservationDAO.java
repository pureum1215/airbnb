package reservationPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservationPage.reservationRequest.ReservationRequestVO;

import java.sql.Date;
import java.sql.Timestamp;

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
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeCon();
	    }
	    return lastId;
	}
	
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
	


}
