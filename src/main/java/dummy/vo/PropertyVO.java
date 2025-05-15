package dummy.vo;

public class PropertyVO {
	private String propertyId;
	private String hostId;
	private String locationId;
	private int amenityId;
	private String propertyName;
	private String propertyDescription;
	private int pricePerNight;
	private int propertyRoom;
	private int propertyBed;
	private int propertyBathroom;
	private String propertyReservationDefault;
	private String propertyPhotoUrl;
	private String propertyDeleteYn;

	public PropertyVO(String propertyId, String hostId, String locationId, int amenityId, String propertyName,
			String propertyDescription, int pricePerNight, int propertyRoom, int propertyBed, int propertyBathroom,
			String propertyReservationDefault, String propertyPhotoUrl, String propertyDeleteYn) {
		this.propertyId = propertyId;
		this.hostId = hostId;
		this.locationId = locationId;
		this.amenityId = amenityId;
		this.propertyName = propertyName;
		this.propertyDescription = propertyDescription;
		this.pricePerNight = pricePerNight;
		this.propertyRoom = propertyRoom;
		this.propertyBed = propertyBed;
		this.propertyBathroom = propertyBathroom;
		this.propertyReservationDefault = propertyReservationDefault;
		this.propertyPhotoUrl = propertyPhotoUrl;
		this.propertyDeleteYn = propertyDeleteYn;
	}

	public String getPropertyId() {
		return propertyId;
	}

	public String getHostId() {
		return hostId;
	}

	public String getLocationId() {
		return locationId;
	}

	public int getAmenityId() {
		return amenityId;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public String getPropertyDescription() {
		return propertyDescription;
	}

	public int getPricePerNight() {
		return pricePerNight;
	}

	public int getPropertyRoom() {
		return propertyRoom;
	}

	public int getPropertyBed() {
		return propertyBed;
	}

	public int getPropertyBathroom() {
		return propertyBathroom;
	}

	public String getPropertyReservationDefault() {
		return propertyReservationDefault;
	}

	public String getPropertyPhotoUrl() {
		return propertyPhotoUrl;
	}

	public String getPropertyDeleteYn() {
		return propertyDeleteYn;
	}
}
