package mainPage.mainPropertyList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MainPropertyListSearchDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MainPropertyListSearchDAO() {
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
	
	
	// 모든 property_id list에 담기
	public List<String> getAllPropertyId() throws SQLException, IOException {
		System.out.println("getAllPropertyId method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id FROM PROPERTY";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
            list.add(propertyId);
        }
		return list;
	}
	
	
	
	// 가격 필터
	public List<String> filterByPrice(int min_price, int max_price) throws SQLException, IOException {
		System.out.println("filterByPrice method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property "
				+ "WHERE price_per_night BETWEEN ? AND ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setInt(1, min_price);
        	pstmt.setInt(1, max_price);
            list.add(propertyId);
        }
		return list;
	}
	
	// 대륙 필터
	public List<String> filterByContinent(String continent) throws SQLException, IOException {
		System.out.println("filterByContinent method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT p.property_id "
				+ "FROM property p "
				+ "JOIN location l ON p.location_id = l.location_id "
				+ "WHERE l.location_countinent = ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setString(1, continent);
            list.add(propertyId);
        }
		return list;
	}
	
	// 나라 필터
	public List<String> filterByCountry(String country) throws SQLException, IOException {
		System.out.println("filterByCountry method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT p.property_id "
				+ "FROM property p "
				+ "JOIN location l ON p.location_id = l.location_id "
				+ "WHERE l.location_country = ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setString(1, country);
            list.add(propertyId);
        }
		return list;
	}
	
	// 도시 필터
	public List<String> filterByCity(String city) throws SQLException, IOException {
		System.out.println("filterByCity method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT p.property_id "
				+ "FROM property p "
				+ "JOIN location l ON p.location_id = l.location_id "
				+ "WHERE l.location_city = ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setString(1, city);
            list.add(propertyId);
        }
		return list;
	}
	
	// 침실 수 필터
	public List<String> filterByRoom(int room) throws SQLException, IOException {
		System.out.println("filterByRoom method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property "
				+ "WHERE property_room >= ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setInt(1, room);
            list.add(propertyId);
        }
		return list;
	}
	
	// 침대 수 필터
	public List<String> filterByBed(int bed) throws SQLException, IOException {
		System.out.println("filterByBed method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property "
				+ "WHERE property_bed >= ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setInt(1, bed);
            list.add(propertyId);
        }
		return list;
	}
	
	// 욕실 수 필터
	public List<String> filterByBath(int bath) throws SQLException, IOException {
		System.out.println("filterByBath method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property "
				+ "WHERE property_bath >= ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setInt(1, bath);
            list.add(propertyId);
        }
		return list;
	}
	
	
	// 날짜 필터
	public List<String> filterByDate(Date check_in, Date check_out) throws SQLException, IOException {
		System.out.println("filterByDate method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property p "
				+ "WHERE NOT EXISTS (" 
				+ "SELECT 1 "
				+ "FROM reservation r " 
				+ "WHERE r.property_id = p.property_id " 
				+ "AND ((r.check_in < ? AND r.check_out > ?) " 
				+ "OR (r.check_in >= ? AND r.check_in < ?) " 
				+ "OR (r.check_out > ? AND r.check_out <= ?)))";
		
        pstmt = conn.prepareStatement(sql);
        pstmt.setDate(1, check_out);
        pstmt.setDate(2, check_in);
        pstmt.setDate(3, check_in);
        pstmt.setDate(4, check_out);
        pstmt.setDate(5, check_in);
        pstmt.setDate(6, check_out);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
            list.add(propertyId);
        }
		return list;
	}
	
	// 편의시설 필터 - 필터에 체크한 모든 편의시설을 포함하는 숙소 검색
	public List<String> filterByAmenities( String[] amenities, MainPropertyListSearchDAO dao ) throws SQLException, IOException {
		System.out.println("filterByAmenities method 호출");
		
		List<String> list = new ArrayList<>();
		List<String> filter_list = new ArrayList<>();
		
		for ( int i = 0; i < amenities.length; i++ ) {
			filter_list = dao.filterByAmenitySet(amenities[i]);
			list.retainAll(filter_list);
		}
		
		return list;
	}
	
	// 편의시설 필터 - 편의시설 하나를 포함하는 숙소 검색
	public List<String> filterByAmenitySet( String amenities ) throws SQLException, IOException {
		System.out.println("filterByAmenitySet method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id "
				+ "FROM property_amenities p "
				+ "JOIN amenities a ON p.amenity_id = a.amenity_id "
				+ "WHERE amenity_name = ? ";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
        	pstmt.setString(1, amenities);
            list.add(propertyId);
        }
				
		return list;
	}
	
}
