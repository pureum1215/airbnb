<%@page import="mainPage.mainPropertyDetail.MainPropertyDetailVO"%>
<%@ page import="java.time.*, java.time.format.*, java.time.temporal.ChronoUnit, java.util.List, java.util.ArrayList" %>
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
    String propertyId = "prop011"; //property_Id 로 검색
    PropertyDAO dao = new PropertyDAO(); // DAO 객체 생성
    MainPropertyDetailVO madVONPD = dao.propertyNPD(propertyId); //숙소 이름 가져오기, 사진 가져오기, 숙소설명 가져오기
    MainPropertyDetailVO madVOloc = dao.propertyLocation(propertyId);//VO객체 생성 숙소 나라 도시
    MainPropertyDetailVO madVObath= dao.propertyBath(propertyId); //숙소 방 화장실 침대
    MainPropertyDetailVO madVOAvgCount = dao.propertyAvgCount(propertyId);//후기 평균 개수
    MainPropertyDetailVO madVONameAt = dao.propertyHostName(propertyId);//호스트의 이름 생성한 날짜.
    List<Integer> listAmentie = dao.propertyAm(propertyId);
    String amenties= "";
	%>
	<% // 2. 포맷터 설정
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	// 3. 문자열 → LocalDateTime
	LocalDateTime pastDateTime = LocalDateTime.parse(madVONameAt.getHost_created_at(), formatter);
	LocalDateTime now = LocalDateTime.now();

	// 4. 년, 월, 일 차이 계산
	long totalYears = pastDateTime.until(now, ChronoUnit.YEARS);
	long totalMonths = pastDateTime.until(now, ChronoUnit.MONTHS);
	long remainMonths = totalMonths - (totalYears * 12);
	%>
	
	<%
	System.out.println(listAmentie.toString());
	//listAmentie 무엇이 있는지.
	for(Integer s : listAmentie){
		switch (s){
		case 1:
			amenties += "WI-FI ";
			break;
		case 2:
			amenties += "에어컨 ";
			break;
		case 3:
			amenties += "난방 ";
			break;
		case 4:
			amenties += "부엌 ";
			break;
		case 5:
			amenties += "샤워실 ";
			break;
		case 6:
			amenties += "헤어드라이기 ";
			break;
		case 7:
			amenties += "무료주차장 ";
			break;
		case 8:
			amenties += "수영장 ";
			break;
		case 9:
			amenties += "헬스장 ";
			break;
		case 10:
			amenties += "애완동물 가능 ";
			break;
		}
	}
	%>
		<div class="title"><%= madVONPD.getProperty_name() %></div>
		<div class="gallery">
			<img src="/uploads/<%= madVONPD.getProperty_photo_url() %>" alt="숙소 대표 이미지" />
		</div>

		<div class="info-section">
			<div class="details">
				<h2><%= madVOloc.getLocation_city() %><br>
					<%= madVOloc.getLocation_country() %><br>
					<%= madVOloc.getLocation_continent() %>
				</h2>
				<ul>
					<li>화장실 개수: <%=madVObath.getProperty_bathroom() %> 방 개수 <%=madVObath.getProperty_room() %>
					침대 개수:<%=madVObath.getProperty_bed() %>
					</li>
					<li>⭐ <%= madVOAvgCount.getProperty_review_avg()%>
					 · 후기 <%= madVOAvgCount.getProperty_review_count() %></li>
					<li><%=amenties %></li>
				</ul>
				<div class="host">
					<strong>호스트: <%= madVONameAt.getUser_name() %></strong><br /> 숙소 소개: <%=madVONPD.getProperty_description() %>
					숙소에서 휴식을 즐기세요.<br />
					 <p><strong>호스트 생성일자:</strong> <%= totalYears %>년 <%= remainMonths %>개월  </p>
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