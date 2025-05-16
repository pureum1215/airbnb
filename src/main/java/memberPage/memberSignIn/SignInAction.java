package memberPage.memberSignIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import dao.UserDAO;

public class SignInAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		UserDAO userDAO = new UserDAO();
		MemberSignInVO msVO = new MemberSignInVO();
		
		//userid를 늘려야 되므로 db를 확인해야함.
		//그렇다면 setUserId는 dao에서 해야 할까?
		
		msVO.setUser_id(null);// userid 는 user***이다.

		msVO.setUser_name(request.getParameter("name1"));
		msVO.setUser_email(request.getParameter("email"));
		msVO.setUser_password(request.getParameter("password"));
		msVO.setUser_phone_number(request.getParameter("phoneNumber1"));
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
