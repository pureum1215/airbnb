package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainPage.mainPropertyDetail.PropertyDAO;
import mainPage.mainPropertyList.MainPropertyListAction;
import mainPage.mainPropertyList.MainPropertyListDAO;
import mainPage.mainPropertyList.MainPropertyListVO;
import mainPage.mainPropertyList.MainPropertySearchAction;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MainPropertyListDAO mainPropertyDAO = new MainPropertyListDAO(); // DAO 객체 준비
	PropertyDAO propDAO = new PropertyDAO();
    /**
     * Default constructor. 
     */
    public MainController() {
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
		forward = new ActionForward();
		
		
		/****************************** 
		 * 페이지 이동 작성 구간
		 *****************************/		
		
		if(command.equals("/main_detail.ma")) {
			forward.setPath("main/main_property_detail.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/main_list.ma")) {
			action = new MainPropertyListAction();
		}
		else if(command.equals("/logout.ma")) {
			forward.setPath("main/logout.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/property_search.ma")) {
			action = new MainPropertySearchAction();
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
