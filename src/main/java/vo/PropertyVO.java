package vo;

public class PropertyVO {

	private String property_id;
	private String host_id;
	private String location_id;
	private int amenity_id;
	private String property_name;
	private String property_description;
	private int price_per_night;
	private int property_room;
	private int property_bed;
	private int property_bathroom;
	private String property_reservation_default;
	private String property_photo_url;
	private String property_delete_yn;
	
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public int getAmenity_id() {
		return amenity_id;
	}
	public void setAmenity_id(int amenity_id) {
		this.amenity_id = amenity_id;
	}
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
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
	public String getProperty_reservation_default() {
		return property_reservation_default;
	}
	public void setProperty_reservation_default(String property_reservation_default) {
		this.property_reservation_default = property_reservation_default;
	}
	public String getProperty_photo_url() {
		return property_photo_url;
	}
	public void setProperty_photo_url(String property_photo_url) {
		this.property_photo_url = property_photo_url;
	}
	public String getProperty_delete_yn() {
		return property_delete_yn;
	}
	public void setProperty_delete_yn(String property_delete_yn) {
		this.property_delete_yn = property_delete_yn;
	}
	
	@Override
	public String toString() {
		return "PropertyVO [property_id=" + property_id + ", host_id=" + host_id + ", location_id=" + location_id
				+ ", amenity_id=" + amenity_id + ", property_name=" + property_name + ", property_description="
				+ property_description + ", price_per_night=" + price_per_night + ", property_room=" + property_room
				+ ", property_bed=" + property_bed + ", property_bathroom=" + property_bathroom
				+ ", property_reservation_default=" + property_reservation_default + ", property_photo_url="
				+ property_photo_url + ", property_delete_yn=" + property_delete_yn + "]";
	}
	
}
