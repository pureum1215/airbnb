package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservationPage.reservationRequest.ReservationRequestAction;
import reservationPage.reservationPayment.ReservationPaymentAction;
import reservationPage.reservationRequest.ReservationConfirmAction;
import reservationPage.reservationRequest.ReservationDefaultAction;


public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationController() {
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
		forward = new ActionForward();
		
		// 예약 defult 값 확인
		if (command.equals("/reservation_default.re")) {
			action = new ReservationDefaultAction();
		}
		// default 값이 예약 요청인 예약
		else if (command.equals("/reservation_request.re")) {
			action = new ReservationRequestAction();
		}
		// default 값이 즉시 예약인 예약
		else if (command.equals("/reservation_confirm.re")) {
			action = new ReservationConfirmAction();
		}
		// 결제 페이지로 이동
		else if (command.equals("/reservation_payment.re")) {
			action = new ReservationPaymentAction();
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
