<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSidebar</title>
<style>
/* 전체 바디 기본 설정 */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background-color: #f4f4f4;
}
/* 사이드바 스타일 */
.sidebar {
	width: 220px;
	height: 100vh;
	position: fixed;
	background-color: #2c3e50;
	color: white;
	padding: 20px;
}

/* 사이드바 제목 */
.sidebar h2 {
	font-size: 20px;
	margin-bottom: 1rem;
}

/* 사이드바 링크 스타일 */
.sidebar a {
	color: white;
	display: block;
	margin: 10px 0;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- 왼쪽 고정 사이드바 -->
	<div class="sidebar">
		<h2>관리자 모드</h2>
		<a href="#dashboard">📊 요약</a> <a href="#stats">👥 통계 분석</a> <a
			href="#users">👥 사용자 관리</a> <a href="#listings">🏠 숙소 관리</a> <a
			href="#bookings">📅 예약 관리</a> <a href="#admin">🔐 관리자 설정</a>
	</div>
</body>
</html>