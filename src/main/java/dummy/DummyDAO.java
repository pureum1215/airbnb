package dummy;

import java.io.IOException;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import dummy.vo.AmenitiesVO;
import dummy.vo.HostVO;
import dummy.vo.LocationVO;
import dummy.vo.PaymentVO;
import dummy.vo.PropertyAmenitiesVO;
import dummy.vo.PropertyReviewVO;
import dummy.vo.PropertyVO;
import dummy.vo.ReservationVO;
import dummy.vo.UserReviewVO;
import dummy.vo.UserVO;
import dummy.vo.WishListVO;

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
	 *  더미 데이터 작성하기 회원가입 페이지 만들시 사용하면 좋음. Index
	 ******************************************************************/
	//idx check
//	public int initUserIdxCount() {
//		try {
//			String sql = "Select count(*)+1 as cnt from  user where user_id like 'user%'";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				return rs.getInt("cnt");
//			}
//			
//		}
//		catch(SQLException e) {
//			System.out.println("wow");
//		}
//		return 0;
//	}
//	
	
	/**
	 *유저 등록하기
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
				return true;
			}
			
		}
		catch (SQLException e) {
			System.out.println("initUser insert 실패: "+userVO.getUserId());
			
			return false;
		}
		
		return false;
	}
	
	/***************************
	 * 호스트 등록하기, 
	 * boolean 성공여부: false 성공,true: 실패
	 * user_id host_id  
	 * 개 다르게 하기
	 **************************/
	
	public boolean initHost(HostVO hostVO) {
		String sql = "INSERT INTO Host (host_id, user_id, host_bio, host_created_at, host_delete_yn)";
		sql += "VALUES(? ,?, ?, NOW(), 'N')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostVO.getHostId());
			pstmt.setString(2, hostVO.getUserId());
			pstmt.setString(3, hostVO.getHostBio());
			
			if(0 < pstmt.executeUpdate()) {
				return false;
			}
			
			
		} catch (SQLException e) {
			System.out.println("initHost insert 실패: "+hostVO.getHostId());
			return true;
		}
		
		
		return true;
	}
	
	public boolean initLocation(LocationVO locVO) {
		String sql = "INSERT INTO Location (location_id, location_city, location_country, location_continent,\n"
				+ "location_detail, location_x, location_y)";
		sql += "VALUES(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locVO.getLocationId());
			pstmt.setString(2, locVO.getLocationCity());
			pstmt.setString(3, locVO.getLocationCountry());
			pstmt.setString(4, locVO.getLocationContinent());
			pstmt.setString(5, locVO.getLocationDetail());
			pstmt.setDouble(6, locVO.getLocationX());
			pstmt.setDouble(7, locVO.getLocationY());
			if(0 < pstmt.executeUpdate()) {
				return false;
			}
			
		} catch (SQLException e) {
			System.out.println("initLocation insert 실패: "+locVO.getLocationId());
			return true;
		}
		return true;
	}
	
	public boolean initAmenitie(AmenitiesVO amVO) {
		
		String sql = "INSERT INTO Amenities (amenity_id, amenity_name) VALUES(?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amVO.getAmenityId());
			pstmt.setString(2, amVO.getAmenityName());
			if(0 < pstmt.executeUpdate()) {
				return false;
			}
			
		} catch (SQLException e) {
			System.out.println("initLocation insert 실패: "+amVO.getAmenityId());
			return true;
		}
		return true;
		
	}
	public boolean initProperty(PropertyVO propertyVO) {
		String sql = "INSERT INTO Property (property_id, host_id, location_id, amenity_id, property_name, property_description, price_per_night, "
		           + "property_room, property_bed, property_bathroom, property_reservation_default, property_photo_url, property_delete_yn) "
		           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, propertyVO.getPropertyId());
			pstmt.setString(2, propertyVO.getHostId());
			pstmt.setString(3, propertyVO.getLocationId());
			pstmt.setInt(4, propertyVO.getAmenityId());
			pstmt.setString(5, propertyVO.getPropertyName());
			pstmt.setString(6, propertyVO.getPropertyDescription());
			pstmt.setInt(7, propertyVO.getPricePerNight());
			pstmt.setInt(8, propertyVO.getPropertyRoom());
			pstmt.setInt(9, propertyVO.getPropertyBed());
			pstmt.setInt(10, propertyVO.getPropertyBathroom());
			pstmt.setString(11, propertyVO.getPropertyReservationDefault());
			pstmt.setString(12, propertyVO.getPropertyPhotoUrl());
			pstmt.setString(13, propertyVO.getPropertyDeleteYn());

			if (pstmt.executeUpdate() > 0) {
				return true;
			}

		} catch (SQLException e) {
			System.out.println("initProperty insert 실패: " + propertyVO.getPropertyId());
			e.printStackTrace();
			return false;
		}

		return false;
	}

	public boolean initPropertyAmenities(PropertyAmenitiesVO vo) {
		String sql = "INSERT INTO Property_Amenities (amenity_id, property_id) VALUES (?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAmenityId());
			pstmt.setString(2, vo.getPropertyId());

			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("initPropertyAmenities insert 실패: property_id=" + vo.getPropertyId() + ", amenity_id=" + vo.getAmenityId());
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean initUserReview(UserReviewVO vo) {
		String sql = "INSERT INTO User_Review (user_review_id, user_id, host_id, user_review_rating, user_review_content, user_review_created_at) "
		           + "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserReviewId());
			pstmt.setString(2, vo.getUserId());
			pstmt.setString(3, vo.getHostId());
			pstmt.setInt(4, vo.getUserReviewRating());
			pstmt.setString(5, vo.getUserReviewContent());
			pstmt.setDate(6, vo.getUser_review_created_at());
			
			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("initUserReview insert 실패: " + vo.getUserReviewId());
			e.printStackTrace();
			return false;
		}

		return false;
	}
	
	public boolean initPropertyReview(PropertyReviewVO vo) {
		String sql = "INSERT INTO Property_Review (property_review_id, user_id, property_id, property_review_rating, property_review_content, property_review_created_at) "
		           + "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPropertyReviewId());
			pstmt.setString(2, vo.getUserId());
			pstmt.setString(3, vo.getPropertyId());
			pstmt.setInt(4, vo.getPropertyReviewRating());
			pstmt.setString(5, vo.getPropertyReviewContent());
			pstmt.setDate(6, vo.getProperty_review_created_at());
			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("initPropertyReview insert 실패: " + vo.getPropertyReviewId());
			e.printStackTrace();
			return false;
		}

		return false;
	}

	public boolean initReservation(ReservationVO vo) {
		String sql = "INSERT INTO Reservation (reservation_id, property_id, user_id, reservation_check_in, reservation_check_out, reservation_created_at) "
		           + "VALUES (?, ?, ?, ?, ?, NOW())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReservationId());
			pstmt.setString(2, vo.getPropertyId());
			pstmt.setString(3, vo.getUserId());
			pstmt.setString(4, vo.getReservationCheckIn());
			pstmt.setString(5, vo.getReservationCheckOut());

			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("initReservation insert 실패: " + vo.getReservationId());
			e.printStackTrace();
			return false;
		}

		return false;
	}

	public boolean initPayment(PaymentVO vo) {
		String sql = "INSERT INTO Payment (payment_id, reservation_id, payment_price, payment_method, payment_status, payment_created_at) "
		           + "VALUES (?, ?, ?, ?, ?, NOW())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPaymentId());
			pstmt.setString(2, vo.getReservationId());
			pstmt.setInt(3, vo.getPaymentPrice());
			pstmt.setString(4, vo.getPaymentMethod());
			pstmt.setString(5, vo.getPaymentStatus());

			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("initPayment insert 실패: " + vo.getPaymentId());
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean initWishList(WishListVO vo) {
		String sql = "INSERT INTO Wish_List (user_id, property_id) VALUES (?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getPropertyId());

			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("initWishList insert 실패: user_id=" + vo.getUserId() + ", property_id=" + vo.getPropertyId());
			e.printStackTrace();
			return false;
		}
	}

	
}
