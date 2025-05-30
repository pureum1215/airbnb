<%@page import="hostPage.hostProfile.HostProfileVO"%>
<%@page import="hostPage.hostProfile.HostProfileDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>호스트 프로필 | Airbnb</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Inter', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fafafa;
	color: #222;
}

.container {
	display: flex;
	gap: 40px;
	max-width: 1200px;
	margin: 40px auto;
	padding: 0 20px;
}

.left-panel {
	width: 320px;
	display: flex;
	flex-direction: column;
	gap: 24px;
	position: sticky;
	top: 100px;
	align-self: flex-start;
}

.profile-box, .verify-box {
	background: #fff;
	border-radius: 16px;
	padding: 24px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
}

.host-img {
	width: 96px;
	height: 96px;
	border: 1px solid black;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 16px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: black;
	color: #FAFAFA;
	font-size: 53px;
    font-weight: bold;
	
}

.profile-box h2 {
	font-size: 20px;
	font-weight: 600;
	margin: 10px 0 4px;
}

.profile-box .rating {
	font-size: 15px;
	color: #555;
	margin-bottom: 8px;
}

.profile-box .badge {
	display: inline-block;
	background-color: #FF385C;
	color: white;
	font-size: 12px;
	padding: 4px 10px;
	border-radius: 999px;
	margin-top: 6px;
	font-weight: 500;
}

.verify-box {
	font-size: 14px;
	line-height: 1.8;
	color: #555;
}

.right-panel {
	flex: 1;
	background: #fff;
	border-radius: 16px;
	padding: 32px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
	width: 850px;
    margin-bottom: 20px;
}

.section-title {
	font-size: 22px;
	font-weight: 700;
	margin-bottom: 24px;
}

.info-list {
	font-size: 15px;
	color: #333;
	line-height: 2;
	margin-bottom: 24px;
}

.introduction {
	font-size: 15px;
	line-height: 1.8;
	color: #444;
}

.review-box {
	margin-top: 48px;
	border-top: 1px solid #e4e4e4;
	padding-top: 32px;
}

.review {
	background: #f7f7f7;
	padding: 20px;
	border-radius: 12px;
	margin-top: 12px;
}

.review .reviewer {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.review .reviewer img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 12px;
}

.review .reviewer-info {
	font-size: 14px;
	color: #555;
}

.review .content {
	font-size: 14px;
	color: #333;
	line-height: 1.6;
}

#toggleReviewsBtn {
	margin-top: 20px;
	background-color: transparent;
	border: none;
	color: #FF385C;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
}

.listing-carousel {
	display: flex;
	gap: 20px;
	overflow-x: auto;
	padding-bottom: 10px;
}

.listing-card {
	min-width: 240px;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	flex-shrink: 0;
}

.listing-card img {
	width: 100%;
	height: 160px;
	object-fit: cover;
}

.listing-info {
	padding: 12px;
	font-size: 14px;
}

.listing-type {
	color: #555;
	margin-bottom: 4px;
}

.listing-name {
	font-weight: 600;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-bottom: 4px;
}

.listing-rating {
	color: #222;
}
</style>
</head>
<body>

<%
	String hostIdProfile = request.getParameter("host_id");
	String sessionHostId = (String) session.getAttribute("host_id");
    if (hostIdProfile != null && hostIdProfile.equals(sessionHostId)) {
%>
    <%@ include file="hostHeader.jsp" %>
<%
    } else {
%>
    <%@ include file="/user/userHeader.jsp"%>
<%
    }
%>

<% 

/* 	String hostIdProfile = request.getParameter("host_id"); */

	//String hostId = (String)session.getAttribute("host_id");
	//필요한 것 호스트가 가진 숙소에 대한 별점, 후기 개수, 후기내용, 호스트 이름 

	HostProfileDAO dao = new HostProfileDAO();
	HostProfileVO hvo1 = dao.hostProfile1(hostIdProfile);
	HostProfileVO hvo2 = dao.hostProfile2(hostIdProfile);
	List<HostProfileVO> hvoList3 = dao.hostProfile3(hostIdProfile);
	List<HostProfileVO> hvolist5 = dao.hostProfile5(hostIdProfile);

	String hostName = hvo1.getUser_name();
	String hostEmail = hvo1.getUser_email();
	String hostPhoneNumber = hvo1.getUser_phone_number();
	String hostBio = hvo1.getHost_bio();
	double hostAvg = hvo2.getAvg();
	int hostCount = hvo2.getCount();
	
	
	%>
	<div class="container">
		<!-- 왼쪽 패널 -->
		<div class="left-panel">
			<div class="profile-box">
				<div class="host-img">H</div>
				<h2><%=hostName%></h2>
				<div class="rating">
					⭐
					<%=hostAvg%>
					・ 후기
					<%=hostCount%>개
				</div>
			</div>

			<div class="verify-box">
				<p>✔ 신원 인증</p>
				<p>✔ 이메일 주소</p>
				<p>✔ 전화번호</p>
			</div>
		</div>

		<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★삭제할 부분은 나중에 삭제 바랍니다.★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		<!-- 임시로 넣어놓음 -->
		<!-- 오른쪽 패널 -->
		<div style="gap: 10px;">
		<%
		if (hostIdProfile != null && hostIdProfile.equals(sessionHostId)){
		%>
			<div class="right-panel">
				<!-- 사용자 소개 섹션(개인정보) -->
				<div class="user-session">
					<h1 class="text-2xl font-bold"><%=hostName %>님 정보</h1><br>
					<h2>이메일: <%=hostEmail %></h2>
					<h2>전화번호: <%=hostPhoneNumber %></h2>
					<button class="mt-2 text-sm font-medium border px-4 py-2 rounded-md hover:bg-gray-50">프로필 수정하기</button>
				</div>
			</div>
		<%} %>

			<div class="right-panel">

				<div class="section-title"><%=hostName%>
					님 숙소 소개
				</div>

				<div class="info-list">
					<br> <br>
					<%=hostBio%>
				</div>

				<div class="introduction">

				</div>

				<div class="review-box" style="border-bottom: 1px solid #e4e4e4;">
					<div class="section-title"><%=hostName %> 님의 후기</div>

					<!-- 후기 리스트 -->
					<%
					for (int i = 0; i < Math.min(hvoList3.size(), 2); i++) {
						String review_content = hvoList3.get(i).getProperty_review_content();
						int review_rating = hvoList3.get(i).getProperty_review_rating();
						String review_id = hvoList3.get(i).getProperty_review_id();
						HostProfileVO hvo4 = dao.hostProfile4(review_id);
						String user = hvo4.getUser_name();
						String created_at = hvo4.getProperty_review_created_at();
					%>
					<div class="review-list">
						<div class="review">
							<div class="reviewer">
								<div class="reviewer-info">
									<%=user%><br>날짜<%=created_at%>
								</div>
							</div>
							<div class="content">
								⭐<%=review_rating%>, 후기:
								<%=review_content%></div>
						</div>
						<%
						}
						%>
						<!-- 두 번째 후기 (예시) -->
						<%
						for (int i = 2; i < hvoList3.size(); i++) {
							String review_content = hvoList3.get(i).getProperty_review_content();
							int review_rating = hvoList3.get(i).getProperty_review_rating();
							String review_id = hvoList3.get(i).getProperty_review_id();
							HostProfileVO hvo4 = dao.hostProfile4(review_id);
							String user = hvo4.getUser_name();
							String created_at = hvo4.getProperty_review_created_at();
						%>
						<div class="review" style="display: none;">
							<div class="reviewer">
								<div class="reviewer-info">
									<%=user%><br>날짜<%=created_at%>
								</div>
							</div>
							<div class="content">
								⭐<%=review_rating%>, 후기:
								<%=review_content%></div>
						</div>
						<%
						}
						%>
					</div>

					<!-- 토글 버튼 -->
					<button id="toggleReviewsBtn">후기 더 보기</button>
				</div>

				<!-- Toshiko 님의 숙소 -->
				<div style="margin-top: 64px;">
					<div class="section-title"><%=hostName%>
						님의 숙소
					</div>
					<div class="listing-carousel">
						<!-- 숙소 카드 1 -->
						<%
						for (int i = 0; i < hvolist5.size(); i++) {
							String proname = hvolist5.get(i).getProperty_name();
							String prophoto = hvolist5.get(i).getProperty_photo_url();
							String propertyId = hvolist5.get(i).getProperty_id();
							if (hostIdProfile != null && hostIdProfile.equals(sessionHostId)) {
								
							%>
						<div
							class="listing-card hover:shadow-md transition border cursor-pointer"
							onclick="location.href='/hostprdetail.ho?property_id=<%=propertyId%>'">
							<img src="/uploads/<%=prophoto%>" alt="오두막">
							<div class="listing-info">
								<div class="listing-name"><%=proname%></div>
							</div>
						</div>
							<% 	
								
							}
							else{
						%>
						<div
							class="listing-card hover:shadow-md transition border cursor-pointer"
							onclick="location.href='/main_detail.ma?property_id=<%=propertyId%>'">
							<img src="/uploads/<%=prophoto%>" alt="오두막">
							<div class="listing-info">
								<div class="listing-name"><%=proname%></div>
							</div>
						</div>
						<%
						}
						%>
						<%
						}
						%>
					</div>
				</div>



			</div>

		</div>
	</div>

	<script>
		const toggleBtn = document.getElementById('toggleReviewsBtn');
		const reviews = document.querySelectorAll('.review-list .review');

		toggleBtn.addEventListener('click', () => {
   			const isExpanded = toggleBtn.textContent === '접기';
  			reviews.forEach((review, index) => {
       		if (index > 0) {
       			review.style.display = isExpanded ? 'none' : 'block';
    			}
   		 	});
   			toggleBtn.textContent = isExpanded ? '후기 더 보기' : '접기';
		});
		
		function gotouserPageProperty(propertyId){
			location.href=contextPath + '/main_detail.ma?property_id=' + propertyId;
		}
		
	</script>

	<%@ include file="hostFooter.jsp"%>
</body>
</html>
