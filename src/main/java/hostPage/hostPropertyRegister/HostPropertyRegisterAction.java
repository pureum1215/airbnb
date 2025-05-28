package hostPage.hostPropertyRegister;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class HostPropertyRegisterAction {
	
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HostPropertyRegistDAO registDAO = new HostPropertyRegistDAO();

		HostPropertyRegisterVO locvo = new HostPropertyRegisterVO();
		
		/********
		 *  request 불러오기
		 ********/
		
		/*******
		 * 주소값 담기
		 *******/
		String addr_detail = request.getParameter("address");
		String addr_city = addr_detail.substring(0,2);
		double addr_lng =Double.parseDouble(request.getParameter("address_lng"));//경도 예시) 124.123
		double addr_lat =Double.parseDouble(request.getParameter("address_lat"));//위도 예시) 30.123
		
		locvo.setLocation_detail(addr_detail);
		locvo.setLocation_city(addr_city);
		locvo.setLocation_x(addr_lng);
		locvo.setLocation_y(addr_lat);
		
		
		/*******
		 * 숙소 정보 담기
		 *******/
		String reservation_default = request.getParameter("reservation_default");
		String property_name = request.getParameter("listingTitle");
		String hostId = request.getParameter("hostId");
		int rooms = Integer.parseInt(request.getParameter("rooms"));
		int bathrooms =Integer.parseInt(request.getParameter("bathrooms"));
		int beds = Integer.parseInt(request.getParameter("beds"));
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		int firstamenity = 0;
		
		/********
		 * 편의 시설 담기 2-1
		 ********/
		String amarray = request.getParameter("amenitiesArray");
		
		String [] amenitiesArray = amarray.split(",");
		
		
		
		
		
		
		boolean result1 = false;
		boolean propertySuccessCheck = false; // 숙소 등록 성공 여
		boolean result3 = false;
		
		
		/**********
		 *  1. 숙소 등록 과정
		 **********/
		int propertyIdx = registDAO.initPropertyIdxCount();
		String cnt = String.format("%03d", propertyIdx);
		
		HostPropertyRegisterVO propvo = new HostPropertyRegisterVO();
		propvo.setProperty_id("prop"+cnt);
		propvo.setHost_id(hostId);
		propvo.setAmenity_id(firstamenity);
		propvo.setProperty_name(property_name);
		propvo.setProperty_description(description);
		propvo.setPrice_per_night(price);
		propvo.setProperty_room(rooms);
		propvo.setProperty_bed(beds);
		propvo.setProperty_bathroom(bathrooms);
		propvo.setProperty_photo_url("prop"+cnt+".jpg");
		propvo.setProperty_reservation_default(reservation_default);
		
		propertySuccessCheck = registDAO.hostPropertyRegister(propvo);
		
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁs");
		
		/**********
		 *  2. 숙소 편의 시설 등록 과정
		 **********/
		
		// 편의시설 목록찾아오기. 2-1 , 2-1
		List<AmenitiesDTO> lists = registDAO.getTotalAmenities();
		for(AmenitiesDTO li : lists) {
			System.out.println(li.getAmenities_name_kr());
		}

		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁe");
		
		
		result1= registDAO.locationInsert(locvo);
		
		//result3= registDAO.insertPropertyAmenities(amenityIds);
		
		registDAO.closeCon();
		
		ResponseData data = null;
		
		data = new ResponseData();
		
		return data;
	}
}
