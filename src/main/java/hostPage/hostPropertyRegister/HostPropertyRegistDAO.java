package hostPage.hostPropertyRegister;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostPropertyRegistDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostPropertyRegistDAO() {
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
	
	/******************************************************************
	 *  idx check 용 작성
	 ******************************************************************/
	//idx check
	public int initPropertyIdxCount() {
		try {
			String sql = "select count(*)+1 as cnt from Property where property_id like 'prop%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		}
		catch(SQLException e) {
			System.out.println("wow");
		}
		return 0;
	}
	
	
	
	
	/*****
	 * 
	 * location_id와 amenity_id를 연관시켜야 함.
	 * 필요한 값 host_id amenity_id property_name property_description price_per_night property_room
	 * property_bed property_bathroom property_reservation_default
	 * 
	 * @return
	 *************/
	//property 테이블 생성.
	public boolean hostPropertyRegister() {
		String sql = "Insert into property (property_id, host_id, location_id, amenity_id, property_name, "
				+ "property_description, price_per_night, property_room, property_bed, property_bathroom, "
				+ "property_reservation_default, property_photo_url, property_delete_yn) ";
		sql += "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')";
		
		
		
		
		return false;
	}
	
	
	//Amenities + Location
	
}
