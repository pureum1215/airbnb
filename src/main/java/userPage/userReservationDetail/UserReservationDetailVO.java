package userPage.userReservationDetail;

import java.sql.Date;
import java.sql.Timestamp;

public class UserReservationDetailVO {
	
	/**************************************************************************
	 * 숙소 id, 숙소 사진, 숙소 이름, 숙소 별점, 숙소 위치 id, 상세주소, 숙소 도시, 나라, 숙소 상세, 1박 가격,
	 * 호스트 id, 호스트 이름, 호스트 소개
	 * 숙소 리뷰 id, 리뷰 내용, 리뷰 생성 날짜, 
	 * 예약 id, 사용자 id, 체크인 날짜, 체크아웃 날짜,
	 * 결제 id, 결제 비용, 
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
	
	private String host_id;
	private String user_name;
	private String host_bio;
	
	private String property_review_id;
	private String property_review_content;
	private Timestamp property_review_created_at;
	
	private String reservation_id;
	private String user_id;
	private Date reservation_check_in;
	private Date reservation_check_out;
	
	private String payment_id;
	private int payment_price;
	
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
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getHost_bio() {
		return host_bio;
	}
	public void setHost_bio(String host_bio) {
		this.host_bio = host_bio;
	}
	public String getProperty_review_id() {
		return property_review_id;
	}
	public void setProperty_review_id(String property_review_id) {
		this.property_review_id = property_review_id;
	}
	public String getProperty_review_content() {
		return property_review_content;
	}
	public void setProperty_review_content(String user_review_content) {
		this.property_review_content = user_review_content;
	}
	public Timestamp setProperty_review_content() {
		return property_review_created_at;
	}
	public void setProperty_review_created_at(Timestamp user_review_created_at) {
		this.property_review_created_at = user_review_created_at;
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
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	
	@Override
	public String toString() {
		return "UserReservationDetailVO [property_id=" + property_id + ", property_photo_url=" + property_photo_url
				+ ", property_name=" + property_name + ", property_review_rating=" + property_review_rating
				+ ", location_id=" + location_id + ", location_city=" + location_city + ", location_country="
				+ location_country + ", location_detail=" + location_detail + ", price_per_night=" + price_per_night
				+ ", host_id=" + host_id + ", user_name=" + user_name + ", host_bio=" + host_bio
				+ ", property_review_id=" + property_review_id + ", user_review_content=" + property_review_content
				+ ", user_review_created_at=" + property_review_created_at + ", reservation_id=" + reservation_id
				+ ", user_id=" + user_id + ", reservation_check_in=" + reservation_check_in + ", reservation_check_out="
				+ reservation_check_out + ", payment_id=" + payment_id + ", payment_price=" + payment_price + "]";
	}
		
}
