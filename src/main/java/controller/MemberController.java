package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberPage.memberLogIn.LoginAction;
import memberPage.memberSignIn.SignInAction;



public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			process(request, response);
		}
		
		protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String url = request.getRequestURI();
			String path = request.getContextPath();
			String command = url.substring(path.length());
			
			Action action = null;
			ActionForward forward = null;
			
			/****************************** 
			 * 페이지 이동 작성 구간
			 *****************************/
			
			if(command.equals("/login.me")) {
				forward = new ActionForward();
				forward.setPath("member/login.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/register.me")) {
				forward = new ActionForward();
				forward.setPath("member/register.jsp");
				forward.setRedirect(false);
			}
			else if(command.equals("/registerProcess.me")) {
				action = new SignInAction();
				
			}
			else if(command.equals("/loginProcess.me")) {
				action = new LoginAction();
				
			}
			
			try {
				if ( action != null ) {
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
