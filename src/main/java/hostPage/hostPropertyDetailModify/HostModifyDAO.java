package hostPage.hostPropertyDetailModify;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostModifyDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostModifyDAO() {
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
	//숙소 이름, 숙소 설명, 숙소 가격, 숙소 방 개수, 숙소 침대 수, 숙소 화장실 수, 숙소 승인 요청, 숙소 사진
	public int hostPropertyname(HostPropertyDetailModifyVO vo) {
		int result =0;
		String sql = "UPDATE property "
				+ "SET property_name = ?, property_description = ?, price_per_night = ?, "
				+ "property_room = ?, property_bed = ?, property_bathroom = ?, "
				+ "property_reservation_default = ?,property_photo_url = ? "
				+ "WHERE property_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getProperty_name());
			pstmt.setString(2, vo.getProperty_description());
			pstmt.setInt(3, vo.getPrice_per_night());
			pstmt.setInt(4, vo.getProperty_room());
			pstmt.setInt(5, vo.getProperty_bed());
			pstmt.setInt(6, vo.getProperty_bathroom());
			pstmt.setString(7, vo.getProperty_reservation_default()); // 예: "즉시 예약", "예약 요청"
			pstmt.setString(8, vo.getProperty_photo_url());
			pstmt.setString(9, vo.getProperty_id());
			result = pstmt.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	
	//편의시설 delete 용
	public boolean deleteProAm(String propertyId) {
	    boolean result = false;

	    String sql = "DELETE FROM Property_Amenities WHERE property_id = ?";

	    try {
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        int rows = pstmt.executeUpdate();
	        if (rows > 0) {
	            result = true; // 삭제 성공
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 

	    return result;
	}
	
	
	//편의시설 insert 용
	public boolean insertPropertyAmenities(String propertyId, List<Integer> amenityIds) {
	    boolean result = false;
	    String sql = "INSERT INTO Property_Amenities (amenity_id, property_id) VALUES (?, ?)";

	    try {
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        for (int amenityId : amenityIds) {
	            pstmt.setInt(1, amenityId);
	            pstmt.setString(2, propertyId);
	            pstmt.addBatch(); // 배치 추가
	        }

	        int[] affectedRows = pstmt.executeBatch(); // 일괄 실행
	        result = Arrays.stream(affectedRows).allMatch(row -> row > 0);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 

	    return result;
	}

}
