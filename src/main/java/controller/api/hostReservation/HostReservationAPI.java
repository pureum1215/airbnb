package controller.api.hostReservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hostPage.hostReservationList.HostReservationConfirmAction;
import hostPage.hostReservationList.HostReservationDeclineAction;
import hostPage.hostReservationList.HostReservationHistoryAction;
import hostPage.hostReservationList.HostReservationUpcomingAction;
import util.ResponseData;

public class HostReservationAPI extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
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
		
		if (command.equals("/host_reservation_upcoming.hra")) {
			HostReservationUpcomingAction action = new HostReservationUpcomingAction();
			responseData = action.execute(request, response);
		}
		else if (command.equals("/host_reservation_history.hra")) {
			HostReservationHistoryAction action = new HostReservationHistoryAction();
			responseData = action.execute(request, response);
		}
		else if (command.equals("/reservation_confirm.hra")) {
			HostReservationConfirmAction action = new HostReservationConfirmAction();
			responseData = action.execute(request, response);
		}
		else if (command.equals("/reservation_decline.hra")) {
			HostReservationDeclineAction action = new HostReservationDeclineAction();
			responseData = action.execute(request, response);
		}
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();

	}

}
