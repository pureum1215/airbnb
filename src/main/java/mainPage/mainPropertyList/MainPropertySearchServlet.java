package mainPage.mainPropertyList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class mainPropertySearchServlet
 */
@WebServlet("/search.api")
public class MainPropertySearchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");

	    String checkin = request.getParameter("checkin");
	    String checkout = request.getParameter("checkout");
	    String location = request.getParameter("location");
	    String category = request.getParameter("category");

	    List<MainPropertyListVO> result = MainPropertyListDAO.search(checkin, checkout, location, category);

	    Gson gson = new Gson();

	    response.setContentType("application/json;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    out.print(new Gson().toJson(result));
	    
	}

}
