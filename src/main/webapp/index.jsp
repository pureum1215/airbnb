<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>response 연결 부분</h1>
<%

response.sendRedirect(request.getContextPath()+"/main_list.ma");

// 임시 코드
session.setAttribute("user_id", "user004");
session.setAttribute("host_id", "host004");



%>
</body>
</html>