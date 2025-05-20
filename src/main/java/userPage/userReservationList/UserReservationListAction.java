package userPage.userReservationList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class UserReservationListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
		UserReservationListDAO dao = new UserReservationListDAO();
		List<UserReservationListVO> list = null;
		
		// user_id, property_id 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		

		// dao method 호출 부분
		
		request.setAttribute("list", list);
		request.setAttribute("contentPage", "board/boardList.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setPath("user/UserReservationList.jsp");
		forward.setRedirect(true);
				
		return forward;
	}

}
