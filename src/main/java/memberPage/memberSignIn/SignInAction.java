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
		ActionForward action = new ActionForward();
		UserDAO userDAO = new UserDAO();
		
		
		
		return action;
	}
	
}
