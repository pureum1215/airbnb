package hostPage.hostReservationList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class HostReservationConfirmAction {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		ResponseData data = new ResponseData();
		
		
		String reservationId = request.getParameter("reservation_id");
		
		HostReservationListDAO dao = new HostReservationListDAO();
		int check = dao.reservationConfirm(reservationId);
		
		System.out.println("승인 체크: " + check);
		
		if (check > 0) {
		    data.setCode(200); // 성공
		} else {
		    data.setCode(500); // 실패
		}
		return data;
		
	}
}
