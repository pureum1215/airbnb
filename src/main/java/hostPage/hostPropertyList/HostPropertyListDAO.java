package hostPage.hostPropertyList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostPropertyListDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostPropertyListDAO() {
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
	
	//여러개의 컬럼을 가지기도 함. 숙소 이름과 숙소 사진
	public List<HostPropertyListVO> hostProperty(String hostId){
		List<HostPropertyListVO> voList = new ArrayList<HostPropertyListVO>();
		
		try {
			String sql = "select p.property_name, p.property_photo_url "
					+ "from host h join property p on h.host_id =p.host_id "
					+ "where h.host_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				HostPropertyListVO vo = new HostPropertyListVO();
				vo.setProperty_name(rs.getString(1));
				vo.setProperty_photo_url(rs.getString(2));
				
				voList.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return voList;
	}
}
