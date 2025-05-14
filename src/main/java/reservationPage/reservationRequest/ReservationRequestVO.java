package reservationPage.reservationRequest;

import java.sql.Date;
import java.sql.Timestamp;

public class ReservationRequestVO {

	/**************************************************************
	 * 예약 id, 숙소 id, 사용자 id, 체크인 날짜, 체크아웃 날짜, 예약 생성 날짜,
	 * 숙소 예약 승인 방식 기본 설정 ( property_reservation_default )
	 * 숙소 사진, 숙소 이름, 숙소 별점, 숙소 상세, 1박 가격, 
	 **************************************************************/
	
	private String reservation_id;
	private String property_id;
	private String user_id;
	private Date reservation_check_in;
	private Date reservation_check_out;
	private Timestamp reservation_created_at;
	
	private String property_reservation_default;
	private String property_photo_url;
	private String property_name;
	private int property_review_rating; 
	private String property_description;
	private int price_per_night;
	
	public String getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getReservation_check_in() {
		return reservation_check_in;
	}
	public void setReservation_check_in(Date reservation_check_in) {
		this.reservation_check_in = reservation_check_in;
	}
	public Date getReservation_check_out() {
		return reservation_check_out;
	}
	public void setReservation_check_out(Date reservation_check_out) {
		this.reservation_check_out = reservation_check_out;
	}
	public Timestamp getReservation_created_at() {
		return reservation_created_at;
	}
	public void setReservation_created_at(Timestamp reservation_created_at) {
		this.reservation_created_at = reservation_created_at;
	}
	public String getProperty_reservation_default() {
		return property_reservation_default;
	}
	public void setProperty_reservation_default(String property_reservation_default) {
		this.property_reservation_default = property_reservation_default;
	}
	public String getProperty_photo_url() {
		return property_photo_url;
	}
	public void setProperty_photo_url(String property_photo_url) {
		this.property_photo_url = property_photo_url;
	}
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}
	public int getProperty_review_rating() {
		return property_review_rating;
	}
	public void setProperty_review_rating(int property_review_rating) {
		this.property_review_rating = property_review_rating;
	}
	public String getProperty_description() {
		return property_description;
	}
	public void setProperty_description(String property_description) {
		this.property_description = property_description;
	}
	public int getPrice_per_night() {
		return price_per_night;
	}
	public void setPrice_per_night(int price_per_night) {
		this.price_per_night = price_per_night;
	}
	
	@Override
	public String toString() {
		return "ReservationRequestVO [reservation_id=" + reservation_id + ", property_id=" + property_id + ", user_id="
				+ user_id + ", reservation_check_in=" + reservation_check_in + ", reservation_check_out="
				+ reservation_check_out + ", reservation_created_at=" + reservation_created_at
				+ ", property_reservation_default=" + property_reservation_default + ", property_photo_url="
				+ property_photo_url + ", property_name=" + property_name + ", property_review_rating="
				+ property_review_rating + ", property_description=" + property_description + ", price_per_night="
				+ price_per_night + "]";
	}	
	
}
