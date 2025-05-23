package hostPage.hostPropertyDetailModify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;

public class HostPropertyDetailModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		HostPropertyDetailModifyVO vo = new HostPropertyDetailModifyVO();
		
		//수정 한 것 저장
		
		
		forward.setRedirect(false);
		forward.setPath("hostList.ho");
		return forward;
	}

}
