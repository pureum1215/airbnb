package memberPage.memberLogIn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import memberPage.UserDAO;

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
			
			HttpSession session = request.getSession(); // 세션 객체를 먼저 얻어와야 함
			
			/*************************
			 * 여기에 else if 적용할 것. 지금은 어디에 필요한지 모름
			 *************************/
			String redirectUrl = (String) session.getAttribute("prevPage");
			if (redirectUrl == null) {
			    redirectUrl = "main_list.ma"; // 기본값
			}else{
				redirectUrl = "main_list.ma"; // 이곳에서 else if 사 이곳 수정
			}
			
			forward.setPath(redirectUrl);
			forward.setRedirect(true);

			
			//dao에 들러서 user 정보 다시 가져와 session 에 넣기
			mlVOC = userDAO.infoSession(mlVO.getUser_email());
			
			forward.setPath(request.getContextPath()+"/main_list.ma");// 이부분 수정
			forward.setRedirect(true);

			// 세션 등록 과정
			session.setAttribute("userInfo", mlVOC);
			session.setAttribute("user_id", mlVOC.getUser_id());			
			return forward;
		}
		userDAO.closeCon();
		forward.setPath("login.me");
		
		return forward;
	}

}
