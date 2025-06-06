package userPage.userReservationList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import util.ResponseData;

public class UserReservationUpcomingAction {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		ResponseData data = null;
		
		// 세션에서 user_id 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        System.out.println("userId: " + userId);
        
        // 로그인 안 된 경우 처리
        if (userId == null) {
            return new ResponseData(401, "로그인이 필요합니다.");
        }
        
        // DAO에서 예약 목록 가져오기
		UserReservationListDAO dao = new UserReservationListDAO();
		List<UserReservationListVO> upcomingList = dao.getUpcomingReservations(userId);
		
		System.out.println("가져온 예약 수: " + upcomingList.size());
		
		if ( upcomingList.size() != 0 ) {
			data = new ResponseData();
			data.setData(upcomingList);
		}
		else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;

	}	
}
