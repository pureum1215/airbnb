package dummy.vo;

public class LocationVO {
	
	private String locationId;
    private String locationCity;
    private String locationCountry;
    private String locationContinent;
    private String locationDetail;
    private double locationX;
    private double locationY;

	public LocationVO(String locationId, String locationCity, String locationCountry, String locationContinent,
			String locationDetail, double locationX, double locationY) {
		super();
		this.locationId = locationId;
		this.locationCity = locationCity;
		this.locationCountry = locationCountry;
		this.locationContinent = locationContinent;
		this.locationDetail = locationDetail;
		this.locationX = locationX;
		this.locationY = locationY;
	}
    
    
	public String getLocationId() {
		return locationId;
	}
	public String getLocationCity() {
		return locationCity;
	}
	public String getLocationCountry() {
		return locationCountry;
	}
	public String getLocationContinent() {
		return locationContinent;
	}
	public String getLocationDetail() {
		return locationDetail;
	}
	public double getLocationX() {
		return locationX;
	}
	public double getLocationY() {
		return locationY;
	}
    
}
