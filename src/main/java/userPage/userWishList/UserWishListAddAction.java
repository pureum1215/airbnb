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
		
        // 위시리스트 등록 처리
    	// 위시리스트 등록
    	UserWishListDAO dao = new UserWishListDAO();
    	UserWishListVO vo = new UserWishListVO();
    	
    	dao.wishListCheck(userId, property_id);
		
		
		
		
		return null;
	}

}
