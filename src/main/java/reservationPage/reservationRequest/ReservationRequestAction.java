package reservationPage.reservationRequest;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import reservationPage.ReservationDAO;

public class ReservationRequestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 예약 날짜 detail에서 불러오기
		// 날짜 수정 기능 가능, 예약 목록과 비교하여 클릭 안되게 만들기
		// vo에 예약 날짜 담기
		// property_id, user_id 필요
		// reservation_id는 res001 형식
		
		String checkIn = request.getParameter("reservation_check_in");
		String checkOut = request.getParameter("reservation_check_out");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		String propertyId = request.getParameter("property_id");

		ReservationDAO dao = new ReservationDAO();
		String lastReservationId = dao.getLastReservationId();
		int number = Integer.parseInt(lastReservationId.substring(3));
		String newReservationId = String.format("res%03d", number + 1);
		
		ReservationRequestVO vo = new ReservationRequestVO();
		vo.setReservation_id(newReservationId);
		vo.setUser_id(userId);
		vo.setProperty_id(propertyId);
		vo.setReservation_check_in(Date.valueOf(checkIn));
		vo.setReservation_check_out(Date.valueOf(checkOut));
		
		dao.reservationRequest(vo);
		
        ActionForward forward = new ActionForward();
        forward.setPath("// 예약 요청이 완료되었습니다 페이지 //");
        forward.setRedirect(true);
        
        return forward;
	}

}
