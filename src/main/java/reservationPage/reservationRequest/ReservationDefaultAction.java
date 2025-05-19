package reservationPage.reservationRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import reservationPage.ReservationDAO;

public class ReservationDefaultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String propertyId = request.getParameter("property_id");
        
        // 로그인하지 않은 경우
        if (userId == null) {
            response.sendRedirect("/login.me");
            return null;
        }
                
		// property_reservation_default가 바로 결제인지 요청 먼저인지 확인
        ReservationDAO reservationDAO = new ReservationDAO();
        String ReservationType = reservationDAO.getReservationType(propertyId);
        request.setAttribute("property_id", propertyId);
        
        System.out.println(ReservationType);
        
        if ("즉시 예약".equals(ReservationType)) {
	        ActionForward forward = new ActionForward();
	        forward.setPath("reservation/reservationConfirm.jsp");
	        forward.setRedirect(false);
	        
	        return forward;
        }
        
        else if ("예약 요청".equals(ReservationType)) {
        	ActionForward forward = new ActionForward();
            forward.setPath("reservation/reservationRequest.jsp");
            forward.setRedirect(false);
            
            return forward;
        }
        
        
        return null;
	}

}
