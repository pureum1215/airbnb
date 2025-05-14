package dummy.vo;

public class UserVO {

	private String userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String phoneNumber;
	private String userBirthday;
	
	
	public UserVO(String userId, String userName, String userEmail, String userPassword, String phoneNumber,
			String userBirthday) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.phoneNumber = phoneNumber;
		this.userBirthday = userBirthday;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	
	
}
