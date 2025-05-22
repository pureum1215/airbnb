package hostPage.hostReservationList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userPage.userReservationList.UserReservationListDAO;
import userPage.userReservationList.UserReservationListVO;
import util.ResponseData;

public class HostReservationUpcomingAction {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		ResponseData data = null;
		
		// 세션에서 user_id 가져오기
        HttpSession session = request.getSession();
        String hostId = (String) session.getAttribute("host_id");
        System.out.println("userId: " + hostId);
        
        // 로그인 안 된 경우 처리
        if (hostId == null) {
            return new ResponseData(401, "호스트가 아닙니다.");
        }
        
        // DAO에서 예약 목록 가져오기
		UserReservationListDAO dao = new UserReservationListDAO();
		List<UserReservationListVO> upcomingList = dao.getUpcomingReservations(hostId);
		
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
