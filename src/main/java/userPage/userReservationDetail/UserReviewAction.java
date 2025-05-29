package userPage.userReservationDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class UserReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("ReviewAction execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        String reservationId = request.getParameter("reservation_id");
        String propertyId = request.getParameter("property_id");
		
        System.out.println("userId: " + userId);
        System.out.println("reservationId: " + reservationId);
		int reviewRating = Integer.parseInt(request.getParameter("property_review_rating"));
		String reviewContent = request.getParameter("property_review_content");
        
        // 로그인하지 않은 경우
        if (userId == null) {
            response.sendRedirect("/login.me");
            return null;
        }
        
        UserReservationDetailDAO dao = new UserReservationDetailDAO();
        UserReservationDetailVO vo = new UserReservationDetailVO();
        
        // review_id 생성
		int number = Integer.parseInt(reservationId.substring(3));
		String newReviewId = String.format("prv%03d", number + 1);
        
        // vo에 입력받은 값 세팅
        vo.setProperty_review_id(newReviewId);
        vo.setUser_id(userId);
        vo.setProperty_id(propertyId);
        vo.setProperty_review_rating(reviewRating);
        vo.setProperty_review_content(reviewContent);
        
        // 리뷰 등록 기능
        dao.propertyReview(vo);
		
        ActionForward forward = new ActionForward();
        request.setAttribute("reservation_id", reservationId);
        forward.setPath("userReservationDetail.us");
        forward.setRedirect(false);
        
        return forward;
	}

}
