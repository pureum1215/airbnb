package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mainPage.mainPropertyDetail.MainPropertyDetailVO;

public class PropertyDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PropertyDAO() {
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
	
	/***********************************************************************
	 * 숙소 검색, 숙소 목록 보여주기, 숙소 등록, 숙소 상세 정보 표시, 
	 * 지도에 등록, 지도로 검색, 숙소 사진 등록 -> 따로 조사 필요
	 * (호스트의 숙소 수정, 관리자의 숙소 정보 삭제)
	 ***********************************************************************/
	
	
	/***
	 * 
	 * @param propertyId
	 * @return 숙소 이름 가져오기, 사진 가져오기, 숙소설명 가져오기
	 */
	public MainPropertyDetailVO propertyNPD(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT property_name, property_photo_url, property_description FROM property WHERE property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            madVO.setProperty_name(rs.getString(1));
	            madVO.setProperty_photo_url(rs.getString(2));
	            madVO.setProperty_description(rs.getString(3));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		
		return madVO;
	}
	
	
	/***
	 * 
	 * @param propertyId
	 * @return Locationcity, Location_country, Location_continent
	 */
	public MainPropertyDetailVO propertyLocation(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT lo.location_city, lo.location_country,lo.location_continent from property pr\n"
					+ "left join location lo\n"
					+ "on pr.location_id = lo.location_id\n"
					+ "where pr.property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	madVO.setLocation_city(rs.getString(1));
	            madVO.setLocation_country(rs.getString(2));
	            madVO.setLocation_continent(rs.getString(3));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return madVO;
	}
	
	
	/***
	 * 
	 * @param propertyId
	 * @return property_room, property_bed, property_bathroom
	 */
	public MainPropertyDetailVO propertyBath(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		try {
			String sql = "select property_room, property_bed, property_bathroom from property where property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	madVO.setProperty_room(rs.getInt(1));
	            madVO.setProperty_bed(rs.getInt(2));
	            madVO.setProperty_bathroom(rs.getInt(3));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		return madVO;
	}
	
	public MainPropertyDetailVO propertyAvgCount(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT \n"
					+ "    COUNT(*) AS review_count,\n"
					+ "    ROUND(AVG(property_review_rating), 2) AS avg_rating\n"
					+ "FROM property_review\n"
					+ "WHERE property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	madVO.setProperty_review_count(rs.getInt(1));
	            madVO.setProperty_review_avg(rs.getDouble(2));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return madVO;
	}
	
	public MainPropertyDetailVO propertyHostName(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT u.user_name, h.host_created_at\n"
					+ "FROM property p\n"
					+ "JOIN host h ON p.host_id = h.host_id\n"
					+ "JOIN user u ON h.user_id = u.user_id\n"
					+ "WHERE p.property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	madVO.setUser_name(rs.getString(1));;
	        	madVO.setHost_created_at(rs.getString(2));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		
		return madVO;
	}
}