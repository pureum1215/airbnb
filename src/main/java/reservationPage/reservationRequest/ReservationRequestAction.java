package reservationPage.reservationRequest;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import reservationPage.ReservationDAO;

public class ReservationRequestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String checkIn = request.getParameter("reservation_check_in");
		String checkOut = request.getParameter("reservation_check_out");
		
		// user_id, property_id 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		String propertyId = request.getParameter("property_id");
		
		ReservationDAO dao = new ReservationDAO();
		
		
		try {
			// reservation_id 값 정하기
			String lastReservationId = dao.getLastReservationId();
			int number = Integer.parseInt(lastReservationId.substring(3));
			String newReservationId = String.format("res%03d", number + 1);
			
			
			// vo에 값 세팅
			ReservationRequestVO vo = new ReservationRequestVO();
			vo.setReservation_id(newReservationId);
			vo.setUser_id(userId);
			vo.setProperty_id(propertyId);
			vo.setReservation_check_in(Date.valueOf(checkIn));
			vo.setReservation_check_out(Date.valueOf(checkOut));
			vo.setReservation_confirm("보류");
			
			// 예약 요청 기능
			dao.reservationRequest(vo);
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
        forward.setPath("reservation/reservationRequestComplete.jsp");
        forward.setRedirect(false);
        
        System.out.println("forward: " + forward);
        
        return forward;
	}

}
