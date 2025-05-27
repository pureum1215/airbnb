package hostPage.hostPropertyDetailModify;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;


import util.ResponseData;

public class HostModifyAction {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response)  {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		int result1 =0;//dao.hostPropertyname(vo);
		boolean result2 = false;//result2 = dao.deleteProAm(propertyId);
		boolean result3 = false;//result3 = dao.insertPropertyAmenities(propertyId,amenityIds);
		
		
		
		String propertyId = request.getParameter("propertyId");
		String reservation_default = request.getParameter("reservation_default");
		String property_name = request.getParameter("listingTitle");

		int rooms = Integer.parseInt(request.getParameter("rooms"));
		int beds = Integer.parseInt(request.getParameter("beds"));
		int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
		int price = Integer.parseInt(request.getParameter("price"));

		String photo = request.getParameter("photo");
		String description = request.getParameter("description");

		// amenitiesArray는 배열로 전달되므로 getParameterValues로 받아야 함
		String[] amenitiesArray = request.getParameterValues("amenitiesArray");
		
		System.out.println("size: "+amenitiesArray.length);
//		List<String> haveAmenities = Arrays.asList(amenitiesArray); // 배열 → 리스트
//		
//		String[] amenitiesArray = haveAmenities.toArray(new String[0]);
		Map<String, Integer> amenityMap = new HashMap<>();
		amenityMap.put("WI-FI", 1);
		amenityMap.put("에어컨", 2);
		amenityMap.put("난방", 3);
		amenityMap.put("부엌", 4);
		amenityMap.put("샤워실", 5);
		amenityMap.put("헤어드라이기", 6);
		amenityMap.put("무료주차장", 7);
		amenityMap.put("수영장", 8);
		amenityMap.put("헬스장", 9);
		amenityMap.put("반려동물 가능", 10);
		List<Integer> amenityIds = new ArrayList<>();

		for (String amenity : amenitiesArray) {
		    Integer id = amenityMap.get(amenity);
		    if (id != null) {
		        amenityIds.add(id);
		    }
		}
		
		HostPropertyDetailModifyVO vo = new HostPropertyDetailModifyVO();
		vo.setProperty_id(propertyId);
		vo.setProperty_name(property_name);
		vo.setProperty_room(rooms);
		vo.setProperty_bed(beds);
		vo.setProperty_bathroom(bathrooms);
		vo.setPrice_per_night(price);
		vo.setProperty_photo_url(photo);
		vo.setProperty_description(description);
		vo.setProperty_reservation_default(reservation_default);
		HostModifyDAO dao = new HostModifyDAO();
		result1 = dao.hostPropertyname(vo);
		result2 = dao.deleteProAm(propertyId);
		result3 = dao.insertPropertyAmenities(propertyId,amenityIds);
		
		dao.closeCon();
		
		ResponseData data = null;

		if(result1 == 1 && result2 && result3) {
			data = new ResponseData();
		} else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;

	}
}
