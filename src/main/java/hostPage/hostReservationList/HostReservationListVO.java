package hostPage.hostReservationList;

import java.sql.Date;
import java.sql.Timestamp;

public class HostReservationListVO {
	
	/**************************************************************************
	 * 숙소 id, 숙소 사진, 숙소 이름, 숙소 도시, 나라, 1박 가격, 총 가격, 
	 * 예약 id, 사용자 id, 사용자 이름, 체크인 날짜, 체크아웃 날짜, 승인 상태, 결제 상태, 예약 요청 시간	 * 
	 **************************************************************************/
	
	private String property_id;
	private String property_photo_url;
	private String property_name;
	private String location_city;
	private String location_country;
	private int price_per_night;
	private int total_price;
	
	private String reservation_id;
	private String user_id;
	private String user_name;
	private Date reservation_check_in;
	private Date reservation_check_out;
	private String reservation_confirm;
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
	public int getPrice_per_night() {
		return price_per_night;
	}
	public void setPrice_per_night(int price_per_night) {
		this.price_per_night = price_per_night;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getReservation_confirm() {
		return reservation_confirm;
	}
	public void setReservation_confirm(String reservation_confirm) {
		this.reservation_confirm = reservation_confirm;
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
		return "HostReservationListVO [property_id=" + property_id + ", property_photo_url=" + property_photo_url
				+ ", property_name=" + property_name + ", location_city=" + location_city + ", location_country="
				+ location_country + ", price_per_night=" + price_per_night + ", total_price=" + total_price
				+ ", reservation_id=" + reservation_id + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", reservation_check_in=" + reservation_check_in + ", reservation_check_out=" + reservation_check_out
				+ ", reservation_confirm=" + reservation_confirm + ", payment_status=" + payment_status
				+ ", reservation_created_at=" + reservation_created_at + "]";
	}
	
}
