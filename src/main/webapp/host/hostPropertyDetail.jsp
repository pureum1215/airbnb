<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 더미 데이터 선언 (Controller 또는 Servlet에서 전달받을 수도 있음)
String listingTitle = "한옥 스테이 - 전주 한옥마을 중심";
String status = "게시 중";
String listingType = "전통 한옥";
int guestCapacity = 4;
int bedrooms = 2;
int beds = 2;
int bathrooms = 1;
String description = "전통 한옥에서의 특별한 하루를 보내보세요.";
String address = "전주시 완산구 풍남동3가";
String thumbnailUrl = "https://img.gqkorea.co.kr/gq/2020/07/style_5f02a9fd0f28d.jpg";

// 편의시설 더미 리스트
String[] amenities = { "Wi-Fi", "에어컨", "주방", "TV", "난방" };
%>

<!DOCTYPE html>
<html>
<head>
<title><%=listingTitle%> - 숙소 세부 정보</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
.container {
	max-width: 900px;
	margin: auto;
	padding: 20px;
	font-family: Arial;
}

.thumbnail {
	width: 100%;
	border-radius: 12px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.status {
	color: green;
	font-weight: bold;
}

.tabs {
	display: flex;
	gap: 20px;
	border-bottom: 1px solid #ddd;
	margin-top: 30px;
	padding-bottom: 10px;
}

.tabs a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

.section {
	margin-top: 30px;
}

.btn-group {
	margin-top: 40px;
	display: flex;
	gap: 10px;
}

.btn {
	padding: 10px 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
}

.btn-edit {
	background: #ff385c;
	color: white;
}

.btn-disable {
	background: #e0e0e0;
}

.btn-delete {
	background: #ff4d4f;
	color: white;
}

.amenities span {
	display: inline-block;
	margin: 5px 10px;
	background: #f0f0f0;
	padding: 5px 10px;
	border-radius: 20px;
}

.thumbnail {
	width: 100%;
	max-width: 600px; /* 이미지 최대 폭 제한 */
	height: auto;
	border-radius: 12px;
	display: block;
	margin: 0 auto;
}

.title {
	font-size: 28px;
	font-weight: 700;
	color: #222;
	margin: 0;
}
</style>
</head>
<body>
	<div>
		<%@ include file="../html/header_hostpage.jsp"%>
		<!-- 정적 포함 -->
	</div>
	<div class="container">

		<!-- 대표 이미지 -->
		<img src="<%=thumbnailUrl%>" alt="숙소 대표 이미지" class="thumbnail" />

		<!-- 상단 제목 및 상태 -->
		<div class="header">
			<h2 class="title"><%=listingTitle%></h2>
			<span class="status"><%=status%></span>
		</div>
		<!-- 탭 네비게이션 -->
		<div class="tabs">
			<a href="#">세부정보</a> <a href="#">가격</a> <a href="#">예약 설정</a> <a
				href="#">캘린더</a> <a href="#">사진</a> <a href="#">위치</a>
		</div>

		<!-- 숙소 세부 정보 -->
		<div class="section">
			<h3>숙소 정보</h3>
			<p>
				<strong>숙소 유형:</strong>
				<%=listingType%></p>
			<p>
				<strong>수용 인원:</strong> 최대
				<%=guestCapacity%>명
			</p>
			<p>
				<strong>침실:</strong>
				<%=bedrooms%>개
			</p>
			<p>
				<strong>침대:</strong>
				<%=beds%>개
			</p>
			<p>
				<strong>욕실:</strong>
				<%=bathrooms%>개
			</p>
			<p>
				<strong>설명:</strong>
				<%=description%></p>
		</div>

		<!-- 편의시설 -->
		<div class="section">
			<h3>편의시설</h3>
			<div class="amenities">
				<%
				for (int i = 0; i < amenities.length; i++) {
				%>
				<span><%=amenities[i]%></span>
				<%
				}
				%>
			</div>
		</div>

		<!-- 위치 -->
		<div class="section">
			<h3>위치</h3>
			<p><%=address%></p>
			<iframe width="100%" height="300"
				style="border: 0; border-radius: 12px;" loading="lazy"
				allowfullscreen
				src="https://maps.google.com/maps?q=<%=java.net.URLEncoder.encode(address, "UTF-8")%>&output=embed">
			</iframe>
		</div>

		<!-- 관리 버튼 -->
		<div class="btn-group">
			<button class="btn btn-edit">수정하기</button>
			<button class="btn btn-disable">비활성화</button>
			<button class="btn btn-delete">삭제</button>
		</div>

	</div>
</body>
</html>
