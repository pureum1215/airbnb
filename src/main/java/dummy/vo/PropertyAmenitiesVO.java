package dummy.vo;

public class PropertyAmenitiesVO {
	private int amenityId;
	private String propertyId;

	public PropertyAmenitiesVO(int amenityId, String propertyId) {
		this.amenityId = amenityId;
		this.propertyId = propertyId;
	}

	public int getAmenityId() {
		return amenityId;
	}

	public String getPropertyId() {
		return propertyId;
	}
}
