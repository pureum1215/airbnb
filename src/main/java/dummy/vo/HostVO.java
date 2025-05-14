package dummy.vo;

public class HostVO {
	private String hostId;
	private String userId;
	private String hostBio;
	
	
	public HostVO(String hostId, String userId, String hostBio) {
		super();
		this.hostId = hostId;
		this.userId = userId;
		this.hostBio = hostBio;
	}
	
	public String getHostId() {
		return hostId;
	}
	public String getUserId() {
		return userId;
	}
	public String getHostBio() {
		return hostBio;
	}
	
	
}
