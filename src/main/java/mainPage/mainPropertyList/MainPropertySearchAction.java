package mainPage.mainPropertyList;

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
		
        
        
        
        
        
        
        
        ActionForward forward = new ActionForward();
        // request.setAttribute(); 이용해서 property_id로 된 list 담기
        forward.setPath("/main_list.ma");
        forward.setRedirect(false);
        
        return forward;
	}

}
