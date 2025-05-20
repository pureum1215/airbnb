package userPage.userWishList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserWishListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserWishListDAO() {
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
		} catch (Exception e) {}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {}
	}
	
	
	// 위시리스트에 등록 되어있는지 확인
	public boolean wishListCheck(String user_id, String property_id) {
	    try {
	    	String sql = "SELECT COUNT(*) FROM wishlist WHERE user_id = ? AND property_id = ?";
	        
	    	pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setString(2, property_id);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            return rs.getInt(1) > 0;
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	    return false;
	}
	
	// 위시리스트에 등록
	public void wishListAdd(String user_id, String property_id) {
	    try {
	    	String sql = "INSERT INTO WISHLIST (user_id, property_id) "
	    			+ "VALUES (?, ?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setString(2, property_id);
	        pstmt.executeUpdate();
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	}
	
	// 위시리스트에서 삭제
	public void wishListDelete(String user_id, String property_id) {
	    try {
	    	String sql = "DELETE FROM WISHLIST WHERE user_id = ? AND property_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setString(2, property_id);
	        pstmt.executeUpdate();
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	    finally {
	        closeCon();
	    }
	}

}
