<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PropertyDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background: #fff;
	color: #222;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 24px;
}

.title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 16px;
}

.gallery {
	display: grid;
	grid-template-columns: 2fr 1fr;
	grid-template-rows: repeat(2, 180px);
	gap: 8px;
	margin-bottom: 24px;
}

.gallery img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 8px;
}

.gallery img:first-child {
	grid-row: span 2;
}

.info-section {
	display: flex;
	justify-content: space-between;
	gap: 32px;
}

.details {
	flex: 2;
}

.details h2 {
	font-size: 18px;
	margin-bottom: 12px;
}

.details ul {
	list-style: none;
	font-size: 14px;
	line-height: 1.6;
	margin-bottom: 20px;
}

.host {
	font-size: 14px;
	margin-top: 12px;
	line-height: 1.6;
}

.reservation {
	flex: 1;
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 16px;
	position: sticky;
	top: 100px;
}

.reservation .price {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
}

.reservation input, .reservation select {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	font-size: 14px;
}

.reservation button {
	width: 100%;
	background-color: #ff385c;
	color: white;
	padding: 12px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
}

.reservation .summary {
	font-size: 14px;
	margin-top: 16px;
	border-top: 1px solid #eee;
	padding-top: 16px;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="property_header.jsp" />
	
	<!-- body -->
	<div class="container">
	<%
    String propertyId = "prop001"; //property_Id 로 검색
    PropertyDAO dao = new PropertyDAO(); // DAO 객체 생성
    String propertyName = dao.propertyName(propertyId); // DB에서 값 조회
	%>
		<div class="title"><%= propertyName %></div>

		<div class="gallery">
			<img src="https://via.placeholder.com/600x400" alt="숙소 대표 이미지" /> <img
				src="https://via.placeholder.com/300x200" /> <img
				src="https://via.placeholder.com/300x200" /> <img
				src="https://via.placeholder.com/300x200" /> <img
				src="https://via.placeholder.com/300x200" />
		</div>

		<div class="info-section">
			<div class="details">
				<h2>Yesan-gun, 한국의 집 전체</h2>
				<ul>
					<li>최대 인원 3명 · 침실 1개 · 침대 1개 · 욕실 1개</li>
					<li>⭐ 4.93 · 후기 110개</li>
					<li>무선 인터넷, 세탁기, 주방</li>
				</ul>
				<div class="host">
					<strong>호스트: Sylvia 님</strong><br /> 숙소 소개: 예산시장과 도고온천 인근. 감성적인 한옥
					숙소에서 휴식을 즐기세요.<br />
				</div>
			</div>

			<div class="reservation">
				<div class="price">₩20,280 /박</div>
				<label>체크인</label> <input type="date" value="2025-06-09" /> <label>체크아웃</label>
				<input type="date" value="2025-06-14" /> <label>게스트</label> <select>
					<option>1명</option>
					<option>2명</option>
					<option>3명</option>
				</select>
				<button>예약하기</button>
				<div class="summary">
					<p>총 숙박 요금: ₩106,733</p>
					<p>청소비: ₩5,335</p>
					<p>서비스 수수료: ₩6,349</p>
					<strong>총액: ₩118,417</strong>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="property_footer.jsp" />
</body>
</html>