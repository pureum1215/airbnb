package dummy.vo;

public class ReservationVO {
	private String reservationId;
	private String propertyId;
	private String userId;
	private String reservationCheckIn;
	private String reservationCheckOut;

	public ReservationVO(String reservationId, String propertyId, String userId, String reservationCheckIn, String reservationCheckOut) {
		this.reservationId = reservationId;
		this.propertyId = propertyId;
		this.userId = userId;
		this.reservationCheckIn = reservationCheckIn;
		this.reservationCheckOut = reservationCheckOut;
	}

	public String getReservationId() {
		return reservationId;
	}

	public String getPropertyId() {
		return propertyId;
	}

	public String getUserId() {
		return userId;
	}

	public String getReservationCheckIn() {
		return reservationCheckIn;
	}

	public String getReservationCheckOut() {
		return reservationCheckOut;
	}
}
