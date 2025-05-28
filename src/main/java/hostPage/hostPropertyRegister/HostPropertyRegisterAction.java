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

		
		/********
		 *  request 불러오기
		 ********/
		
		/*******
		 * 주소값 담기
		 *******/
		String addr_detail = request.getParameter("address");
		String addr_city = addr_detail.split(" ")[0] +" " + addr_detail.split(" ")[1] ;
		double addr_lng =Double.parseDouble(request.getParameter("address_lng"));//경도 예시) 124.123
		double addr_lat =Double.parseDouble(request.getParameter("address_lat"));//위도 예시) 30.123
		
		HostPropertyRegisterVO locvo = new HostPropertyRegisterVO();

		
		
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
		
		String amarray = request.getParameter("amenitiesArray");
		
		
		
		
		
		/**********
		 *  1. 숙소 등록 과정
		 **********/
		int propertyCnt = registDAO.initPropertyIdxCount();
		String cnt = String.format("%03d", propertyCnt);
		
		HostPropertyRegisterVO propvo = new HostPropertyRegisterVO();
		String propertyIdx = "prop"+cnt;
		propvo.setProperty_id(propertyIdx);
		propvo.setHost_id(hostId);
		propvo.setAmenity_id(firstamenity);
		propvo.setProperty_name(property_name);
		propvo.setProperty_description(description);
		propvo.setPrice_per_night(price);
		propvo.setProperty_room(rooms);
		propvo.setProperty_bed(beds);
		propvo.setProperty_bathroom(bathrooms);
		propvo.setProperty_photo_url(propertyIdx+".jpg");
		propvo.setProperty_reservation_default(reservation_default);
		
		if(!registDAO.hostPropertyRegister(propvo)) {
			return new ResponseData(500, "data false");
		}

		System.out.println("insert propertyIDx: "+propertyIdx);
		
		
		
		/**********
		 *  2. 숙소 편의 시설 등록 과정
		 **********/
		String [] amenitiesArray = amarray.split(",");

		for(String li: amenitiesArray) {
			int amenityIdx = registDAO.getAmenityById(li);
			
			//-1이 표시 될 때, 실패
			if(amenityIdx == -1) {
				System.out.println("amenityIdx 찾을 수 없음 amenityIdx: "+amenityIdx);
				return new ResponseData(500, "data false");
			}
			
			if(!registDAO.insertPropertyAmenities(amenityIdx, propertyIdx)) {
				System.out.println("PROPERTY_AMENITIES false / amenityIdx: "+amenityIdx+" / propertyIdx: "+propertyIdx);
				return new ResponseData(500, "data false");
			}
			System.out.println(li);
		}
		
		
		
		
		/**********
		 *  3. 위치 등록
		 **********/
		String locationIdx = "loc"+cnt;
		locvo.setLocation_id(locationIdx);
		locvo.setLocation_city(addr_city);
		locvo.setLocation_detail(addr_detail);
		locvo.setLocation_x(addr_lng);
		locvo.setLocation_y(addr_lat);
		locvo.setLocation_continent("아시아");
		locvo.setLocation_country("한국");
		//dao 등록
		if(!registDAO.locationInsert(locvo)) {
			System.out.println("LOCATION false / locationIdx: "+locationIdx);
			return new ResponseData(500, "data false");
		}
		
		
		
		
		//result3= registDAO.insertPropertyAmenities(amenityIds);
		
		ResponseData data = null;
		
		data = new ResponseData();
		
		return data;
	}
}
