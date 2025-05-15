package dummy.vo;

public class UserReviewVO {
	private String userReviewId;
	private String userId;
	private String hostId;
	private int userReviewRating;
	private String userReviewContent;

	public UserReviewVO(String userReviewId, String userId, String hostId, int userReviewRating, String userReviewContent) {
		this.userReviewId = userReviewId;
		this.userId = userId;
		this.hostId = hostId;
		this.userReviewRating = userReviewRating;
		this.userReviewContent = userReviewContent;
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
}
