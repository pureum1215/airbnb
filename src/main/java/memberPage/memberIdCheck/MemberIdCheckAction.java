package memberPage.memberIdCheck;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberPage.UserDAO;
import util.ResponseData;

public class MemberIdCheckAction {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("id check");

		ResponseData data = new ResponseData();
		data.setCode(500);

		String memberEmail = request.getParameter("member_email");
		if(memberEmail == null) {
			return data;
		}

		UserDAO userDAO = new UserDAO();
		boolean idcheck = userDAO.userIDcheck(memberEmail);
		userDAO.closeCon();
		if (idcheck) {
			data.setCode(200);
		}

		return data;

	}
}
