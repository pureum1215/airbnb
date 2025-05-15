package dummy.vo;

public class PaymentVO {
	private String paymentId;
	private String reservationId;
	private int paymentPrice;
	private String paymentMethod;
	private String paymentStatus;

	public PaymentVO(String paymentId, String reservationId, int paymentPrice, String paymentMethod, String paymentStatus) {
		this.paymentId = paymentId;
		this.reservationId = reservationId;
		this.paymentPrice = paymentPrice;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public String getReservationId() {
		return reservationId;
	}

	public int getPaymentPrice() {
		return paymentPrice;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}
}
