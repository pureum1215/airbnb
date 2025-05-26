<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="hostPage.hostPropertyDetail.HostPropertyDetailVO"%>
<%@page import="hostPage.hostPropertyDetail.HostPropertyDetailDAO"%>
<%

//property_id 값 가져오기. Url 통해서

String propertyId = request.getParameter("property_id");

//propertyId를 통해서 



HostPropertyDetailDAO dao = new HostPropertyDetailDAO();

HostPropertyDetailVO hvo1 = dao.hostProperty(propertyId); 
//숙소 이름, 숙소 설명, 숙소 가격, 숙소 방 개수, 숙소 침대 수, 숙소 화장실 수, 숙소 승인 요청, 숙소 사진

List<Integer> listAmentie = dao.propertyAm(propertyId);
//숙소 편의시설 

String address = dao.propertyLocation(propertyId);
//숙소 주소

String listingTitle = hvo1.getProperty_name();
int rooms = hvo1.getProperty_room();
int beds = hvo1.getProperty_bed();
int bathrooms = hvo1.getProperty_bathroom();
int price = hvo1.getPrice_per_night();
String photo = hvo1.getProperty_photo_url();
String description = hvo1.getProperty_description();
//승인 요청 설정 ( true: 예약 요청, false: 즉시 예약)
boolean requestReservation = true;

if(hvo1.getProperty_reservation_default().equals("예약 요청")){
	requestReservation = true;
}else{
	requestReservation = false;
}
// 더미 데이터 관련된 것들은 나중에 삭제 바랍니다.
// 더미 데이터 선언 (Controller 또는 Servlet에서 전달받을 수도 있음)



// 편의시설 리스트
String[] amenities = { "Wi-Fi", "에어컨", "난방", "부엌", "샤워실", "헤어드라이기", "무료주차장", "수영장", "헬스장", "반려동물 가능"};

// 숙소가 소유한 편의시설
List<String> haveAmenities = new ArrayList<>();

for (Integer s : listAmentie) {
	switch (s) {
		case 1 :
			haveAmenities.add("WI-FI");
			break;
		case 2 :
			haveAmenities.add("에어컨");
			break;
		case 3 :
			haveAmenities.add("난방");
			break;
		case 4 :
			haveAmenities.add("부엌");
			break;
		case 5 :
			haveAmenities.add("샤워실");
			break;
		case 6 :
			haveAmenities.add("헤어드라이기");
			break;
		case 7 :
			haveAmenities.add("무료주차장");
			break;
		case 8 :
			haveAmenities.add("수영장");
			break;
		case 9 :
			haveAmenities.add("헬스장");
			break;
		case 10 :
			haveAmenities.add("반려동물 가능");
			break;
	}
}

String[] amenitiesArray = haveAmenities.toArray(new String[0]);








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
	margin-top: 80px;
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

/* 숙소가 소유하지 않은 편의시설 */
span.amenities {
	display: inline-block;
	margin: 5px 8px;
	background: #f7f7f7;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ddd;
}

/* 숙소가 소유한 편의시설 */
.property-amenities { 
	display: inline-block;
	margin: 5px 8px;
	background: #4DC6F4;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
	color: white; 
	border: 1px solid #4DC6F4; 
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
.btn-delete {
  background-color: transparent;
  color: #222;
  padding: 12px 20px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  transition: background-color 0.2s ease, box-shadow 0.2s ease;
}

/* 현재 선택O 항목 표시를 위한 버튼 style */
.btn-direct-ch,
.btn-request-ch {
  color: white;
  background-color: #4DC6F4;
  border: 1px solid #4DC6F4;
  padding: 12px 20px;
  border-radius: 20px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  transition: background-color 0.2s ease, box-shadow 0.2s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* 현재 선택X 항목 표시를 위한 버튼 style */
.btn-direct,
.btn-request {
  color: gray;
  border: 1px solid gray;
  padding: 12px 20px;
  border-radius: 20px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  transition: background-color 0.2s ease, box-shadow 0.2s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* Hover 효과: 연한 회색 배경 + 그림자 */
.btn-direct-ch:hover,
.btn-request-ch:hover {
  color: white;
  background-color: #4DC6F4;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
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
		<%@ include file="hostHeader.jsp"%>
	</div>
	
	
	<div class="container">
	
		<div class="top-box">
			<!-- Title: Listing -->
			<h2 class="title">Listing</h2>
			<!-- 관리 버튼 -->
			<div class="btn-group">
				<button class="btn-edit" onclick ="location.href='/hostDetailMo.ho?propId=<%=propertyId %>'">수정하기</button>
				<button class="btn-delete">삭제</button>
			</div>
		</div>

		<!-- 대표 이미지 -->
		<img src="/uploads/<%=photo%>" alt="숙소 대표 이미지" class="thumbnail" />

		<!-- 상단 제목 -->
		<div class="header">
			<h2 class="title"><%=listingTitle%></h2>
		</div>

		<!-- 침실, 침대, 욕실 -->
		<div class="section-room">
			<p class="countbox">
				<%=rooms%>
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
     	    <% 
     	    	/* 선택: 즉시 예약 */
     	    	if (requestReservation != true) { %>
     	    		<button class="btn-direct-ch">즉시 예약</button>
					<button class="btn-request">예약 요청</button>
     	    	<%}
     	   		/* 선택: 예약 요청 */
     	    	else { %>
     	    		<button class="btn-direct">즉시 예약</button>
					<button class="btn-request-ch">예약 요청</button>
     	    	<%}
     	    %>
			</div>
		</div>

		<!-- 편의시설 -->
		<div class="section-amenity">
	        <h2 style="font-size: 24px;">편의시설</h2>
			<div class="amenities">
				<%
				for (int i = 0; i < amenities.length; i++) {
					
					boolean haveAmenitiesCheck = false; // 편의 시설, 존재 여부 체크
					for(int j = 0; j < amenitiesArray.length; j++) {
						
						
						if(amenities[i].equals(amenitiesArray[j])) {

							haveAmenitiesCheck = true;
							break;
						
						}
				} // 체크 완료
					
				if(haveAmenitiesCheck) {%>
					<span class="property-amenities"><%=amenities[i] %></span>
				<%} else {%>
					<span class="amenities"><%=amenities[i] %></span>
				<%}
			}
			%>
			</div>
		</div>

	</div>


	<div>
		<%@ include file="hostFooter.jsp"%>
	</div>
	


</body>
</html>


