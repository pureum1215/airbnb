package memberPage.memberLogIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import dao.UserDAO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		MemberLogInVO mlVO = new MemberLogInVO(); //내가 입력한 값.
		UserDAO userDAO = new UserDAO();
		MemberLogInVO mlVOB = new MemberLogInVO(); // 확인해볼값.
		MemberLogInVO mlVOC = new MemberLogInVO(); // sessoin에 넣을 값
		
		
		mlVO.setUser_email(request.getParameter("user_email"));
		mlVO.setUser_password(request.getParameter("user_password"));
		
		mlVOB = userDAO.login(mlVO.getUser_email());
		
		if(mlVOB != null&& mlVO.getUser_password().equals(mlVOB.getUser_password())) {
			//dao에 들러서 user 정보 다시 가져와 session 에 넣기
			mlVOC = userDAO.infoSession(mlVO.getUser_email());
			
			forward.setPath("main/main_property_list.jsp");
			forward.setRedirect(true);

			// 세션 등록 과정
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", mlVOC);
			return forward;
		}
		userDAO.closeCon();
		forward.setPath("login.us");
		
		return forward;
	}

}
