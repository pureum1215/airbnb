package dummy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dummy.init.AmenitiesInitData;
import dummy.init.HostInitData;
import dummy.init.LocationInitData;
import dummy.init.PaymentInitData;
import dummy.init.PropertyAmenitiesInitData;
import dummy.init.PropertyInitData;
import dummy.init.PropertyReviewInitData;
import dummy.init.ReservationInitData;
import dummy.init.UserInitData;
import dummy.init.UserReviewInitData;
import dummy.init.WishListInitData;


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
		else if(func.equals("location")) {
			action = new LocationInitData(); //위치 등록하기
			action.execute(dummyDAO);
		}
		else if(func.equals("amenities")) {
			action = new AmenitiesInitData(); // 편의시설 등록하기
			action.execute(dummyDAO);
		}
		else if(func.equals("property")) {
			action = new PropertyInitData(); //숙소 등록하기
			action.execute(dummyDAO);
		}
		else if(func.equals("propertyAm")) {
			action = new PropertyAmenitiesInitData(); //숙소 편의시설
			action.execute(dummyDAO);
		}
		else if(func.equals("userRe")) {
			action = new UserReviewInitData(); //호스트가 쓰는 유저에 대한 리뷰
			action.execute(dummyDAO);
		}
		else if(func.equals("propRe")) {
			action = new PropertyReviewInitData(); //유저가 쓰는 숙소에 대한 리뷰
			action.execute(dummyDAO);
		}
		else if(func.equals("reservation")) {
			action = new ReservationInitData(); // 예약
			action.execute(dummyDAO);
		}
		else if(func.equals("payment")) {
			action = new PaymentInitData();
			action.execute(dummyDAO);
		}
		else if (func.equals("wishlist")) {
			action = new WishListInitData();
			action.execute(dummyDAO);
		}
		
		else if(func.equals("all") || func.equals("start")) {
			action = new UserInitData(); //유저등록하기
			action.execute(dummyDAO);
			
			action = new HostInitData(); // 호스트 등록하기
			action.execute(dummyDAO);
			
			action = new LocationInitData();
			action.execute(dummyDAO);
			
			action = new AmenitiesInitData();
			action.execute(dummyDAO);
			
			action = new PropertyInitData();
			action.execute(dummyDAO);
			
			action = new PropertyAmenitiesInitData();
			action.execute(dummyDAO);
			
			action = new UserReviewInitData();
			action.execute(dummyDAO);
			
			action = new PropertyReviewInitData();
			action.execute(dummyDAO);
			
			action = new ReservationInitData(); // 예약
			action.execute(dummyDAO);
			
			action = new PaymentInitData();
			action.execute(dummyDAO);
			
			action = new WishListInitData();
			action.execute(dummyDAO);
		}
		
		
		dummyDAO.closeCon(); //db 연결 끊기
		
		
	}

	

}