package reservationPage.reservationPayment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;

public class ReservationPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 예약 id 가져오기
		// reservation db에 저장되어 있는 값
		// payment_id, payment_price, payment_status, payment_created_at 
		
		String paymentMethod = request.getParameter("payment_method");
		
		
		return null;
	}

}
