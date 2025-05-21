<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate(); // 또는 session.removeAttribute("user_id");
	response.sendRedirect(request.getContextPath()+"/main_list.ma"); // 로그아웃 후 메인 페이지로 이동
%>
</body>
</html>