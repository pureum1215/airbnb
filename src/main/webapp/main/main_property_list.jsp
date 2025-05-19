<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mainPage.mainPropertyList.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>main_body</title>
<style>
body {
	margin: 0;
	font-family: 'Arial', sans-serif;
	background-color: white;
}

/* 임포트: 상단 헤더 */
.section-Title {
	font-size: 22px;
	font-weight: bold;
	margin: 40px 80px 20px;
}

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 24px;
	padding: 0 80px 60px;
}

.card {
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
	background-color: white;
	cursor: pointer;
	transition: transform 0.2s ease;
}

.card:hover {
	transform: translateY(-4px);
}

.card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.card-content {
	padding: 14px;
}

.card-title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 6px;
}

.card-desc {
	font-size: 14px;
	color: #555;
}

.card-price {
	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
}

.card-rating {
	font-size: 14px;
	color: #888;
}
</style>
</head>
<body>
	<%
	MainPropertyListDAO dao = new MainPropertyListDAO();
	
     %>
	<div>
		<%@ include file="property_header.jsp"%>
		<!-- 정적 포함 -->
	</div>

	<!-- 숙소 섹션 -->
	<h2 class="section-Title">파리의 인기 숙소</h2>

	<div class="card-container">
		<!-- 숙소 카드 1개 -->
		<div class="card">
			<img src="/uploads/<%= madVONPD.getProperty_photo_url() %>" alt="숙소 대표 이미지" />
			<div class="card-content">
				<!-- 예시 숙소 card -->
				<div class="card-title">Les Halles의 다인실</div>
				<div class="card-desc">8월 15일~17일 · 게스트 선호</div>
				<div class="card-price">₩554,430 · 2박</div>
				<div class="card-rating">★ 4.88</div>
			</div>
		</div>
	</div>

	<div>
		<%@ include file="property_footer.jsp"%>
		<!-- 정적 포함 -->
	</div>

</body>
</html>