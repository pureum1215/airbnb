package mainPage.mainPropertyList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MainPropertyListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MainPropertyListDAO() {
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
	

	public List<MainPropertyListVO> allgetProperty() {
		List<MainPropertyListVO> lists = new ArrayList<MainPropertyListVO>();
		
		try {
			String sql = "select property_id, property_name, property_photo_url from property";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MainPropertyListVO vo = new MainPropertyListVO();
				vo.setProperty_id(rs.getString(1));
				vo.setProperty_name(rs.getString(2));
				vo.setProperty_photo_url(rs.getString(3));
				lists.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("오류");
			
		}
		
		System.out.println("check-d: "+lists.size());
		return lists;
	}
	

	
	// 로그인시 목록 최종 출력
	public List<MainPropertyListVO> getPropertyList( List<String> property_id_list ) {
		System.out.println("getPropertyList method 호출");
		
	    // 최종 결과 리스트
	    List<MainPropertyListVO> resultList = new ArrayList<>();
	    
		try {
			// 각 데이터 가져오기
			List<MainPropertyListVO> property_info_list = getPropertyInfo(property_id_list);
			Map<String, Double> property_rating = getPropertyAverageRating(property_id_list);

			
		    // 순차적으로 모든 정보 VO에 담기
		    for (int i = 0; i < property_info_list.size(); i++) {
		        MainPropertyListVO vo = property_info_list.get(i);
		        String propertyId = vo.getProperty_id();
	
		        // 평균 별점 세팅
		        if (property_rating.containsKey(propertyId)) {
		            vo.setProperty_review_rating(property_rating.get(propertyId));
		        } 
		        else {
		            vo.setProperty_review_rating(0.0); // 별점 없는 경우 0 처리
		        }

		        resultList.add(vo);
		    }
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			closeCon();
		}
		
		return resultList;
	}
	
	
	// 숙소 기본 정보 vo에 담기
	public List<MainPropertyListVO> getPropertyInfo ( List<String> property_id_list ) 
			throws SQLException, IOException {
		System.out.println("getPropertyInfo method 호출");
		
		List<MainPropertyListVO> property_info_list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder(
		        "SELECT p.property_id, p.property_name, p.property_photo_url, "
		      + "l.location_country, l.location_city, "
		      + "p.property_description, p.price_per_night "
		      + "FROM property p "
		      + "JOIN location l ON p.location_id = l.location_id "
		      + "WHERE p.property_id IN ("
		    );
		for (int i = 0; i < property_id_list.size(); i++) {
		        sql.append("?");
		        if (i < property_id_list.size() - 1) sql.append(",");
		}
		sql.append(")");
		
        pstmt = conn.prepareStatement(sql.toString());
        for (int i = 0; i < property_id_list.size(); i++) {
            pstmt.setString(i + 1, property_id_list.get(i));
        }
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	MainPropertyListVO vo = new MainPropertyListVO();
        	vo.setProperty_id(rs.getString("property_id"));
        	vo.setProperty_name(rs.getString("property_name"));
        	vo.setProperty_photo_url(rs.getString("property_photo_url"));
        	vo.setLocation_country(rs.getString("location_country"));
        	vo.setLocation_city(rs.getString("location_city"));
        	vo.setProperty_description(rs.getString("property_description"));
        	vo.setPrice_per_night(rs.getInt("price_per_night"));
        	property_info_list.add(vo);
        }
        
        return property_info_list;
	}
	
	// 숙소별 평균 별점 구하기
	public Map<String, Double> getPropertyAverageRating( List<String> property_id_list) 
			throws SQLException, IOException {
		System.out.println("getPropertyAverageRating method 호출");
		
		Map<String, Double> property_rating = new HashMap<>();
		
		StringBuilder sql = new StringBuilder("SELECT property_id, AVG(property_review_rating) AS avg_rating FROM property_review WHERE property_id IN (");
	    for (int i = 0; i < property_id_list.size(); i++) {
	        sql.append("?");
	        if (i < property_id_list.size() - 1) sql.append(",");
	    }
	    sql.append(") GROUP BY property_id");
	    
	    pstmt = conn.prepareStatement(sql.toString());
        for (int i = 0; i < property_id_list.size(); i++) {
            pstmt.setString(i + 1, property_id_list.get(i));
        }
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            String propertyId = rs.getString("property_id");
            double avgRating = rs.getDouble("avg_rating");
            property_rating.put(propertyId, avgRating);
        }
        
        return property_rating;
	}
	
	// userId에 따라 위시리스트에 있는지 확인하기
	public List<String> getWishListProperty( String userId ) 
			throws SQLException, IOException {
		System.out.println("getWishListProperty method 호출");
		
		List<String> wishList = new ArrayList<>();
		
		String sql = "SELECT property_id FROM wish_list WHERE user_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		
        while (rs.next()) {
            wishList.add(rs.getString("property_id"));
        }
        
        return wishList;
	}
	
	
	// 모든 property_id list에 담기
	public List<String> getAllPropertyId() throws SQLException, IOException {
		System.out.println("getAllPropertyId method 호출");
		
		List<String> list = new ArrayList<>();
		
		String sql = "SELECT property_id FROM PROPERTY "
				+ "WHERE property_delete_yn = 'N'";
		
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
		
        while (rs.next()) {
        	String propertyId = rs.getString("property_id");
            list.add(propertyId);
        }
		return list;
	}
	
}
