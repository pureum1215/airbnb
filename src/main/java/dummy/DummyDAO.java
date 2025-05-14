package dummy;

import java.io.IOException;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import dummy.vo.UserVO;

/***
 * 유저 데이터 가공
 * 작성자: 명희승
 */
public class DummyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	/******
	 * DB 연결 하기
	 *****/
	boolean getConnection() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			this.conn = ds.getConnection();

			System.out.println("db 연결 성공");
			return true;
		} catch (Exception e) {
		}
		
		return false;
	}
	
	/***
	 * DB 연결 끊기
	 */
	void closeCon() {
		try { if(rs != null) rs.close(); } catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		try { if(conn != null) conn.close(); } catch(Exception e) {}
	}
	
	
	
	
	
	
	/******************************************************************
	 *  더미 데이터 작성하기
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
	
	
	/**
	 *유저 등록하
	 * @param userVO: 유저 정보
	 * @return
	 * boolean 성공여부: false 성공,true: 실패
	 */
	public boolean initUser(UserVO userVO) {
		String sql = "INSERT INTO User (user_id, user_name, user_email, user_password, user_phone_number, user_birthday, user_created_at, user_delete_yn)";
		sql += "VALUES ( ?, ?, ?, ?, ?, ?, NOW(), 'N')";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserName());		
			pstmt.setString(3, userVO.getUserEmail());
			pstmt.setString(4, userVO.getUserPassword());
			pstmt.setString(5, userVO.getPhoneNumber());
			pstmt.setString(6, userVO.getUserBirthday());
			
			if(0 < pstmt.executeUpdate()) {
				return false;
			}
			
		}
		catch (SQLException e) {
			System.out.println("initUser insert 실패: "+userVO.getUserId());
			
			return true;
		}
		
		return true;
	}
	
	
	
	
	
	
	
	
	
	
	
}
