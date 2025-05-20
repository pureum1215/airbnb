package userPage.userProfile;

import java.sql.Timestamp;

public class UserProfileVO {
	
	/**************************************************************************
	 * 사용자 id, 이름, 메일, 전화번호, 생일, 계정 생성 시간, 삭제 여부,
	 * 사용자 리뷰 id (호스트가 작성한 나에 대한 리뷰), 호스트 id, 별점, 내용, 생성 시간, 
	 * 숙소 리뷰 id (내가 쓴 리뷰), 숙소 id, 숙소 이름, 별점, 내용, 생성 시간
	 **************************************************************************/
	
	private String user_id;
	private String user_name; //유저 이름.
	private String user_email;
	private String user_phone_number;
	private String user_birthday;
	private Timestamp user_created_at;//유저 생성날짜ㅣ
	private String user_delete_yn;
	
	private String user_review_id;
	private String host_id;
	private int user_review_rating;// 별점.
	private String host_name; //숙소 호스트 이름.
	private String user_review_content; //숙소에서 쓰는 유저에 대한 리뷰
	private Timestamp user_review_created_at; //숙소에서 쓰는 유저 리뷰 생성날짜
	
	private String property_review_id;
	private String property_id;
	private String property_photo_url; // 숙소 사진 url
	private String property_name; //숙소 이름
	private int property_review_rating; // 별점
	private String property_review_content;//유저가 쓰는 리뷰
	private int property_review_count;//유저가 적은 후기 개수
	private Timestamp property_review_created_at; //유저가 쓰는 리뷰 생성일자
	
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
	public String getUser_delete_yn() {
		return user_delete_yn;
	}
	public void setUser_delete_yn(String user_delete_yn) {
		this.user_delete_yn = user_delete_yn;
	}
	public String getUser_review_id() {
		return user_review_id;
	}
	public void setUser_review_id(String user_review_id) {
		this.user_review_id = user_review_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
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
	
	@Override
	public String toString() {
		return "UserProfileVO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_phone_number=" + user_phone_number + ", user_birthday=" + user_birthday + ", user_created_at="
				+ user_created_at + ", user_delete_yn=" + user_delete_yn + ", user_review_id=" + user_review_id
				+ ", host_id=" + host_id + ", user_review_rating=" + user_review_rating + ", user_review_content="
				+ user_review_content + ", user_review_created_at=" + user_review_created_at + ", property_review_id="
				+ property_review_id + ", property_id=" + property_id + ", property_name=" + property_name
				+ ", property_review_rating=" + property_review_rating + ", property_review_content="
				+ property_review_content + ", property_review_created_at=" + property_review_created_at + "]";
	}
	
}
