package userPage.userProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserProfileDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserProfileDAO() {
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
	
	/***
	 * 
	 * @param userId
	 * @return 유저의 이름 ,생성일자 , 이메일 , 휴대전화 번
	 */
	
	public UserProfileVO profileNC(String userId) {
		UserProfileVO uVO = new UserProfileVO();
		
		try {
			String sql = "select user_name, user_created_at, user_email, user_phone_number from user where user_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            uVO.setUser_name(rs.getString(1));
	            uVO.setUser_created_at(rs.getString(2));
	            uVO.setUser_email(rs.getString(3));
	            uVO.setUser_phone_number(rs.getString(4));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return uVO;
	}
	
	/***
	 * 
	 * @param userId
	 * @return	별점  후기 내용  생성일자   후기를 쓴 호스트 이름    
	 */
	
	public List<UserProfileVO> userReview(String userId) {
		List<UserProfileVO> uvoList = new ArrayList<UserProfileVO>();
		
		try {
			String sql = "SELECT "
					+ "ur.user_review_rating, ur.user_review_content, "
					+ "ur.user_review_created_at, u2.user_name "
					+ "FROM user_review ur "
					+ "JOIN host h ON ur.host_id = h.host_id "
					+ "JOIN user u2 ON h.user_id = u2.user_id "
					+ "where ur.user_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	UserProfileVO vo = new UserProfileVO();
	            vo.setUser_review_rating(rs.getInt(1)); //rs 첫번째 값은 별점.
	        	vo.setUser_review_content(rs.getString(2));//rs 두번째 값은 후기 내용.
	        	vo.setUser_review_created_at(rs.getString(3));//rs 세번째 값은 생성일자
	        	vo.setHost_name(rs.getString(4));//rs 네번째 값은 후기를 쓴 호스트 이름.
	        	
	        	uvoList.add(vo);
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return uvoList;
	}
	
	/***
	 * 
	 * @param userId
	 * @return 숙소 별점, 리뷰 내용,리뷰 생성 날짜 ,숙소 이름, 숙소사진
	 */
	
	public List<UserProfileVO> propertyReview(String userId){
		List<UserProfileVO> uvoList = new ArrayList<UserProfileVO>();
		
		try {
			String sql = "select property_review_rating, property_review_content, "
					+ "property_review_created_at ,property_name, property_photo_url "
					+ "from property_review pr join property p on pr.property_id= p.property_id "
					+ "where pr.user_id =?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	UserProfileVO vo = new UserProfileVO();
	            vo.setProperty_review_rating(rs.getInt(1));
	        	vo.setProperty_review_content(rs.getString(2));
	        	vo.setProperty_review_created_at(rs.getString(3));
	            vo.setProperty_name(rs.getString(4));
	            vo.setProperty_photo_url(rs.getString(5));	        	
	        	
	        	uvoList.add(vo);
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return uvoList;
	}
}
