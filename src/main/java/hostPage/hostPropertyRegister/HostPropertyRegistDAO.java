package hostPage.hostPropertyRegister;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostPropertyRegistDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HostPropertyRegistDAO() {
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
	
	/******************************************************************
	 *  idx check 용 작성
	 ******************************************************************/
	//idx check
	public int initPropertyIdxCount() {
		try {
			String sql = "select count(*)+1 as cnt from Property where property_id like 'prop%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		}
		catch(SQLException e) {
			System.out.println("wow");
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	//location 테이블에 삽입.
	public boolean locationInsert(HostPropertyRegisterVO locvo) {
		String sql = "INSERT INTO Location (location_id, location_city, location_country, location_continent, "
				+ "location_detail, location_x, location_y)";
		sql += "VALUES(?,?,'한국','아시아',?,?,?)";
		int locationIdx = initPropertyIdxCount();//숙소 idx와 같이 증가
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(locationIdx<100) {
				pstmt.setString(1, "loc0"+locationIdx);//loc +idx
			}else {
				pstmt.setString(1, "loc"+locationIdx);//loc +idx
			}
			pstmt.setString(2, locvo.getLocation_city());//addr에서 잘라서 도시 알기
			pstmt.setString(3, locvo.getLocation_detail());
			pstmt.setDouble(4, locvo.getLocation_x());
			pstmt.setDouble(5, locvo.getLocation_y());
			
			if(0 < pstmt.executeUpdate()) {
				return true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			
			return false;
		}
		
		
		
		return false;
	}
	
	
	/*****
	 * 
	 * location_id와 amenity_id를 연관시켜야 함.
	 * 필요한 값 host_id amenity_id property_name property_description price_per_night property_room
	 * property_bed property_bathroom property_reservation_default
	 * 
	 * @return
	 *************/
	//property 테이블에 삽입
	public boolean hostPropertyRegister(HostPropertyRegisterVO propvo) {
		String sql = "Insert into property (property_id, host_id, property_name, "
				+ "property_description, price_per_night, property_room, property_bed, property_bathroom, "
				+ "property_reservation_default, property_photo_url, property_delete_yn) ";
		sql += "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')";
		int propertyIdx = initPropertyIdxCount(); //property_id와 location_id 같이 씀 photourl에도 씀.
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, propvo.getProperty_id());
			pstmt.setString(2, propvo.getHost_id());
			pstmt.setString(3, propvo.getProperty_name());
			pstmt.setString(4, propvo.getProperty_description());
			pstmt.setInt(5, propvo.getPrice_per_night());
			pstmt.setInt(6, propvo.getProperty_room());
			pstmt.setInt(7, propvo.getProperty_bed());
			pstmt.setInt(8, propvo.getProperty_bathroom());
			pstmt.setString(9, propvo.getProperty_reservation_default());
			pstmt.setString(10, propvo.getProperty_photo_url());
			

			if(0 < pstmt.executeUpdate()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			
			return false;
		}
		
		
		
		return false;
	}
	
	//편의시설 insert 용
		public boolean insertPropertyAmenities(List<Integer> amenityIds) {
		    boolean result = false;
		    int propertyIdx = initPropertyIdxCount(); //property_id
		    String sql = "INSERT INTO Property_Amenities (amenity_id, property_id) VALUES (?, ?)";

		    try {
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        for (int amenityId : amenityIds) {
		            pstmt.setInt(1, amenityId);
		            if(propertyIdx<100) {
		            	pstmt.setString(2, "prop0"+propertyIdx);
		            }else {
		            	pstmt.setString(2, "prop"+propertyIdx);
					}
		            
		            pstmt.addBatch(); // 배치 추가
		        }

		        int[] affectedRows = pstmt.executeBatch(); // 일괄 실행
		        result = Arrays.stream(affectedRows).allMatch(row -> row > 0);

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 

		    return result;
		}

}
