package mainPage.mainPropertyList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;

public class MainPropertyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MainPropertyListAction execute 호출됨");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		// 세션에서 user_id 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        System.out.println("userId: " + userId);
		
		// property_id 받아서 출력
		List<String> property_id_list = (List<String>) request.getAttribute("property_id_list");
		
		MainPropertyListDAO dao = new MainPropertyListDAO();
		List<MainPropertyListVO> list = null;
		
		// property_id 를 얻는 과정이 없었다면 ( search action 거치지 않았을 때 )
		// 모든 property id 가져오기
		if ( property_id_list == null ) {
			property_id_list = dao.getAllPropertyId();
			list = dao.getPropertyList(property_id_list, userId);

		}
		else if ( property_id_list.isEmpty() ) {
			request.setAttribute("search_result", "empty");
		}
		else {
			list = dao.getPropertyList(property_id_list, userId);
		}
				
		
        ActionForward forward = new ActionForward();
        request.setAttribute("property_id_load_list", list);
        forward.setPath("/main_list.ma");
        forward.setRedirect(false);
        
        return forward;
	}

}
