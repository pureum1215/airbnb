package mainPage.mainPropertyList;

import java.sql.Date;

public class MainPropertyListVO {
	
/************************************************ 
 * 숙소 위치 id, 나라, 도시, 대륙, 어메니티 종류, 
 * 체크인 날짜, 체크아웃 날짜, 숙소 id, 숙소 삭제 여부
 * 
 * 숙소 사진, 별점, 숙소 설명, 1박 가격,
 * 사용자 id, 사용자 이름, 사용자 삭제 여부
**************************************************/
	
	private String location_id;
	private String location_continent;
	private String location_country;
	private String location_city;
	private int amenity_id;
	private Date reservation_check_in;
	private Date reservation_check_out;
	private String property_id;
	private String property_delete_yn;
	
	private String property_photo_url;
	private int property_review_rating;
	private String property_description;
	private int price_per_night;
	
	private String user_id;
	private String user_name;
	private String user_delete_yn;
	
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getLocation_continent() {
		return location_continent;
	}
	public void setLocation_continent(String location_continent) {
		this.location_continent = location_continent;
	}
	public String getLocation_country() {
		return location_country;
	}
	public void setLocation_country(String location_country) {
		this.location_country = location_country;
	}
	public String getLocation_city() {
		return location_city;
	}
	public void setLocation_city(String location_city) {
		this.location_city = location_city;
	}
	public int getAmenity_id() {
		return amenity_id;
	}
	public void setAmenity_id(int amenity_id) {
		this.amenity_id = amenity_id;
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
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public String getProperty_delete_yn() {
		return property_delete_yn;
	}
	public void setProperty_delete_yn(String property_delete_yn) {
		this.property_delete_yn = property_delete_yn;
	}
	public String getProperty_photo_url() {
		return property_photo_url;
	}
	public void setProperty_photo_url(String property_photo_url) {
		this.property_photo_url = property_photo_url;
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
	public String getUser_delete_yn() {
		return user_delete_yn;
	}
	public void setUser_delete_yn(String user_delete_yn) {
		this.user_delete_yn = user_delete_yn;
	}
	
	@Override
	public String toString() {
		return "MainPropertyListVO [location_id=" + location_id + ", location_continent=" + location_continent
				+ ", location_country=" + location_country + ", location_city=" + location_city + ", amenity_id="
				+ amenity_id + ", reservation_check_in=" + reservation_check_in + ", reservation_check_out="
				+ reservation_check_out + ", property_id=" + property_id + ", property_delete_yn=" + property_delete_yn
				+ ", property_photo_url=" + property_photo_url + ", property_review_rating=" + property_review_rating
				+ ", property_description=" + property_description + ", price_per_night=" + price_per_night
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", user_delete_yn=" + user_delete_yn + "]";
	}

}
