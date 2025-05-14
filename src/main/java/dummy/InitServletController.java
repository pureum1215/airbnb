package dummy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dummy.init.HostInitData;
import dummy.init.UserInitData;


@WebServlet("/init")
public class InitServletController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		
		
		/***************
		 *  더미 기능구현하기  Req 받기 
		 ***************/
		String func = request.getParameter("action");
		if(func == null) {
			return ;
		}
		System.out.println("동작 체크: "+func);
		
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
		DummyAction action = null;
		
		/******************
		 * 사용자가 기능 선택하기
		 *****************/
		if(func.equals("user")) {
			action = new UserInitData(); //유저등록하기
			action.execute(dummyDAO);
		}
		else if(func.equals("host")) {
			action = new HostInitData(); // 호스트 등록하기
			action.execute(dummyDAO);
		}
		else if(func.equals("all") || func.equals("start")) {
			action = new UserInitData(); //유저등록하기
			action.execute(dummyDAO);
			
			action = new HostInitData(); // 호스트 등록하기
			action.execute(dummyDAO);
		}
		
		
		dummyDAO.closeCon(); //db 연결 끊기
		
		
	}

	

}