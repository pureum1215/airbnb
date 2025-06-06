package mainPage.mainPropertyDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
			String sql = "SELECT lo.location_city, lo.location_country,lo.location_continent from property pr "
					+ "left join location lo "
					+ "on pr.location_id = lo.location_id "
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
	
	
	
	/***
	 * 
	 * @param propertyId
	 * @return 후기 평균, 후기 개수
	 */
	public MainPropertyDetailVO propertyAvgCount(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT "
					+ "COUNT(*) AS review_count, "
					+ "ROUND(AVG(property_review_rating), 2) AS avg_rating "
					+ "FROM property_review "
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
	
	
	/***
	 * 
	 * @param propertyId
	 * @return 호스트 이름 가져오기, 호스트 생성일자 알기.
	 */
	
	public MainPropertyDetailVO propertyHostName(String propertyId) {
		MainPropertyDetailVO madVO = new MainPropertyDetailVO();
		
		try {
			String sql = "SELECT u.user_name, h.host_created_at ,h.host_id "
					+ "FROM property p "
					+ "JOIN host h ON p.host_id = h.host_id "
					+ "JOIN user u ON h.user_id = u.user_id "
					+ "WHERE p.property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	madVO.setUser_name(rs.getString(1));;
	        	madVO.setHost_created_at(rs.getString(2));
	        	madVO.setHost_id(rs.getString(3));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		
		return madVO;
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
	
	/***
	 * 
	 * @param propertyId
	 * @return 리뷰 내용, 리뷰 생성일자, 리뷰를 쓴 유저 이름 리스트로 값 받아야 함.
	 */
	
	public List<MainPropertyDetailVO> propertyReviewName(String propertyId) {
		
		List<MainPropertyDetailVO> madVO = new ArrayList<MainPropertyDetailVO>();
		
		try {
			String sql = "select pr.property_review_content, pr.property_review_created_at, "
					+ "u.user_name, pr.property_review_rating from property_review pr "
					+ "join user u on pr.user_id = u.user_id where property_id= ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	MainPropertyDetailVO vo = new MainPropertyDetailVO();
	        	vo.setProperty_review_content(rs.getString(1));
	        	vo.setProperty_review_created_at(rs.getString(2));
	        	vo.setUser_name(rs.getString(3));
	        	vo.setProperty_review_rating(rs.getInt(4));
	        	madVO.add(vo);
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}

		return madVO;
	}
	
	
	// 지도 생성용 위도, 경도 가져오기
	public MainPropertyDetailVO getPropertyLatLng(String propertyId) {
	    MainPropertyDetailVO vo = new MainPropertyDetailVO();

	    try {
	        String sql = "SELECT l.location_x, l.location_y FROM property p " +
                    "JOIN location l ON p.location_id = l.location_id " +
                    "WHERE p.property_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, propertyId);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            vo.setLocation_x(rs.getDouble("location_x"));
	            vo.setLocation_y(rs.getDouble("location_y"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return vo;
	}
	
}