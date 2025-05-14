package dummy.vo;

public class AmenitiesVO {
	private int amenityId;
    private String amenityName;
    
	public AmenitiesVO(int amenityId, String amenityName) {
		super();
		this.amenityId = amenityId;
		this.amenityName = amenityName;
	}
	
	public int getAmenityId() {
		return amenityId;
	}
	public String getAmenityName() {
		return amenityName;
	}
    
    
}
