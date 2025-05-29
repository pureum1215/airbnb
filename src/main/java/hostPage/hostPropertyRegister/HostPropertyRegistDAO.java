package hostPage.hostPropertyRegister;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostPropertyRegistDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Connection getHostPropertyRegistDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			return ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
	 * idx check 용 작성
	 ******************************************************************/
	// idx check
	public int initPropertyIdxCount() {
		conn = getHostPropertyRegistDAO();
		try {
			String sql = "select count(*)+1 as cnt from Property where property_id like 'prop%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (SQLException e) {
			System.out.println("wow");
			e.printStackTrace();
		}
		return 0;
	}

	public int getAmenityById(String amenity_name) {
		conn = getHostPropertyRegistDAO();

		String sql = "SELECT amenity_id FROM amenities WHERE amenity_name = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, amenity_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getInt("amenity_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeCon();
		}

		return -1;
	}



	/*****
	 * 
	 * location_id와 amenity_id를 연관시켜야 함. 필요한 값 host_id amenity_id property_name
	 * property_description price_per_night property_room property_bed
	 * property_bathroom property_reservation_default
	 * 
	 * @return
	 *************/
	// property 테이블에 삽입
	public boolean hostPropertyRegister(HostPropertyRegisterVO propvo) {
		conn = getHostPropertyRegistDAO();

		String sql = "Insert into property (property_id, host_id, property_name, "
				+ "property_description, price_per_night, property_room, property_bed, property_bathroom, "
				+ "property_reservation_default, property_photo_url, property_delete_yn) ";
		sql += "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, propvo.getProperty_id());
			pstmt.setString(2, propvo.getHost_id());
			pstmt.setString(3, propvo.getProperty_name());
			pstmt.setString(4, propvo.getProperty_description());
			pstmt.setInt(5, propvo.getPrice_per_night());
			pstmt.setInt(6, propvo.getProperty_room());
			pstmt.setInt(7, propvo.getProperty_bed());
			pstmt.setInt(8, propvo.getProperty_bathroom());
			pstmt.setString(9, propvo.getProperty_reservation_default());
			pstmt.setString(10, propvo.getProperty_photo_url());

			if (0 < pstmt.executeUpdate()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();

			return false;
		} finally {
			closeCon();
		}

		return false;
	}

	// 편의시설 insert 용
	public boolean insertPropertyAmenities(int amenityIdx, String propertyIdx) {
		conn = getHostPropertyRegistDAO();

		String sql = "INSERT INTO PROPERTY_AMENITIES (AMENITY_ID, PROPERTY_ID) VALUES (?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amenityIdx);
			pstmt.setString(2, propertyIdx);

			if (pstmt.executeUpdate() > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeCon();
		}

		return false;
	}
	
	
	// location 테이블에 삽입.
	public boolean locationInsert(HostPropertyRegisterVO locvo) {
		conn = getHostPropertyRegistDAO();
		String sql = "INSERT INTO Location (location_id, location_city, location_country, location_continent, "
				+ "location_detail, location_x, location_y)";
		sql += "VALUES(?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locvo.getLocation_id());// loc +idx
			pstmt.setString(2, locvo.getLocation_city());// addr에서 잘라서 도시 알기
			pstmt.setString(3, locvo.getLocation_country());
			pstmt.setString(4, locvo.getLocation_continent());

			pstmt.setString(5, locvo.getLocation_detail());
			pstmt.setDouble(6, locvo.getLocation_x());
			pstmt.setDouble(7, locvo.getLocation_y());

			if (0 < pstmt.executeUpdate()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();

			return false;
		} finally {
			closeCon();
		}

		return false;
	}
	
	
	//위치 등록 후, property에 location 등록 
	public boolean registerPropertyAddLocation(String locationIdx, String propertyIdx) {
		conn = getHostPropertyRegistDAO();
		
		
		String sql = "UPDATE Property "
				+ "SET LOCATION_ID = ? "
				+ "WHERE PROPERTY_ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locationIdx);
			pstmt.setString(2, propertyIdx);

			if (pstmt.executeUpdate() > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeCon();
		}
		
		return false;
	}

}
