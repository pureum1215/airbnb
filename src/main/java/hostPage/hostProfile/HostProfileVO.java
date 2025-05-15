package hostPage.hostProfile;

import java.sql.Timestamp;

public class HostProfileVO {

	/**************************************************************************
	 * 사용자 id, 호스트 id, 이름, 삭제 여부, 
	 * 숙소 리뷰 id (숙소에 대한 리뷰), 숙소 id, 별점, 호스트 계정 생성 시간, 
	 * 메일, 전화번호, 생일, 계정 생성 시간, 호스트 자기소개,
	 * 숙소 이름, 내용, 리뷰 생성 시간,
	 * 숙소 사진, 숙소 위치 id, 숙소 도시, 나라, 상세, 1박 가격,
	 * 사용자 리뷰 id (호스트가 작성한 사용자에 대한 리뷰), 호스트가 준 별점, 내용, 리뷰 생성 시간, 
	 **************************************************************************/
	
	private String user_id;
	private String host_id;
	private String user_name;
	private String host_delete_yn;
	
	private String property_review_id;
	private String property_id;
	private int property_review_rating;
	private Timestamp host_created_at;
	
	private String user_email;
	private String user_phone_number;
	private String user_birthday;
	private Timestamp user_created_at;
	private String host_bio;
	
	private String property_name;
	private String property_review_content;
	private Timestamp property_review_created_at;
	
	private String property_photo_url;
	private String location_id;
	private String location_city;
	private String location_country;
	private String location_detail;
	private int price_per_night;
	
	private String user_review_id;
	private int user_review_rating;
	private String user_review_content;
	private Timestamp user_review_created_at;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getHost_delete_yn() {
		return host_delete_yn;
	}
	public void setHost_delete_yn(String host_delete_yn) {
		this.host_delete_yn = host_delete_yn;
	}
	public String getProperty_review_id() {
		return property_review_id;
	}
	public void setProperty_review_id(String property_review_id) {
		this.property_review_id = property_review_id;
	}
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public int getProperty_review_rating() {
		return property_review_rating;
	}
	public void setProperty_review_rating(int property_review_rating) {
		this.property_review_rating = property_review_rating;
	}
	public Timestamp getHost_created_at() {
		return host_created_at;
	}
	public void setHost_created_at(Timestamp host_created_at) {
		this.host_created_at = host_created_at;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone_number() {
		return user_phone_number;
	}
	public void setUser_phone_number(String user_phone_number) {
		this.user_phone_number = user_phone_number;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public Timestamp getUser_created_at() {
		return user_created_at;
	}
	public void setUser_created_at(Timestamp user_created_at) {
		this.user_created_at = user_created_at;
	}
	public String getHost_bio() {
		return host_bio;
	}
	public void setHost_bio(String host_bio) {
		this.host_bio = host_bio;
	}
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}
	public String getProperty_review_content() {
		return property_review_content;
	}
	public void setProperty_review_content(String property_review_content) {
		this.property_review_content = property_review_content;
	}
	public Timestamp getProperty_review_created_at() {
		return property_review_created_at;
	}
	public void setProperty_review_created_at(Timestamp property_review_created_at) {
		this.property_review_created_at = property_review_created_at;
	}
	public String getProperty_photo_url() {
		return property_photo_url;
	}
	public void setProperty_photo_url(String property_photo_url) {
		this.property_photo_url = property_photo_url;
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
	public String getUser_review_id() {
		return user_review_id;
	}
	public void setUser_review_id(String user_review_id) {
		this.user_review_id = user_review_id;
	}
	public int getUser_review_rating() {
		return user_review_rating;
	}
	public void setUser_review_rating(int user_review_rating) {
		this.user_review_rating = user_review_rating;
	}
	public String getUser_review_content() {
		return user_review_content;
	}
	public void setUser_review_content(String user_review_content) {
		this.user_review_content = user_review_content;
	}
	public Timestamp getUser_review_created_at() {
		return user_review_created_at;
	}
	public void setUser_review_created_at(Timestamp user_review_created_at) {
		this.user_review_created_at = user_review_created_at;
	}
	
	@Override
	public String toString() {
		return "HostProfileVO [user_id=" + user_id + ", host_id=" + host_id + ", user_name=" + user_name
				+ ", host_delete_yn=" + host_delete_yn + ", property_review_id=" + property_review_id + ", property_id="
				+ property_id + ", property_review_rating=" + property_review_rating + ", host_created_at="
				+ host_created_at + ", user_email=" + user_email + ", user_phone_number=" + user_phone_number
				+ ", user_birthday=" + user_birthday + ", user_created_at=" + user_created_at + ", host_bio=" + host_bio
				+ ", property_name=" + property_name + ", property_review_content=" + property_review_content
				+ ", property_review_created_at=" + property_review_created_at + ", property_photo_url="
				+ property_photo_url + ", location_id=" + location_id + ", location_city=" + location_city
				+ ", location_country=" + location_country + ", location_detail=" + location_detail
				+ ", price_per_night=" + price_per_night + ", user_review_id=" + user_review_id
				+ ", user_review_rating=" + user_review_rating + ", user_review_content=" + user_review_content
				+ ", user_review_created_at=" + user_review_created_at + "]";
	}
	
}
