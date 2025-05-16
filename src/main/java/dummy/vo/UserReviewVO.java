package dummy.vo;

import java.sql.Date;

public class UserReviewVO {
	private String userReviewId;
	private String userId;
	private String hostId;
	private int userReviewRating;
	private String userReviewContent;
	private Date user_review_created_at; //
	
	public UserReviewVO(String userReviewId, String hostId, String userId, int userReviewRating, String userReviewContent, Date user_review_created_at) {
		this.userReviewId = userReviewId;
		this.hostId = hostId;
		this.userId = userId;
		this.userReviewRating = userReviewRating;
		this.userReviewContent = userReviewContent;
		this.user_review_created_at =user_review_created_at;
	}

	public String getUserReviewId() {
		return userReviewId;
	}

	public String getUserId() {
		return userId;
	}

	public String getHostId() {
		return hostId;
	}

	public int getUserReviewRating() {
		return userReviewRating;
	}

	public String getUserReviewContent() {
		return userReviewContent;
	}

	public Date getUser_review_created_at() {
		return user_review_created_at;
	}
	
}
