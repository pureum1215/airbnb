package hostPage.hostProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hostPage.hostPropertyList.HostPropertyListVO;

public class HostProfileDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostProfileDAO() {
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
	
	//필요한 것 호스트 이름, 호스트 자기소개
	public HostProfileVO hostProfile1(String hostId) {
		HostProfileVO vo = new HostProfileVO();
		
		try {
			String sql = "select u.user_name, h.host_bio, u.user_email, u.user_phone_number "
					+ "from host h join user u "
					+ "on h.user_id= u.user_id where host_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, hostId);
	        ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUser_name(rs.getString(1));
				vo.setHost_bio(rs.getString(2));
				vo.setUser_email(rs.getString("user_email"));
				vo.setUser_phone_number(rs.getString("user_phone_number"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vo;
	}
	
	//필요한 것 호스트가 가진 숙소에 대한 별점 평균, 후기 개수
		public HostProfileVO hostProfile2(String hostId) {
			HostProfileVO vo = new HostProfileVO();
			
			try {
				String sql = "select count(*),AVG(property_review_rating) from host h join property p on h.host_id = p.host_id "
						+ "join property_review pr on p.property_id= pr.property_id where h.host_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostId);
		        ResultSet rs = pstmt.executeQuery();
		        
				if(rs.next()) {
					vo.setCount(rs.getInt(1));
					vo.setAvg(rs.getDouble(2));
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			
			return vo;
		}
		
		//필요한 것  후기내용, 후기 
		public List<HostProfileVO> hostProfile3(String hostId) {
			List<HostProfileVO> voList = new ArrayList<HostProfileVO>();
			
			try {
				String sql = "select pr.property_review_content, pr.property_review_rating, pr.property_review_id  "
						+ "from host h join property p on h.host_id = p.host_id "
						+ "join property_review pr on p.property_id= pr.property_id where h.host_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostId);
		        ResultSet rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		        	HostProfileVO vo = new HostProfileVO();
		        	vo.setProperty_review_content(rs.getString(1));
		        	vo.setProperty_review_rating(rs.getInt(2));
		        	vo.setProperty_review_id(rs.getString(3));
		        	voList.add(vo);
		        }
		        
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return voList;
		}
		//필요한 것 별점 후기 남긴 사람 이름,날짜 review_created_at u.user_name
		public HostProfileVO hostProfile4(String propreviwId) {
			HostProfileVO vo = new HostProfileVO();
			
			try {
				String sql = "select u.user_name,pr.property_review_created_at from property_review "
						+ "pr join user u on pr.user_id =u.user_id where property_review_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, propreviwId);
		        ResultSet rs = pstmt.executeQuery();
		        if(rs.next()) {
		        	vo.setUser_name(rs.getString(1));
		        	vo.setProperty_review_created_at(rs.getString(2));
		        }
		        
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return vo;
		}
		
		//호스트가 가지고 있는 숙소 숙소이름, 숙소 사진
		public List<HostProfileVO> hostProfile5(String hostId){
			List<HostProfileVO> voList = new ArrayList<HostProfileVO>();
			
			try {
				String sql = "select p.property_name, p.property_photo_url, p.property_id "
						+ "from host h join property p on h.host_id =p.host_id "
						+ "where h.host_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostId);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					HostProfileVO vo = new HostProfileVO();
					vo.setProperty_name(rs.getString(1));
					vo.setProperty_photo_url(rs.getString(2));
					vo.setProperty_id(rs.getString(3));
					
					voList.add(vo);
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return voList;
		}
}
