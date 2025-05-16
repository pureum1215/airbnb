package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import memberPage.memberSignIn.MemberSignInVO;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	/*******************************************************
	 * 사용자, 호스트 회원가입, 로그인, 내 정보 확인 
	 * (관리자의 회원 정보 삭제)
	 *******************************************************/
	
	/******************************************************************
	 *  idx check 용 작
	 ******************************************************************/
	//idx check
	public int initUserIdxCount() {
		try {
			String sql = "Select count(*)+1 as cnt from  user where user_id like 'user%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		}
		catch(SQLException e) {
			System.out.println("wow");
		}
		return 0;
	}
	
	
	/*******************
	 * 사용자 회원가입  성공시 True 실패시 false
	 *******************/
	public boolean SignIn(MemberSignInVO msVO) {
		
		String sql = "INSERT INTO User (user_id, user_name, user_email, user_password, user_phone_number, user_birthday, user_created_at, user_delete_yn)";
		sql += "VALUES ( ?, ?, ?, ?, ?, ?, NOW(), 'N')";
		
		int usercount= initUserIdxCount();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, usercount);
			pstmt.setString(2, msVO.getUser_name());		
			pstmt.setString(3, msVO.getUser_email());
			pstmt.setString(4, msVO.getUser_password());
			pstmt.setString(5, msVO.getUser_phone_number());
			pstmt.setDate(6, msVO.getUser_birthday());
			
			if(0 < pstmt.executeUpdate()) {
				return true;
			}
			
		}
		catch (SQLException e) {
			System.out.println("initUser insert 실패: "+msVO.getUser_name());
			
			return false;
		}
		
		return false;
	}
	
	
	
}
