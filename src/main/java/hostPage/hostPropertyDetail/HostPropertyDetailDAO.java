package hostPage.hostPropertyDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostPropertyDetailDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostPropertyDetailDAO() {
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
	
	
	//propertyId를 통해서 
	//숙소 이름, 숙소 설명, 숙소 가격, 숙소 방 개수, 숙소 침대 수, 숙소 화장실 수, 숙소 승인 요청, 숙소 사진
	public HostPropertyDetailVO hostProperty(String propertyId) {
		HostPropertyDetailVO vo = new HostPropertyDetailVO();
		
		try {
			String sql = "select property_name, property_description, price_per_night, property_room, property_bed, "
					+ "property_bathroom, property_reservation_default, property_photo_url from property "
					+ "where property_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setProperty_name(rs.getString(1));
				vo.setProperty_description(rs.getString(2));
				vo.setPrice_per_night(rs.getInt(3));
				vo.setProperty_room(rs.getInt(4));
				vo.setProperty_bed(rs.getInt(5));
				vo.setProperty_bathroom(rs.getInt(6));
				vo.setProperty_reservation_default(rs.getString(7));
				vo.setProperty_photo_url(rs.getString(8));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vo;
	}
	
	/***
	 * 편의시설 id 가져온 이후 for 문 돌려서 무엇인지 체크
	 * @param propertyId
	 * @return 편의시설id
	 */
	public List<Integer> propertyAm(String propertyId){
		List<Integer> result = new ArrayList<>();
		
		try {
			String sql = "select am.amenity_id from property_amenities as pa "
					+ "join Amenities am on pa.amenity_id = am.amenity_id "
					+ "where property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	result.add(rs.getInt(1));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return result; 
	}

	public String propertyLocation(String propertyId) {
		String result = null;
		
		try {
			String sql = "select l.location_detail from property p join location l on p.location_id = l.location_id "
					+ "where p.property_id= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			
		} catch(SQLException e) {
			System.out.println("에러");
		}
		
		return result;
	}
}