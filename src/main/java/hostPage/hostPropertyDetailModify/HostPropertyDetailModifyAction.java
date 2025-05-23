package hostPage.hostPropertyDetailModify;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;

public class HostPropertyDetailModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String propertyId = request.getParameter("propertyId");
		String[] amenitiesArray = request.getParameterValues("amenitiesArray");// amenities 배열
		
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
		vo.setProperty_name(request.getParameter("listingTitle"));
		vo.setProperty_room(Integer.parseInt(request.getParameter("rooms")));
		vo.setProperty_bed(Integer.parseInt(request.getParameter("beds")));
		vo.setProperty_bathroom(Integer.parseInt(request.getParameter("bathrooms")));
		vo.setPrice_per_night(Integer.parseInt(request.getParameter("price")));
		vo.setProperty_photo_url(request.getParameter("photo"));
		vo.setProperty_description(request.getParameter("description"));
		vo.setProperty_reservation_default(request.getParameter("reservation_default"));
		HostModifyDAO dao = new HostModifyDAO();
		dao.hostPropertyname(vo);
		dao.deleteProAm(propertyId);
		dao.insertPropertyAmenities(propertyId,amenityIds);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("hostList.ho");
		return forward;
	}

}
