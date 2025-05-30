package hostPage.hostReservationDetail;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostReservationDetailDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public HostReservationDetailDAO() {
		System.out.println("생성 체크");

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

	// reservation detail 출력
	public HostReservationDetailVO reservationList(String reservation_id) {
		System.out.println("reservationList method 호출");

		HostReservationDetailVO vo = new HostReservationDetailVO();
		String sql = "SELECT " + "U.USER_ID, U.USER_NAME, " + "r.property_id, p.property_name, p.property_photo_url, "
				+ "p.price_per_night, p.property_description, " + "l.location_country, l.location_city, "
				+ "r.reservation_check_in, r.reservation_check_out, r.reservation_confirm, "
				+ "pay.payment_id, pay.payment_price, pay.payment_status, "
				+ "UR.user_review_content, UR.user_review_rating, UR.user_review_created_at "
				+ "FROM (SELECT * FROM reservation WHERE reservation_id = ?) R "
				+ "INNER JOIN Property P ON R.property_id = P.property_id "
				+ "INNER JOIN LOCATION L ON L.location_id = P.location_id "
				+ "INNER JOIN USER U ON R.USER_ID = U.USER_ID "
				+ "LEFT JOIN payment pay ON r.reservation_id = pay.reservation_id "
				+ "LEFT JOIN User_Review UR ON R.USER_ID = UR.user_id AND P.host_id = UR.host_id";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setReservation_id(reservation_id);
				vo.setUser_id(rs.getString("USER_ID"));								// 예약자 유저 아이디
				vo.setUser_name(rs.getString("USER_NAME"));							// 예약자 유저 이름
				vo.setProperty_id(rs.getString("property_id"));						// 숙소 IDX
				vo.setProperty_name(rs.getString("property_name"));					// 숙소 이름
				vo.setProperty_photo_url(rs.getString("property_photo_url"));		// 숙소 사진
				vo.setPrice_per_night(rs.getInt("price_per_night"));				// 숙소 1박 비용
				vo.setProperty_description(rs.getString("property_description"));	// 숙소 설명
				vo.setLocation_country(rs.getString("location_country"));			// 숙소 나리
				vo.setLocation_city(rs.getString("location_city"));					// 숙소 도시
				vo.setReservation_check_in(rs.getDate("reservation_check_in"));		// 예약 체크 인
				vo.setReservation_check_out(rs.getDate("reservation_check_out"));	// 예약 체크 아웃
				vo.setReservation_confirm(rs.getString("reservation_confirm"));		// 예약 상태
	
					if (rs.getString("payment_id") != null) {
						vo.setPayment_id(rs.getString("payment_id"));
						vo.setPayment_price(rs.getInt("payment_price"));
						vo.setPayment_status(rs.getString("payment_status"));
					} 
					else {
						vo.setPayment_id("not_paid");
	
						int pricePerNight = rs.getInt("price_per_night");
						Date checkIn = rs.getDate("reservation_check_in");
						Date checkOut = rs.getDate("reservation_check_out");
						int totalPrice = getTotalPrice(pricePerNight, checkIn, checkOut);
						vo.setPayment_price(totalPrice);
	
						vo.setPayment_status("not_paid");
					}

				if(rs.getString("user_review_created_at") != null) {
					vo.setUser_review_rating(rs.getInt("user_review_rating"));
					vo.setUser_review_content(rs.getString("user_review_content"));
					vo.setUser_review_created_at(rs.getTimestamp("user_review_created_at"));
				}
				
				
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			closeCon();
		}

		return vo;
	}

	// payment_id 가 존재하지 않을 때, payment_price 계산
	public int getTotalPrice(int pricePerNight, Date checkIn, Date checkOut) {
		int totalPrice = 0;

		// 일수 계산 (체크아웃 - 체크인)
		long millis = checkOut.getTime() - checkIn.getTime();
		int days = (int) (millis / (1000 * 60 * 60 * 24));

		totalPrice = days * pricePerNight;

		return totalPrice;
	}
	
	
	// user review 등록
	public int userReview ( HostReservationDetailVO vo ) {
		System.out.println("userReview method 호출");
		
		int result = 0;
		
		String sql = "INSERT INTO PROPERTY_REVIEW (USER_REVIEW_ID, USER_ID, HOST_ID, "
				+ "USER_REVIEW_RATING, USER_REVIEW_CONTENT, USER_REVIEW_CREATED_AT) "
				+ "VALUES (?, ?, ?, ?, ?, NOW())";
		
		try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vo.getUser_review_id());
	        pstmt.setString(2, vo.getUser_id());
	        pstmt.setString(3, vo.getHost_id());
	        pstmt.setInt(4, vo.getUser_review_rating());
	        pstmt.setString(5, vo.getUser_review_content());
	
	        result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			closeCon();
		}
		
		return result;
	}
	
}
