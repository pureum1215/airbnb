package controller.api.userReservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import userPage.userReservationList.UserReservationListDAO;
import userPage.userReservationList.UserReservationListVO;

public class UserReservationUpcomingAPI extends HttpServlet {
	
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
		
		// 세션에서 user_id 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        // 로그인 안 된 경우 처리
        if (userId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
            return;
        }
        
        // DAO에서 예약 목록 가져오기
        UserReservationListDAO dao = new UserReservationListDAO();
        List<UserReservationListVO> upcomingList = dao.getUpcomingReservations(userId);

		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(upcomingList));
		out.flush();

	}

}
