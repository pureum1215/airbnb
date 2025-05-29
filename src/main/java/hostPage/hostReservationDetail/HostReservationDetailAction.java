package hostPage.hostReservationDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class HostReservationDetailAction implements Action {

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
        HostReservationDetailDAO dao = new HostReservationDetailDAO();
        HostReservationDetailVO vo = new HostReservationDetailVO();
        
        vo = dao.reservationList(reservationId);
		
        ActionForward forward = new ActionForward();
        request.setAttribute("HostReservationDetailVO", vo);
        System.out.println("mhs");
        System.out.println(vo.toString());
        forward.setPath("host/hostReservationDetail.jsp");
        forward.setRedirect(false);
        
        return forward;
	}

}
