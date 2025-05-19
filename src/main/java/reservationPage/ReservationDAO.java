package reservationPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservationPage.reservationRequest.ReservationRequestVO;

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
	
	public int reservation(ReservationRequestVO vo) {
		int result = 0;
		
		return result;
	}
	


}
