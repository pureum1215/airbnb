package dummy.vo;

public class WishListVO {
	private String userId;
	private String propertyId;

	public WishListVO(String userId, String propertyId) {
		this.userId = userId;
		this.propertyId = propertyId;
	}

	public String getUserId() {
		return userId;
	}

	public String getPropertyId() {
		return propertyId;
	}
}
