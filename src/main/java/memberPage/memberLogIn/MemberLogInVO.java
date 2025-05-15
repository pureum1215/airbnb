package memberPage.memberLogIn;

public class MemberLogInVO {
	
	/**************************************************************************
	 * 사용자 id, 사용자 email, 사용자 비밀번호, 사용자 이름, 사용자 삭제 여부
	 **************************************************************************/
	
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_delete_yn;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_delete_yn() {
		return user_delete_yn;
	}
	public void setUser_delete_yn(String user_delete_yn) {
		this.user_delete_yn = user_delete_yn;
	}
	
	@Override
	public String toString() {
		return "MemberLogInVO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_password=" + user_password + ", user_delete_yn=" + user_delete_yn + "]";
	}

}
