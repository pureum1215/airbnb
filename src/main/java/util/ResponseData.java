package util;

public class ResponseData {
	
	private int code;
	private String msg;
	private Object data;
	
	public ResponseData() {
		this.code = 200; //200은 성공을 의미.
	}
	
	public ResponseData(Object data) {
		this.code = 200;
		this.data = data;
	}
	public ResponseData(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}



	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}
