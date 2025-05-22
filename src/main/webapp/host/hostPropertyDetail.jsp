<%
// 더미 데이터 관련된 것들은 나중에 삭제 바랍니다.
// 더미 데이터 선언 (Controller 또는 Servlet에서 전달받을 수도 있음)
String listingTitle = "한옥 스테이 - 전주 한옥마을 중심";
int bedrooms = 2;
int beds = 2;
int bathrooms = 1;
int price = 100000;
String description = "전통 한옥에서의 특별한 하루를 보내보세요.";
String address = "전주시 완산구 풍남동3가";
String thumbnailUrl = "https://img.gqkorea.co.kr/gq/2020/07/style_5f02a9fd0f28d.jpg";

// 편의시설 더미 리스트
String[] amenities = { "Wi-Fi", "에어컨", "난방", "부엌", "샤워실", "헤어드라이기", "무료주차장", "수영장", "헬스장", "반려동물 가능"};
%>
	

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%
NumberFormat formatter = NumberFormat.getInstance();
String formattedPrice = formatter.format(price); // 100000 → "100,000"
%>


<!DOCTYPE html>
<html>
<head>
<title><%=listingTitle%> - 숙소 세부 정보</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
	color: #222;
	background-color: #fff;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 640px !important; margin : auto;
	padding: 20px;
	font-family: Arial;
	margin: auto;
	margin-bottom: 20px;
}

.title {
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 10px;
	color: #222;
}

.thumbnail {
	width: 100%;
	max-width: 100%;
	height: auto;
	border-radius: 12px;
	display: block;
	margin: 0 auto 24px auto;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.section-room {
	display: flex;
	gap: 60px;
	margin: 30px 0;
}

.countbox {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 18px;
	color: #333;
}

.countbox span {
	font-size: 14px;
	color: #777;
	margin-top: 4px;
}

.section-price,
.section-address,
.section-info,
.section-amenity,
.section-reserve {
	margin-top: 40px;
}

.section-price h2,
.section-address h2,
.section-info h2,
.section-amenity h2,
.section-reserve h2 {
	font-size: 22px;
	font-weight: 600;
	margin-bottom: 12px;
	color: #222;
}

.section-price span,
.section-address span,
.section-info span {
	font-size: 18px;
	color: #444;
	line-height: 1.6;
}

.amenities span {
	display: inline-block;
	margin: 5px 8px;
	background: #f7f7f7;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ddd;
}

.section-reserve button {
	font-size: 14px;
}

.top-box {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn-group {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
}

.btn-edit,
.btn-delete,
.btn-direct,
.btn-request {
  background-color: transparent;
  color: #222;
  padding: 12px 20px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  transition: background-color 0.2s ease, box-shadow 0.2s ease;
}

/* Hover 효과: 연한 회색 배경 + 그림자 */
.btn-edit:hover,
.btn-delete:hover,
.btn-direct:hover,
.btn-request:hover {
  background-color: #F3F4F6;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
}
</style>
</head>
<body>
	<div>
		<%@ include file="header_hostpage.jsp"%>
	</div>
	
	
	<div class="container">
	
		<div class="top-box">
			<!-- Title: Listing -->
			<h2 class="title">Listing</h2>
			<!-- 관리 버튼 -->
			<div class="btn-group">
				<button class="btn btn-edit">수정하기</button>
				<button class="btn btn-delete">삭제</button>
			</div>
		</div>

		<!-- 대표 이미지 -->
		<img src="<%=thumbnailUrl%>" alt="숙소 대표 이미지" class="thumbnail" />

		<!-- 상단 제목 -->
		<div class="header">
			<h2 class="title"><%=listingTitle%></h2>
		</div>

		<!-- 침실, 침대, 욕실 -->
		<div class="section-room">
			<p class="countbox">
				<%=bedrooms%>
				<span style="border-top: 1px solid black">rooms</span>

			</p>
			<p class="countbox">
				<%=beds%>
				<span style="border-top: 1px solid black">beds</span>
			</p>
			<p class="countbox">
				<%=bathrooms%>
				<span style="border-top: 1px solid black">bathrooms</span>
			</p>
		</div>

		<!-- 1박 당 가격 -->
		<div class="section-price">
	        <h2 style="font-size: 24px;">1박 가격</h2>
	        <span style="font-size: 20px;">₩ <%=formattedPrice%></span>
		</div>

		<!-- 숙소 위치 -->
		<div class="section-address">
	        <h2 style="font-size: 24px;">위치</h2>
	        <span style="font-size: 20px;"><%=address%></span>
		</div>
		
		<!-- 숙소 설명 -->
		<div class="section-info">
	        <h2 style="font-size: 24px;">숙소 설명</h2>
	        <span style="font-size: 20px;"><%=description%></span>
		</div>

		<!-- 승인 요청 설정 -->
		<div class="section-reserve">
     	    <h2 style="font-size: 24px;">승인 요청 설정</h2>
     	    <div>
	     	    <button class="btn-direct">즉시 예약</button>
				<button class="btn-request">예약 요청</button>
			</div>
		</div>

		<!-- 편의시설 -->
		<div class="section-amenity">
	        <h2 style="font-size: 24px;">편의시설</h2>
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

	</div>


	<div>
		<%@ include file="footer_hostpage.jsp"%>
	</div>
	



	<%-- 
			<!-- 위치(네이버 지도로 변경 예정) -->
		<div class="section">
			<h3>위치</h3>
			<p><%=address%></p>
			<iframe width="100%" height="300"
				style="border: 0; border-radius: 12px;" loading="lazy"
				allowfullscreen
				src="https://maps.google.com/maps?q=<%=java.net.URLEncoder.encode(address, "UTF-8")%>&output=embed">
			</iframe>
		</div>
		 --%>


</body>
</html>


