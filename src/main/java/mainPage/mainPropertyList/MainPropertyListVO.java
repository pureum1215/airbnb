package mainPage.mainPropertyList;

public class MainPropertyListVO {
	
/************************************************ 
 * 숙소 id, 숙소 사진, 숙소 이름, 나라, 도시, 
 * 숙소 설명, 1박 가격, 별점 평균, 위시리스트, 삭제 여부,
**************************************************/
	
	private String property_id;
	private String property_name;
	private String property_photo_url;
	private String location_country;
	private String location_city;

	private String property_description;
	private int price_per_night;
	private double property_review_rating;
	private String wish_list;
	private String property_delete_yn;
	
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
	public String getProperty_photo_url() {
		return property_photo_url;
	}
	public void setProperty_photo_url(String property_photo_url) {
		this.property_photo_url = property_photo_url;
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
	public double getProperty_review_rating() {
		return property_review_rating;
	}
	public void setProperty_review_rating(double property_review_rating) {
		this.property_review_rating = property_review_rating;
	}
	public String getWish_list() {
		return wish_list;
	}
	public void setWish_list(String wish_list) {
		this.wish_list = wish_list;
	}
	public String getProperty_delete_yn() {
		return property_delete_yn;
	}
	public void setProperty_delete_yn(String property_delete_yn) {
		this.property_delete_yn = property_delete_yn;
	}

}
