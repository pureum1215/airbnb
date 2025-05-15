package memberPage.memberSignIn;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberSignInVO {
	
	/**************************************************************************
	 * 사용자 아이디, 이름, 이메일, 비밀번호, 전화번호, 생일, 계정 생성 시간, 삭제 여부
	 **************************************************************************/

	private String user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_phone_number;
	private Date user_birthday;
	private Timestamp user_created_at;
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
	public String getUser_phone_number() {
		return user_phone_number;
	}
	public void setUser_phone_number(String user_phone_number) {
		this.user_phone_number = user_phone_number;
	}
	public Date getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}
	public Timestamp getUser_created_at() {
		return user_created_at;
	}
	public void setUser_created_at(Timestamp user_created_at) {
		this.user_created_at = user_created_at;
	}
	public String getUser_delete_yn() {
		return user_delete_yn;
	}
	public void setUser_delete_yn(String user_delete_yn) {
		this.user_delete_yn = user_delete_yn;
	}
	
	@Override
	public String toString() {
		return "MemberSignInVO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_password=" + user_password + ", user_phone_number=" + user_phone_number + ", user_birthday="
				+ user_birthday + ", user_created_at=" + user_created_at + ", user_delete_yn=" + user_delete_yn + "]";
	}
	
}
