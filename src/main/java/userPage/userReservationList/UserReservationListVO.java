package userPage.userReservationList;

import java.sql.Date;

public class UserReservationListVO {
	
	/**************************************************************************
	 * 사용자 id, 예약 id, 숙소 id, 숙소 사진, 숙소 이름, 체크인 날짜, 체크아웃 날짜 
	 * 도시, 나라
	 **************************************************************************/
	
	private String user_id;
	private String reservation_id;
	private String property_id;
	private String property_photo_url;
	private String property_name;
	private Date reservation_check_in;
	private Date reservation_check_out;
	private String city;
	private String country;
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
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
		return "UserReservationListVO [user_id=" + user_id + ", reservation_id=" + reservation_id + ", property_id="
				+ property_id + ", property_photo_url=" + property_photo_url + ", property_name=" + property_name
				+ ", reservation_check_in=" + reservation_check_in + ", reservation_check_out=" + reservation_check_out
				+ "]";
	}

}
