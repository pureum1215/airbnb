package reservationPage.reservationPayment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import reservationPage.ReservationDAO;

public class ReservationPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 예약 id 가져오기
		// reservation db에 저장되어 있는 값
		// payment_id, payment_price, payment_status, payment_created_at 
		
		String paymentMethod = request.getParameter("payment_method");
		String reservationId = request.getParameter("resesrvation_id");
		String propertyId = request.getParameter("property_id");
		
		ReservationDAO dao = new ReservationDAO();

		
		try {
			// payment_id 값 정하기
			String lastPaymentId = dao.getLastPaymentId();
			int number = Integer.parseInt(lastPaymentId.substring(3));
			String newPaymentId = String.format("res%03d", number + 1);
			
			// 총 비용 구하기
			int totalPrice = dao.getTotalPrice(propertyId);
			
			
			// vo에 값 세팅
			ReservationPaymentVO vo = new ReservationPaymentVO();
			vo.setPayment_id(newPaymentId);
			vo.setReservation_id(reservationId);
			vo.setPayment_price(totalPrice);
			vo.setPayment_method(paymentMethod);
			
			// 결제 기능
			dao.reservationPayment(vo);
		}
		catch(SQLException e) {
			System.out.println("sql");
			e.printStackTrace();
		}
		catch(IOException e) {
			System.out.println("input, output");
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dao.closeCon();
		}
		
		
        ActionForward forward = new ActionForward();
        forward.setPath("user/userReservationList.jsp");
        forward.setRedirect(true);
        
        System.out.println("forward: " + forward);
        
        return forward;
	}

}
