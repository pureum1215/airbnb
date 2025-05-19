package mainPage.mainPropertyList;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainPropertyListController
 */
@WebServlet("/MainPropertyListController")
public class MainPropertyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MainPropertyListDAO dao = new MainPropertyListDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPropertyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// 1. 전체 숙소 정보 가져오기
		List<MainPropertyListVO> propertyList = dao.allgetProperty();

		// 2. JSP에서 사용할 수 있게 request에 저장
		request.setAttribute("propertyList", propertyList);

		// 3. JSP로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main_property_list.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
