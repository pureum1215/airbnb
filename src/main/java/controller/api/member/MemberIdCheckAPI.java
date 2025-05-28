package controller.api.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hostPage.hostReservationList.HostReservationConfirmAction;
import hostPage.hostReservationList.HostReservationDeclineAction;
import hostPage.hostReservationList.HostReservationHistoryAction;
import hostPage.hostReservationList.HostReservationUpcomingAction;
import memberPage.memberIdCheck.MemberIdCheckAction;
import util.ResponseData;

public class MemberIdCheckAPI extends HttpServlet {
    
    // GET 방식 요청 처리 메서드, doProcess 메서드로 위임
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    // POST 방식 요청 처리 메서드, doProcess 메서드로 위임
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    
    // GET/POST 공통 처리 메서드
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 URI 전체를 가져옴
        String url = request.getRequestURI();
        // 컨텍스트 경로를 가져옴 (예: /myapp)
        String path = request.getContextPath();
        // 실제 요청 명령어 부분만 추출 (예: /member_idcheck.mia)
        String command = url.substring(path.length());
        // 콘솔에 호출된 API 명령어 로그 출력
        System.out.println("member api호출: " + command);
        
        // JSON 변환을 위한 Gson 객체 생성
        Gson gson = new Gson();
        // API 처리 결과를 담을 ResponseData 변수 선언
        ResponseData responseData = null;
        
        // 요청 명령어가 "/member_idcheck.mia"이면 MemberIdCheckAction 실행
        if (command.equals("/member_idcheck.mia")) {
            MemberIdCheckAction action = new MemberIdCheckAction();
            // action의 execute 메서드를 호출해 처리 결과를 받음
            responseData = action.execute(request, response);
        }
    
        // 응답 인코딩을 UTF-8로 설정
        response.setCharacterEncoding("UTF-8");
        // 응답 콘텐츠 타입을 JSON으로 설정, 한글 처리 위해 charset도 UTF-8 지정
        response.setContentType("application/json; charset=UTF-8");

        // 응답 출력용 PrintWriter 객체 획득
        PrintWriter out = response.getWriter();
        // ResponseData 객체를 JSON 문자열로 변환하여 응답 본문에 출력
        out.print(gson.toJson(responseData));
        // 출력 버퍼를 비워 응답이 클라이언트로 전달되도록 함
        out.flush();
    }

}
