package reservationPage;

public class ReservationDefaultVO {
	
	/* 숙소 id, 숙소 예약 default */
	
	private String property_id;
	private String property_reservation_default;
	
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public String getProperty_reservation_default() {
		return property_reservation_default;
	}
	public void setProperty_reservation_default(String property_reservation_default) {
		this.property_reservation_default = property_reservation_default;
	}
	
	@Override
	public String toString() {
		return "ReservationDefaultVO [property_id=" + property_id + ", property_reservation_default="
				+ property_reservation_default + "]";
	}	
	
}
