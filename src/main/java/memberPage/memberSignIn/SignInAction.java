package memberPage.memberSignIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import memberPage.UserDAO;

public class SignInAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		UserDAO userDAO = new UserDAO();
		MemberSignInVO msVO = new MemberSignInVO();
		
		
		msVO.setUser_email(request.getParameter("user_email"));
		msVO.setUser_name(request.getParameter("user_name"));
		msVO.setUser_password(request.getParameter("user_password"));
		msVO.setUser_phone_number(request.getParameter("user_phone_number"));
		msVO.setUser_birthday(java.sql.Date.valueOf(request.getParameter("user_birthday")));
		
		//성공했을 시,
		if(userDAO.SignIn(msVO)) {
			System.out.println("회원가입성공");
			forward.setPath("login.us");
			forward.setRedirect(true);
		}else {
			forward.setPath("register.us");
			forward.setRedirect(false);
		}
		
		return forward;
		
	}
	
}
