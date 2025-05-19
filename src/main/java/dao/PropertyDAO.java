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
	 * @return 숙소 이름 가져오기
	 */
	public String propertyName(String propertyId) {
		String propertyName_rs = null;
		try {
			String sql = "SELECT property_name FROM property WHERE property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            propertyName_rs = rs.getString("property_name");
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		return propertyName_rs;
	}
	
	/***
	 * 
	 * @param propertyId
	 * @return 숙소 사진 가져오기
	 */
	public String propertyPhoto(String propertyId) {
		String propertyPhoto_rs = null;
		
		try {
			String sql = "SELECT property_photo_url FROM property WHERE property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            propertyPhoto_rs = rs.getString("property_photo_url");
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return propertyPhoto_rs;
		
	}
	
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
	        	madVO.setLocation_city(rs.getString("lo.location_city"));
	            madVO.setLocation_country(rs.getString("lo.location_country"));
	            madVO.setLocation_continent(rs.getString("lo.location_continent"));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return madVO;
	}
}