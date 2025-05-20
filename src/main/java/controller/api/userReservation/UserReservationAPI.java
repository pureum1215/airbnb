package controller.api.userReservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import userPage.userReservationList.UserReservationHistoryAction;
import userPage.userReservationList.UserReservationListDAO;
import userPage.userReservationList.UserReservationListVO;
import userPage.userReservationList.UserReservationUpcomingAction;
import util.ResponseData;


public class UserReservationAPI extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		System.out.println("api호출: " + command);
		
		Gson gson = new Gson();
		ResponseData responseData = null;
		
		if (command.equals("/user_reservation_upcoming.ura")) {
			UserReservationUpcomingAction action = new UserReservationUpcomingAction();
			responseData = action.execute(request, response);
		}
		else if (command.equals("/user_reservation_history.ura")) {
			UserReservationHistoryAction action = new UserReservationHistoryAction();
			responseData = action.execute(request, response);
		}
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();

	}

}
