package hostPage.hostReservationDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class HostReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("ReviewAction execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        HttpSession session = request.getSession();
        String hostId = (String) session.getAttribute("host_id");
        String reservationId = request.getParameter("reservation_id");
        String userId = request.getParameter("user_id");
		
        System.out.println("hostId: " + hostId);
        System.out.println("reservationId: " + reservationId);
		int reviewRating = Integer.parseInt(request.getParameter("property_review_rating"));
		String reviewContent = request.getParameter("property_review_content");
		
		HostReservationDetailDAO dao = new HostReservationDetailDAO();
		HostReservationDetailVO vo = new HostReservationDetailVO();
		
        // review_id 생성
		int number = Integer.parseInt(reservationId.substring(3));
		String newReviewId = String.format("prv%03d", number + 1);
        
        // vo에 입력받은 값 세팅
        vo.setUser_review_id(newReviewId);
        vo.setUser_id(userId);
        vo.setHost_id(hostId);
        vo.setUser_review_rating(reviewRating);
        vo.setUser_review_content(reviewContent);
        
        // 리뷰 등록 기능
        dao.userReview(vo);
		
        ActionForward forward = new ActionForward();
        request.setAttribute("reservation_id", reservationId);
        forward.setPath("hostReservationDetail.us");
        forward.setRedirect(false);
        
        return forward;
	}

}
