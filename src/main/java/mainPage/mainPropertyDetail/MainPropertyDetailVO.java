package mainPage.mainPropertyDetail;

import java.sql.Date;
import java.sql.Timestamp;

public class MainPropertyDetailVO {
	
/**************************************************
 * 숙소 id, 숙소 사진, 숙소 이름, 숙소 위치,
 * 숙소 설명, 침실 수, 침대 수, 화장실 수, 어메니티
 * 호스트 id, 호스트 이름, 호스트 계정 생성 날짜,
 * 위치 id, 위치 x, 위치 y, 
 * 숙소 리뷰 id, 사용자 id, 사용자 이름, 숙소 별점, 숙소 리뷰 내용, 숙소 리뷰 생성 날짜
 * 1박 가격, 체크인 날짜, 체크아웃 날짜 ( 예약 내역 체크용 )
 **************************************************/	
	
	private String property_id;
	private String property_photo_url;
	private String property_name;
	private String location_id;	
	private String location_city;
	private String location_country;
	private String location_continent;
	private String location_detail;
	
	private String property_description;
	private int property_room;
	private int property_bed;
	private int property_bathroom;
	private int amenity_id;
	
	
	private String host_id;
	private String user_id;
	private String user_name;
	private String host_created_at;
	
	private double location_x;
	private double location_y;
	
	private String property_review_id;
	private int property_review_count; //리뷰 총 개수
	private double property_review_avg; //리뷰 평균 별점
	private String property_review_content; //리뷰 내용
	private String property_review_created_at;
	private int property_review_rating; //별점 
	
	private int price_per_night;
	private Date reservation_check_in;
	private Date reservation_check_out;
	
	
	
	public int getProperty_review_rating() {
		return property_review_rating;
	}
	public void setProperty_review_rating(int property_review_rating) {
		this.property_review_rating = property_review_rating;
	}
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
	public String getLocation_continent() {
		return location_continent;
	}
	public void setLocation_continent(String location_continent) {
		this.location_continent = location_continent;
	}
	public String getLocation_detail() {
		return location_detail;
	}
	public void setLocation_detail(String location_detail) {
		this.location_detail = location_detail;
	}
	public String getProperty_description() {
		return property_description;
	}
	public void setProperty_description(String property_description) {
		this.property_description = property_description;
	}
	public int getProperty_room() {
		return property_room;
	}
	public void setProperty_room(int property_room) {
		this.property_room = property_room;
	}
	public int getProperty_bed() {
		return property_bed;
	}
	public void setProperty_bed(int property_bed) {
		this.property_bed = property_bed;
	}
	public int getProperty_bathroom() {
		return property_bathroom;
	}
	public void setProperty_bathroom(int property_bathroom) {
		this.property_bathroom = property_bathroom;
	}
	public int getAmenity_id() {
		return amenity_id;
	}
	public void setAmenity_id(int amenity_id) {
		this.amenity_id = amenity_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getHost_created_at() {
		return host_created_at;
	}
	public void setHost_created_at(String host_created_at) {
		this.host_created_at = host_created_at;
	}
	public double getLocation_x() {
		return location_x;
	}
	public void setLocation_x(double location_x) {
		this.location_x = location_x;
	}
	public double getLocation_y() {
		return location_y;
	}
	public void setLocation_y(double location_y) {
		this.location_y = location_y;
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
	public void setProperty_review_content(String property_review_content) {
		this.property_review_content = property_review_content;
	}
	public int getProperty_review_count() {
		return property_review_count;
	}
	public void setProperty_review_count(int property_review_count) {
		this.property_review_count = property_review_count;
	}
	public double getProperty_review_avg() {
		return property_review_avg;
	}
	public void setProperty_review_avg(double property_review_avg) {
		this.property_review_avg = property_review_avg;
	}

	
	public String getProperty_review_created_at() {
		return property_review_created_at;
	}
	public void setProperty_review_created_at(String property_review_created_at) {
		this.property_review_created_at = property_review_created_at;
	}
	public int getPrice_per_night() {
		return price_per_night;
	}
	public void setPrice_per_night(int price_per_night) {
		this.price_per_night = price_per_night;
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
	@Override
	public String toString() {
		return "MainPropertyDetailVO [property_id=" + property_id + ", property_photo_url=" + property_photo_url
				+ ", property_name=" + property_name + ", location_id=" + location_id + ", location_city="
				+ location_city + ", location_country=" + location_country + ", location_continent="
				+ location_continent + ", location_detail=" + location_detail + ", property_description="
				+ property_description + ", property_room=" + property_room + ", property_bed=" + property_bed
				+ ", property_bathroom=" + property_bathroom + ", amenity_id=" + amenity_id + ", host_id=" + host_id
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", host_created_at=" + host_created_at
				+ ", location_x=" + location_x + ", location_y=" + location_y + ", property_review_id="
				+ property_review_id + ", property_review_count=" + property_review_count + ", property_review_avg="
				+ property_review_avg + ", property_review_content=" + property_review_content
				+ ", property_review_created_at=" + property_review_created_at + ", price_per_night=" + price_per_night
				+ ", reservation_check_in=" + reservation_check_in + ", reservation_check_out=" + reservation_check_out
				+ "]";
	}

	
	
	
	
	
}
