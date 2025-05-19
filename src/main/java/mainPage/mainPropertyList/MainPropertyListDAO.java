package mainPage.mainPropertyList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<MainPropertyListSearchVO> searchProperties(MainPropertyListSearchVO criteria) {
	    List<MainPropertyListSearchVO> list = new ArrayList<>();

	    try {
	        StringBuilder sql = new StringBuilder(
	            "SELECT * FROM main_property_list_view WHERE 1=1 "
	        );

	        List<Object> paramList = new ArrayList<>();

	        // 대륙, 나라, 도시
	        if (criteria.getLocation_continent() != null && !criteria.getLocation_continent().isEmpty()) {
	            sql.append("AND location_continent = ? ");
	            paramList.add(criteria.getLocation_continent());
	        }

	        if (criteria.getLocation_country() != null && !criteria.getLocation_country().isEmpty()) {
	            sql.append("AND location_country = ? ");
	            paramList.add(criteria.getLocation_country());
	        }

	        if (criteria.getLocation_city() != null && !criteria.getLocation_city().isEmpty()) {
	            sql.append("AND location_city = ? ");
	            paramList.add(criteria.getLocation_city());
	        }

	        // 예약 날짜 범위
	        if (criteria.getReservation_check_in() != null && criteria.getReservation_check_out() != null) {
	            sql.append("AND property_id NOT IN ( ")
	               .append("SELECT property_id FROM reservation ")
	               .append("WHERE NOT (reservation_check_out <= ? OR reservation_check_in >= ?) ) ");
	            paramList.add(criteria.getReservation_check_in());
	            paramList.add(criteria.getReservation_check_out());
	        }

	        // 가격
	        

	        // 편의시설
	       

	        pstmt = conn.prepareStatement(sql.toString());

	        for (int i = 0; i < paramList.size(); i++) {
	            pstmt.setObject(i + 1, paramList.get(i));
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	MainPropertyListSearchVO vo = new MainPropertyListSearchVO();
	            vo.setProperty_id(rs.getString("property_id"));
	            vo.setProperty_photo_url(rs.getString("property_photo_url"));
	            vo.setPrice_per_night(rs.getInt("price_per_night"));
	            vo.setProperty_description(rs.getString("property_description"));
	            vo.setProperty_review_rating(rs.getInt("property_review_rating"));
	            vo.setLocation_city(rs.getString("location_city"));
	            vo.setLocation_country(rs.getString("location_country"));
	            // 기타 필요 데이터 추가
	            list.add(vo);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeCon();
	    }

	    return list;
	}

	public MainPropertyListVO allgetProperty() {
		MainPropertyListVO mpVO = new MainPropertyListVO();
		
		
		
		return mpVO;
	}
}
