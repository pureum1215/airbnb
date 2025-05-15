package dummy.vo;

public class PropertyReviewVO {
	private String propertyReviewId;
	private String userId;
	private String propertyId;
	private int propertyReviewRating;
	private String propertyReviewContent;

	public PropertyReviewVO(String propertyReviewId, String userId, String propertyId, int propertyReviewRating, String propertyReviewContent) {
		this.propertyReviewId = propertyReviewId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.propertyReviewRating = propertyReviewRating;
		this.propertyReviewContent = propertyReviewContent;
	}

	public String getPropertyReviewId() {
		return propertyReviewId;
	}

	public String getUserId() {
		return userId;
	}

	public String getPropertyId() {
		return propertyId;
	}

	public int getPropertyReviewRating() {
		return propertyReviewRating;
	}

	public String getPropertyReviewContent() {
		return propertyReviewContent;
	}
}
