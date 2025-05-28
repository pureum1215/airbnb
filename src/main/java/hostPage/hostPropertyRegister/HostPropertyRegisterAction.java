package hostPage.hostPropertyRegister;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class HostPropertyRegisterAction {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HostPropertyRegisterVO locvo = new HostPropertyRegisterVO();
		
		String addr_detail = request.getParameter("address");
		String addr_city = addr_detail.substring(0,2);
		double addr_lng =Double.parseDouble(request.getParameter("address_lng"));//경도 예시) 124.123
		double addr_lat =Double.parseDouble(request.getParameter("address_lat"));//위도 예시) 30.123
		
		locvo.setLocation_detail(addr_detail);
		locvo.setLocation_city(addr_city);
		locvo.setLocation_x(addr_lng);
		locvo.setLocation_y(addr_lat);
		
		String reservation_default = request.getParameter("reservation_default");
		String property_name = request.getParameter("listingTitle");
		
		
		
		return null;
	}
}
