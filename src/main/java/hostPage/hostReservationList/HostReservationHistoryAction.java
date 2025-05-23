package hostPage.hostReservationList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ResponseData;

public class HostReservationHistoryAction {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		ResponseData data = null;
		
		// 세션에서 host_id 가져오기
        HttpSession session = request.getSession();
        String hostId = (String) session.getAttribute("host_id");
        System.out.println("hostId: " + hostId);
        
        // 로그인 안 된 경우 처리
        if (hostId == null) {
            return new ResponseData(401, "호스트가 아닙니다.");
        }
        
        // DAO에서 예약 목록 가져오기
		HostReservationListDAO dao = new HostReservationListDAO();
		List<HostReservationListVO> historyList = dao.getHistoryReservations(hostId);

		System.out.println("가져온 예약 수: " + historyList.size());
		
		if ( historyList.size() != 0 ) {
			data = new ResponseData();
			data.setData(historyList);
		}
		else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;

	}	
	
}
