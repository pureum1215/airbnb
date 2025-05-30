<%@page import="mainPage.mainPropertyDetail.MainPropertyDetailVO"%>
<%@ page
	import="java.time.*, java.time.format.*, java.time.temporal.ChronoUnit, java.util.List, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mainPage.mainPropertyDetail.*"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<head>
<meta charset="UTF-8">
<title>mainPropertyDetail</title>
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
	display: flex;
	margin-bottom: 24px;
	height: 500px;
}

.gallery img {
	width: 95%;
	height: 100%;
	object-fit: cover;
	border-radius: 8px;
}

.gallery img:first-child {
	grid-row: span 2;
}
	
.mapbox {
	width:370px;
	height:370px;
	object-fit: cover;
	border-radius: 8px;
	border: 1px solid gray;
}

.info-section {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	gap: 32px;
	flex-wrap: wrap; /* 화면이 좁을 때 줄바꿈 */
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
	position: sticky;
	top: 100px;
	width: 350px; /* 고정 크기 */
	min-width: 350px;
	max-width: 350px;
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 16px;
	background-color: white;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	flex-shrink: 0; /* 줄어들지 않게 설정 */
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

.review-box {
	margin-top: 32px;
	border-top: 1px solid #eee;
	padding-top: 24px;
}

.review-box h3 {
	font-size: 18px;
	margin-bottom: 16px;
}

.review-card {
	background-color: #f9f9f9;
	border-radius: 12px;
	padding: 16px;
	margin-bottom: 16px;
}

.review-content {
	font-style: italic;
	margin-bottom: 12px;
	color: #333;
}

.review-footer {
	display: flex;
	align-items: center;
	gap: 12px;
}

.review-avatar {
	width: 48px;
	height: 48px;
	border-radius: 50%;
	object-fit: cover;
}

.review-meta {
	font-size: 14px;
	color: #555;
}

.review-name {
	font-weight: bold;
}

.review-date {
	font-size: 13px;
	color: #888;
}

.hidden-review {
	display: none;
}

.show-more-btn {
	background-color: #ddd;
	border: none;
	padding: 8px 16px;
	border-radius: 8px;
	font-size: 14px;
	cursor: pointer;
}

  .amenities-container {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-wrap: wrap;
  }

  .amenity-item {
    width: 50%;
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    font-size: 17px;
  }

  .amenity-icon {
    font-size: 22px;
    margin-right: 8px;
  }
  
	.heart-icon {
	  font-size: 24px;
	  color: #bbb;
	  cursor: pointer;
	  margin-right: 8px;
	  transition: color 0.3s ease;
	}
	
	.heart-icon.active {
	  color: #ff385c;
	}

</style>
</head>
<body>
	<div>
		<%@ include file="mainHeader.jsp"%>
		<!-- 정적 포함 -->
	</div>
	<!-- header -->
	
<%
    String userId = (String) session.getAttribute("user_id");
%>	
	
	<!-- body -->
	<div class="container">
		<%
		String propertyId = request.getParameter("property_id");
		//String propertyId = "prop011"; //property_Id 로 검색
		PropertyDAO dao = new PropertyDAO(); // DAO 객체 생성
		MainPropertyDetailVO madVONPD = dao.propertyNPD(propertyId); //숙소 이름 가져오기, 사진 가져오기, 숙소설명 가져오기
		MainPropertyDetailVO madVOloc = dao.propertyLocation(propertyId);//VO객체 생성 숙소 나라 도시
		MainPropertyDetailVO madVObath = dao.propertyBath(propertyId); //숙소 방 화장실 침대
		MainPropertyDetailVO madVOAvgCount = dao.propertyAvgCount(propertyId);//후기 평균 개수
		MainPropertyDetailVO madVONameAt = dao.propertyHostName(propertyId);//호스트의 이름 생성한 날짜.
		List<MainPropertyDetailVO> madVOReviewList = dao.propertyReviewName(propertyId); //리뷰 내용, 리뷰 생성일자, 리뷰를 쓴 유저 이름 별점
		boolean checkcount = true;
		if (madVOReviewList.size() == 0) {
			checkcount = false;
		}

		List<Integer> listAmentie = dao.propertyAm(propertyId);
		String amenties = "";
		%>
		<%
		// 2. 포맷터 설정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		// 3. 문자열 → LocalDateTime
		LocalDateTime pastDateTime = LocalDateTime.parse(madVONameAt.getHost_created_at(), formatter);
		LocalDateTime now = LocalDateTime.now();
		%>

		<%
		// 4. 년, 월, 일 차이 계산
		long totalYears = pastDateTime.until(now, ChronoUnit.YEARS);
		long totalMonths = pastDateTime.until(now, ChronoUnit.MONTHS);
		long remainMonths = totalMonths - (totalYears * 12);
		%>

		<%
		// 지도 위도, 경도 가져오기
		    MainPropertyDetailVO mapInfo = dao.getPropertyLatLng(propertyId);
		    double locationX = mapInfo.getLocation_x();
		    double locationY = mapInfo.getLocation_y();
		%>
		
		<div class="title">
			<%=madVONPD.getProperty_name()%>
			<i id="wishlist-heart" class="fa-regular fa-heart heart-icon"></i>
		</div>
		<div class="gallery">
			<div>
				<img src="/uploads/<%=madVONPD.getProperty_photo_url()%>"
					alt="숙소 대표 이미지" />
			</div>
			<div id="map" class="mapbox"></div>
		</div>

		<div class="info-section">
			<div class="details">
				<h2><%=madVOloc.getLocation_city()%><br>
					<%=madVOloc.getLocation_country()%><br>
					<%=madVOloc.getLocation_continent()%>
				</h2>
				<ul>
					<li>침실 <%=madVObath.getProperty_room()%> 개, 침대 <%=madVObath.getProperty_bed()%>
						개, 욕실 <%=madVObath.getProperty_bathroom()%> 개
					</li>
					<li>⭐ <%=madVOAvgCount.getProperty_review_avg()%> · 후기 <%=madVOAvgCount.getProperty_review_count()%></li>
				</ul>
				<div class="host">
					<%=madVONPD.getProperty_description()%>
					<br /><br /><br />

	<%
		String hostName = madVONameAt.getUser_name();
		String hostId = madVONameAt.getHost_id();
	%>					
					
					<!-- 호스트 소개 -->
					<div style="display: flex; align-items: center; margin-bottom: 30px; 
					cursor: pointer; transition: 0.3s;" onclick= "gotohostProfile()">
						<div style="
							width: 60px;
							height: 60px;
							background-color: #d2b4f0;
							border-radius: 50%;
							display: flex;
							align-items: center;
							justify-content: center;
							font-weight: bold;
							color: white;
							font-size: 14px;
							margin-right: 16px;
						">
							<%=hostName%>
						</div>
						<p>
							<strong>호스트: <%=hostName%></strong><br />
							<strong>호스팅 경력: </strong>
							<%=totalYears%>년
							<%=remainMonths%>개월
						</p>
					</div>

				</div>

				<!-- 어메니티 박스 -->
				<div>
				  <h2 style="margin-top: 0; font-size: 22px;">어메니티 종류</h2>
				  <ul class="amenities-container">
				  <%
				//listAmentie 무엇이 있는지.
					for (Integer s : listAmentie) {
						switch (s) {
							case 1 :
								%>
						<li class="amenity-item"><span class="amenity-icon">📶</span> 와이파이</li>
						<%
						break;
							case 2 :
						%>
						<li class="amenity-item"><span class="amenity-icon">❄️</span> 에어컨</li>
						<% 
						break;
							case 3 :
						%>
						<li class="amenity-item"><span class="amenity-icon">🔥</span> 난방</li>
						<%
						break;
							case 4 :
						%>
						<li class="amenity-item"><span class="amenity-icon">👨‍🍳</span> 부엌</li>
						<% 
						break;
							case 5 :
						%>
						<li class="amenity-item"><span class="amenity-icon">🚿</span> 샤워실</li>
						<%
						break;
						case 6 :
						%>
						<li class="amenity-item"><span class="amenity-icon">💨</span> 헤어드라이기</li>
						<%
						break;
							case 7 :
						%>
						<li class="amenity-item"><span class="amenity-icon">️🅿️</span> 무료주차장</li>
						<% 
						break;
							case 8 :
						%>
						<li class="amenity-item"><span class="amenity-icon">🏊‍♂️</span> 수영장</li>
						<%
						break;
							case 9 :
						%>
						<li class="amenity-item"><span class="amenity-icon">🏋️‍♂️</span> 헬스장</li>
						<% 
						break;
							case 10 :
						%>
						<li class="amenity-item"><span class="amenity-icon">🐶</span> 애완동물 가능</li>
						<%
						break;
						}
					}
						%>

				    <!-- 계속 추가 가능 -->
				  </ul>
				</div>

				<!-- 리뷰 섹션 (임의 데이터) -->
				<div class="review-box">
					<h3><%=hostName%>
						님에 대한 호스트의 후기
					</h3>
					<%
					if (checkcount && madVOReviewList != null && madVOReviewList.size() > 0) {
						for (int i = 0; i < Math.min(2, madVOReviewList.size()); i++) {
							String reivew_content = madVOReviewList.get(i).getProperty_review_content();
							String user_name = madVOReviewList.get(i).getUser_name();
							String review_created_at = madVOReviewList.get(i).getProperty_review_created_at();
							int propertyReview = madVOReviewList.get(i).getProperty_review_rating();
					%>
					<!--  <c:forEach var="review" items="${madVOReview}">-->
					<div class="review-card">
					<div class="review-name"><%=user_name%></div>⭐<%=propertyReview %>
						<p class="review-content"><%=reivew_content%></p>
						<div class="review-date">
							<fmt:parseDate value="<%=review_created_at%>" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월" />
						</div>
						<div class="review-footer">
							<div class="review-meta">

							</div>
						</div>
					</div>
					<!--  </c:forEach>-->
					<%
					}
					%>
					<%
					for (int i = 2; i < madVOReviewList.size(); i++) {
						String reivew_content = madVOReviewList.get(i).getProperty_review_content();
						String user_name = madVOReviewList.get(i).getUser_name();
						String review_created_at = madVOReviewList.get(i).getProperty_review_created_at();
						int propertyReview = madVOReviewList.get(i).getProperty_review_rating();
					%>
					<div class="review-card hidden-review">
						<div class="review-name"><%=user_name%></div>⭐<%=propertyReview %>
						<p class="review-content"><%=reivew_content%></p>
						<div class="review-footer">
							<div class="review-meta">
								<div class="review-name"><%=user_name%></div>
								<div class="review-date"><%=review_created_at%></div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>

					<!-- 후기 더보기 / 접기 텍스트 링크 -->
					<div style="margin-top: 8px;">
						<span id="toggleReviewLink" class="show-more-btn"
							style="background: none; color: #222; text-decoration: underline; padding: 0; display: inline-block;">후기
							더보기</span>
					</div>
				</div>
			</div>



			<div class="reservation">
				<div class="price">₩20,280 / 1박</div>
				<label>체크인</label> <input type="date" value="2025-06-09" /> <label>체크아웃</label>
				<input type="date" value="2025-06-14" />

				<%-- 예약하기 버튼 --%>
				<form method="post" onsubmit="return reservation(this);">
					<input type="hidden" name="property_id" value="<%=propertyId%>">
					<button type="submit">예약하기</button>
				</form>

				<div class="summary">
					<p>총 숙박 요금: ₩100,000</p>
					<p>수수료(10%): ₩10,000</p>
					<strong>총액: ₩110,000</strong>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=991e8640696acefd76255f05e2328d69&autoload=false" ></script>
<script>

// 미 로그인시 예약하기 눌렀을 때
	function reservation(form) {
		var userId = "<%=userId %>";

		if ( !userId || userId === "null" ) {
			alert("로그인이 필요합니다.");
			window.location.href = "login.me";
			return false;
		}

		form.action = "<%=request.getContextPath() %>/reservation_default.re";
		return true;
	}

	
document.addEventListener("DOMContentLoaded", function () {
	  const heart = document.getElementById("wishlist-heart");

	  heart.addEventListener("click", function () {
	    heart.classList.toggle("active");
	    if (heart.classList.contains("active")) {
	      heart.classList.remove("fa-regular");
	      heart.classList.add("fa-solid");
	    } else {
	      heart.classList.remove("fa-solid");
	      heart.classList.add("fa-regular");
	    }
	  });
	  
    const toggleLink = document.getElementById("toggleReviewLink");
    const hiddenReviews = document.querySelectorAll(".hidden-review");
    let expanded = false;

    toggleLink.addEventListener("click", function () {
      expanded = !expanded;
      hiddenReviews.forEach((r) => r.style.display = expanded ? "block" : "none");
      toggleLink.textContent = expanded ? "접기" : "후기 더보기";
    });
  });
  
  
	// 지도 기능  
	kakao.maps.load(function () {
		// 지도 표시할 div와 옵션
	    var mapContainer = document.getElementById('map');
	    var mapOption = {
	      center: new kakao.maps.LatLng(<%=locationY%>, <%=locationX%>),
	      level: 3
	    };
	
	    // 지도 생성
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	
	    // 마커 위치
	    var markerPosition = new kakao.maps.LatLng(<%=locationY%>, <%=locationX%>);
	
	    // 마커 생성
	    var marker = new kakao.maps.Marker({
	      position: markerPosition
	    });
	
	    // 마커 지도에 표시
	    marker.setMap(map);
	});
	
	function gotohostProfile(){
		location.href = '/hostProfile.ho?host_id=<%=hostId %>';
	}
	
</script>


	<!-- footer -->
	<jsp:include page="mainFooter.jsp" />


</body>
</html>