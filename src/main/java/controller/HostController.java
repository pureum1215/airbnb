package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservationPage.reservationPayment.ReservationPaymentAction;
import reservationPage.reservationRequest.ReservationConfirmAction;
import reservationPage.reservationRequest.ReservationDefaultAction;
import reservationPage.reservationRequest.ReservationRequestAction;

/**
 * Servlet implementation class HostController
 */
@WebServlet("/HostController")
public class HostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostController() {
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
		System.out.println("command: "+command);
		
		Action action = null;
		ActionForward forward = null;
		forward = new ActionForward();
		
		
		/****************************** 
		 * 페이지 이동 작성 구간
		 *****************************/
		if(command.equals("/hostList.ho")) {
			forward = new ActionForward();
			forward.setPath("host/hostPropertyList.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/hostprdetail.ho")) {
			forward = new ActionForward();
			forward.setPath("host/hostPropertyDetail.jsp");
			forward.setRedirect(false);
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
