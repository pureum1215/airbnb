package userPage.userProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public UserProfileVO profileNC(String userId) {
		UserProfileVO uVO = new UserProfileVO();
		
		try {
			String sql = "select user_name, user_created_at from user where user_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            uVO.setUser_name(rs.getString(1));
	            uVO.setUser_created_at(rs.getString(2));
	        }
			
		}
		catch(SQLException e) {
			System.out.println("에러");
		}
		
		return uVO;
	}
}
