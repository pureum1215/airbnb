package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userPage.userReservationDetail.UserReservationDetailAction;
import userPage.userReservationDetail.UserReviewAction;
import userPage.userWishList.UserWishListAddAction;



public class UserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		System.out.println("command: "+command);
		
		Action action = null;
		ActionForward forward = null;
		forward = new ActionForward();
	
		/****************************** 
		 * 페이지 이동 작성 구간
		 *****************************/
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user_id");
		
		if (command.equals("/wishlist_add.us")) {
			action = new UserWishListAddAction();
		}
		else if(command.equals("/userProfile.us")){
			if(userId!= null) {
				forward.setPath("user/userProfile.jsp");
				forward.setRedirect(false);
			}else {
				forward.setPath("member/login.jsp");
				forward.setRedirect(false);
			}
		}
		else if(command.equals("/userwishlist.us")) {
			if(userId!= null) {
				forward.setPath("user/userWishList.jsp");
				forward.setRedirect(false);
			}else {
				forward.setPath("member/login.jsp");
				forward.setRedirect(false);
			}
		}
		else if (command.equals("/userReservationDetail.us")) {
			action = new UserReservationDetailAction();
		}
		else if (command.equals("/userReviewSubmit.us")) {
			action = new UserReviewAction();
		}
		
		
		try {
			if(action != null) {
				forward = action.execute(request, response);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
		
	}


}
