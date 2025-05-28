package memberPage.memberIdCheck;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberPage.UserDAO;
import util.ResponseData;

public class MemberIdCheckAction {
    
    public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
        // "id check" 메시지를 콘솔에 출력하여 이 메서드가 호출되었음을 로그로 남김
        System.out.println("id check");

        // 응답 결과를 담기 위한 ResponseData 객체 생성
        ResponseData data = new ResponseData();
        // 초기 상태 코드를 500(서버 내부 오류)로 설정함 (기본값)
        data.setCode(500);

        // HTTP 요청에서 "member_email" 파라미터 값을 읽어옴
        String memberEmail = request.getParameter("member_email");
        // 만약 "member_email" 파라미터가 없으면, 기본 500 코드를 담은 응답 객체를 반환하며 종료
        if(memberEmail == null) {
            return data;
        }

        // 사용자 데이터베이스에 접근하기 위한 UserDAO 객체 생성
        UserDAO userDAO = new UserDAO();
        // userIDcheck 메서드를 호출하여 해당 이메일이 DB에 존재하는지 확인 (true/false)
        boolean idcheck = userDAO.userIDcheck(memberEmail);
        // 사용한 DB 연결을 닫아 자원 해제
        userDAO.closeCon();
        // 이메일이 존재한다면 상태 코드를 200(성공)으로 변경
        if (idcheck) {
            data.setCode(200);
        }

        // 상태 코드가 담긴 ResponseData 객체를 반환함
        return data;
    }
}
