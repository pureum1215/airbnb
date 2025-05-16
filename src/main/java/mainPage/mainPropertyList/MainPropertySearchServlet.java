package mainPage.mainPropertyList;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mainPropertySearchServlet
 */
@WebServlet("/search.api")
public class MainPropertySearchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
        request.setCharacterEncoding("UTF-8");

        // 1. 파라미터 받기
        String continent = request.getParameter("continent");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String checkInStr = request.getParameter("check_in");
        String checkOutStr = request.getParameter("check_out");
        String priceStr = request.getParameter("price_per_night");
        String amenityIdStr = request.getParameter("amenity_id");

        // 2. VO에 값 세팅
        MainPropertyListSearchVO criteria = new MainPropertyListSearchVO();
        criteria.setLocation_continent(continent);
        criteria.setLocation_country(country);
        criteria.setLocation_city(city);

        if (checkInStr != null && !checkInStr.isEmpty()) {
            criteria.setReservation_check_in(Date.valueOf(checkInStr)); // java.sql.Date
        }
        if (checkOutStr != null && !checkOutStr.isEmpty()) {
            criteria.setReservation_check_out(Date.valueOf(checkOutStr));
        }
        if (priceStr != null && !priceStr.isEmpty()) {
            criteria.setPrice_per_night(Integer.parseInt(priceStr));
        }
        if (amenityIdStr != null && !amenityIdStr.isEmpty()) {
            criteria.setAmenity_id(Integer.parseInt(amenityIdStr));
        }
        
        //침실, 침대, 욕실 수 vo에 세팅
        String roomCountStr = request.getParameter("room_count");
        String bedCountStr = request.getParameter("bed_count");
        String bathCountStr = request.getParameter("bathroom_count");

        if (roomCountStr != null && !roomCountStr.isEmpty()) {
            criteria.setProperty_room(Integer.parseInt(roomCountStr));
        }
        if (bedCountStr != null && !bedCountStr.isEmpty()) {
            criteria.setProperty_bed(Integer.parseInt(bedCountStr));
        }
        if (bathCountStr != null && !bathCountStr.isEmpty()) {
            criteria.setProperty_bathroom(Integer.parseInt(bathCountStr));
        }

        // 3. DAO 호출
        MainPropertyListDAO dao = new MainPropertyListDAO();
        List<MainPropertyListSearchVO> propertyList = dao.searchProperties(criteria);

        // 4. 결과를 request에 담아서 JSP로 forward
        request.setAttribute("propertyList", propertyList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/property/search_result.jsp");
        dispatcher.forward(request, response);
    }

}
