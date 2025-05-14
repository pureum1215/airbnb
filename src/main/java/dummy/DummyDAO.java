package dummy;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

/***
 * 유저 데이터 가공
 * 작성자: 명희승
 */
class DummyDAO {
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
}
