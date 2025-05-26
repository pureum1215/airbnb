package hostPage.hostPropertyDetailModify;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import controller.Action;
import controller.ActionForward;

public class HostModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try {
            BufferedReader reader = request.getReader();
            StringBuilder jsonBuilder = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }

            Gson gson = new Gson();
            Map<String, Object> data = gson.fromJson(jsonBuilder.toString(), Map.class);

            String propertyId = (String) data.get("propertyId");
    		String reservation_default = (String) data.get("reservation_default");
    		String property_name = (String) data.get("listingTitle");
    		int rooms = Integer.parseInt(data.get("rooms").toString());
    		int beds = Integer.parseInt(data.get("beds").toString()) ;
    		int bathrooms = Integer.parseInt(data.get("bathrooms").toString()) ;
    		int price = Integer.parseInt(data.get("price").toString());
    		String photo = (String) data.get("photo");
    		String description = (String) data.get("description");
    		
    		String amenitiesJson = gson.toJson(data.get("amenitiesArray")); // Object → JSON String
    		List<String> haveAmenities = gson.fromJson(amenitiesJson, new TypeToken<List<String>>() {}.getType());
    		
    		String[] amenitiesArray = haveAmenities.toArray(new String[0]);
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
    		dao.hostPropertyname(vo);
    		dao.deleteProAm(propertyId);
    		dao.insertPropertyAmenities(propertyId,amenityIds);
    		
    		dao.closeCon();
            
            // 처리 로직 작성

            Map<String, Object> result = new HashMap<>();
            result.put("success", true);

            PrintWriter out = response.getWriter();
            out.print(gson.toJson(result));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
		//jsp 포워딩을 하지 말아야 함.
		//그렇다면, 어떻게 해야 하나.
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("hostList.ho");
		return forward;
	}
}
