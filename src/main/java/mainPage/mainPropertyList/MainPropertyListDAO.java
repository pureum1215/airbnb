package mainPage.mainPropertyList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	
	
	public List<MainPropertyListVO> getPropertyList( List<String> property_id_list, String user_id ) {
		System.out.println("getAllPropertyId method 호출");
		
		List<MainPropertyListVO> list = new ArrayList<>();
		

		
		return list;
	}
	
	public List<MainPropertyListVO> getAllPropertyList() {
		System.out.println("getAllPropertyId method 호출");
		
		List<MainPropertyListVO> list = new ArrayList<>();
		
		return list;
	}
		
	
	
	
	
}
