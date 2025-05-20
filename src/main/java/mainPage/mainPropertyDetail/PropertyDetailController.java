package mainPage.mainPropertyDetail;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PropertyDetailController
 */
@WebServlet("/PropertyDetailController")
public class PropertyDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PropertyDAO dao = new PropertyDAO();    /**
     * @see HttpServlet#HttpServlet()
     */
    public PropertyDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String propertyId = request.getParameter("propertyId"); // 예: ?propertyId=prop001

		// 1. DAO에서 리뷰 리스트 가져오기
		List<MainPropertyDetailVO> madVOReview = dao.propertyReviewName(propertyId);

		// 2. JSP에서 쓸 수 있도록 저장
		request.setAttribute("madVOReview", madVOReview);

		// 3. JSP로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main_property_detail.jsp");
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
