package mainPage.mainPropertyList;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;

public class MainPropertySearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MainPropertySearchAction execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        
        // 대륙, 나라, 도시, 날짜, 가격, 침실/침대/욕실 수, 편의시설
        String continent = request.getParameter("location_continent");
        String country = request.getParameter("location_country");
        String city = request.getParameter("location_city");
        Date check_in = Date.valueOf(request.getParameter("reservation_check_in"));
        Date check_out = Date.valueOf(request.getParameter("reservation_check_out"));
        int min_price = Integer.parseInt(request.getParameter("min_price_per_night"));
        int max_price = Integer.parseInt(request.getParameter("max_price_per_night"));
        int room = Integer.parseInt(request.getParameter("property_room"));
        int bed = Integer.parseInt(request.getParameter("property_bed"));
        int bath = Integer.parseInt(request.getParameter("property_bath"));
        // 편의시설
        
        MainPropertyListSearchDAO dao = new MainPropertyListSearchDAO();
        
        // 필터로 한 번 걸러진 id와 새로운 필터에서 걸러진 내용을 비교, 새로운 filter_list에 id 담기
        // filter_list에 담으면 list 내용을 filter_list 내용으로 덮어쓰기
        // 반복
        
        List<String> property_id_list = null;
        List<String> property_id_filter_list = null;

        // 모든 id 다 가져오기
        property_id_list = dao.getAllPropertyId();
        property_id_filter_list = dao.getAllPropertyId();
        
        // 가격 필터
        	property_id_filter_list = dao.filterByPrice(min_price, max_price);
        	property_id_list.retainAll(property_id_filter_list);

        // 대륙 필터
        if ( continent != null ) {
        	property_id_filter_list = dao.filterByContinent(continent);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 나라 필터
        if ( country != null ) {
        	property_id_filter_list = dao.filterByCountry(country);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 도시 필터
        if ( city != null ) {
        	property_id_filter_list = dao.filterByCity(city);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 날짜 필터
        if ( check_in != null && check_out != null ) {
        	property_id_filter_list = dao.filterByDate(check_in, check_out);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 침실 수 필터
        if ( room != 0 ) {
        	property_id_filter_list = dao.filterByRoom(room);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 침대 수 필터
        if ( bed != 0 ) {
        	property_id_filter_list = dao.filterByBed(bed);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 욕실 수 필터
        if ( bath != 0 ) {
        	property_id_filter_list = dao.filterByBath(bath);
        	property_id_list.retainAll(property_id_filter_list);
        }
        // 편의시설 필터
        if ( continent != null ) {
        	
        }
        
        
    
        
        
        
        
        ActionForward forward = new ActionForward();
        // request.setAttribute(); 이용해서 property_id로 된 list 담기
        forward.setPath("/main_list.ma");
        forward.setRedirect(false);
        
        return forward;
	}

}
