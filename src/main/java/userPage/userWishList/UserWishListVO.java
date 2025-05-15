package userPage.userWishList;

public class UserWishListVO {
	
	/**************************************************************************
	 * 숙소 id, 숙소 사진, 숙소 이름, 숙소 별점, 숙소 위치 id, 상세주소, 숙소 도시, 나라, 숙소 상세, 1박 가격,
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
	
	@Override
	public String toString() {
		return "UserWishListVO [property_id=" + property_id + ", property_photo_url=" + property_photo_url
				+ ", property_name=" + property_name + ", property_review_rating=" + property_review_rating
				+ ", location_id=" + location_id + ", location_city=" + location_city + ", location_country="
				+ location_country + ", location_detail=" + location_detail + ", price_per_night=" + price_per_night
				+ "]";
	}
	
}
