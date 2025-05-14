package dummy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InitServletController")
public class InitServletController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		System.out.println("동작 체크: "+command);
		
		/***************
		 *  더미 기능구현하기  Req 받기 
		 ***************/
		String func = request.getParameter("action");
		if(func == null) {
			return ;
		}
		
		/***
		 * db 연결하기
		 */
		DummyDAO dummyDAO = new DummyDAO();
		if(!dummyDAO.getConnection()) {
			return ;
		}
		
		
		/****
		 * 동적 바인딩
		 */
		Action action = null;
		
		/******************
		 * 사용자가 기능 선택하기
		 *****************/
		if(func.equals("1")) {
			
			action = new UserInitData(); //유저등록하기
			action.execute(dummyDAO);
			
		}
		
		
		dummyDAO.closeCon(); //db 연결 끊기
		
		
	}


}