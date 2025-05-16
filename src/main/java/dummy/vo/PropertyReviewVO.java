package dummy.vo;

import java.sql.Date;

public class PropertyReviewVO {
	private String propertyReviewId;
	private String userId;
	private String propertyId;
	private int propertyReviewRating;
	private String propertyReviewContent;
	private Date property_review_created_at; //
	
	public PropertyReviewVO(String propertyReviewId, String userId, String propertyId, int propertyReviewRating, String propertyReviewContent,
		Date property_review_created_at) {
		this.propertyReviewId = propertyReviewId;
		this.userId = userId;
		this.propertyId = propertyId;
		this.propertyReviewRating = propertyReviewRating;
		this.propertyReviewContent = propertyReviewContent;
		this.property_review_created_at =property_review_created_at;
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

	public Date getProperty_review_created_at() {
		return property_review_created_at;
	}
	
}
