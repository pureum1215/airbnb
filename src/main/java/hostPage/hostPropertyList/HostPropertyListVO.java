package hostPage.hostPropertyList;

import java.sql.Date;
import java.sql.Timestamp;

public class HostPropertyListVO {
	
	/**************************************************************************
	 * 숙소 id, 숙소 사진, 숙소 이름, 숙소 별점, 숙소 위치 id, 상세주소, 숙소 도시, 나라, 숙소 상세, 1박 가격,
	 * 예약 id, 사용자 id, 체크인 날짜, 체크아웃 날짜, 결제 상태, 예약 요청 시간	 * 
	 **************************************************************************/
	
	private String property_id;
	private String property_photo_url;
	private String property_name;
	private int property_review_rating;
	private String location_id;
	private String location_city;
	private String location_country;
	private String location_detail;
	private int price_per_night;
	
	private String reservation_id;
	private String user_id;
	private Date reservation_check_in;
	private Date reservation_check_out;
	private String payment_status;
	private Timestamp reservation_created_at;
	
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
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
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getLocation_city() {
		return location_city;
	}
	public void setLocation_city(String location_city) {
		this.location_city = location_city;
	}
	public String getLocation_country() {
		return location_country;
	}
	public void setLocation_country(String location_country) {
		this.location_country = location_country;
	}
	public String getLocation_detail() {
		return location_detail;
	}
	public void setLocation_detail(String location_detail) {
		this.location_detail = location_detail;
	}
	public int getPrice_per_night() {
		return price_per_night;
	}
	public void setPrice_per_night(int price_per_night) {
		this.price_per_night = price_per_night;
	}
	public String getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
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
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public Timestamp getReservation_created_at() {
		return reservation_created_at;
	}
	public void setReservation_created_at(Timestamp reservation_created_at) {
		this.reservation_created_at = reservation_created_at;
	}
	
	@Override
	public String toString() {
		return "HostPropertyListVO [property_id=" + property_id + ", property_photo_url=" + property_photo_url
				+ ", property_name=" + property_name + ", property_review_rating=" + property_review_rating
				+ ", location_id=" + location_id + ", location_city=" + location_city + ", location_country="
				+ location_country + ", location_detail=" + location_detail + ", price_per_night=" + price_per_night
				+ ", reservation_id=" + reservation_id + ", user_id=" + user_id + ", reservation_check_in="
				+ reservation_check_in + ", reservation_check_out=" + reservation_check_out + ", payment_status="
				+ payment_status + ", reservation_created_at=" + reservation_created_at + "]";
	}

}
