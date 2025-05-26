package userPage.userReservationDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class UserReservationDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("ReservationDetail execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        String reservationId = request.getParameter("reservation_id");
		
        System.out.println("userId: " + userId);
        System.out.println("reservationId: " + reservationId);
        
        // 로그인하지 않은 경우
        if (userId == null) {
            response.sendRedirect("/login.me");
            return null;
        }
        
        // List 불러오기
        UserReservationDetailDAO dao = new UserReservationDetailDAO();
        UserReservationDetailVO vo = new UserReservationDetailVO();
        
        vo = dao.reservationList(reservationId);
		
        ActionForward forward = new ActionForward();
        request.setAttribute("UserReservationDetailVO", vo);
        forward.setPath("user/userReservationDetail.jsp");
        forward.setRedirect(false);
        
        return forward;
	}

}
