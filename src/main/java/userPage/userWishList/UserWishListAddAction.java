package userPage.userWishList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class UserWishListAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // 로그인 체크
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
            ActionForward forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("login.co");
            return forward;
        }
		
        // 숙소 id 가져오기
        String property_id = request.getParameter("property_id");
		
    	UserWishListDAO dao = new UserWishListDAO();
    	UserWishListVO vo = new UserWishListVO();
    	
    	// 위시리스트 존재하는지 확인
    	boolean check = dao.wishListCheck(userId, property_id);
		
    	// 존재할 때 위시리스트에서 삭제
    	if (check) {
    		dao.wishListDelete(userId, property_id);
    	}
    	// 존재하지 않을 때 위시리스트에 추가
    	else {
    		dao.wishListAdd(userId, property_id);
    	}
    	
    	
    	// 왔던 jsp로 다시 돌아가기
    	ActionForward forward = new ActionForward();
    	String referer = request.getHeader("Referer");
    	
    	// 기본값은 메인 화면으로 돌아가게 하기
    	forward.setPath(referer != null ? referer : "/main_property_list.jsp");
    	forward.setRedirect(true);

    	return forward;
	}

}
