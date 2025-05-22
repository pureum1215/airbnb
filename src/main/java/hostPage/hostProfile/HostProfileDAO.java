package hostPage.hostProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
			String sql = "select u.user_name, h.host_bio from host h join user u on h.user_id= u.user_id where host_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, hostId);
	        ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUser_name(rs.getString(1));
				vo.setHost_bio(rs.getString(2));
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
		
		//필요한 것  후기내용
		public List<HostProfileVO> hostProfile3(String hostId) {
			List<HostProfileVO> voList = new ArrayList<HostProfileVO>();
			
			try {
				String sql = "select pr.property_review_content, pr.property_review_rating from host h "
						+ "join property p on h.host_id = p.host_id "
						+ "join property_review pr on p.property_id= pr.property_id where h.host_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostId);
		        ResultSet rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		        	HostProfileVO vo = new HostProfileVO();
		        	vo.setProperty_review_content(rs.getString(1));
		        	vo.setProperty_review_rating(rs.getInt(2));
		        	
		        	voList.add(vo);
		        }
		        
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return voList;
		}
		//필요한 것 가지고 있는 숙소
		public HostProfileVO hostProfile4(String hostId) {
			HostProfileVO vo = new HostProfileVO();
			
			try {
				String sql = "";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostId);
		        ResultSet rs = pstmt.executeQuery();
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return vo;
		}
}
