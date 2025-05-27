<%@page import="memberPage.memberLogIn.MemberLogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.time.*, java.time.format.*, java.time.temporal.ChronoUnit"%>
<%@ page import="mainPage.mainPropertyList.*, mainPage.mainPropertyList.MainPropertyListVO"%>
<%@ page import="memberPage.memberLogIn.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MemberLogInVO loginVO = (MemberLogInVO) session.getAttribute("userInfo");

	if (loginVO != null) {
		String loginuserId = loginVO.getUser_id();
		String loginuserName = loginVO.getUser_name();
	}

%>


<%
MainPropertyListDAO dao = new MainPropertyListDAO();
List<MainPropertyListVO> propertyList = dao.allgetProperty();
%>

<!-- ====== 공통 헤더 ====== -->
<jsp:include page="mainHeader.jsp" />

<!-- ====== 본문 영역 ====== -->
<div class="container">
	<div class="property-grid">

	<% for(int i = 0 ; i < propertyList.size(); i++) { 
	     String propertyId = propertyList.get(i).getProperty_id();
	     String propertyName = propertyList.get(i).getProperty_name();
	     String photoUrl = propertyList.get(i).getProperty_photo_url();
	%>
		<div class="property-card">
		
			<!-- ♥ 위시리스트 버튼 -->
			<button class="wishlist-button" onclick="toggleHeart(this)">
 				 <i class="fa-regular fa-heart"></i>
			</button>
			
			<!-- 이미지 및 정보 링크 -->
			<a href="main_detail.ma?property_id=<%=propertyId%>" class="property-card-link">
				<img src="/uploads/<%=photoUrl%>" alt="숙소 대표 이미지" />
				<div class="property-info">
					<div class="property-name">
						<%=propertyName%>
						<span style="float: right; font-weight: normal; color: #555;">⭐ 4.85</span>
					</div>
					<div class="property-location">대한민국 제주도</div>
					<div class="property-location">제주시 애월읍...</div>
					<div class="property-price">₩250,000 / 1박</div>
				</div>
			</a>
		</div>
	<% } %>

	</div>
</div>

<!-- ====== 공통 푸터 ====== -->
<jsp:include page="mainFooter.jsp" />

<!-- ====== 하트 토글 JS ====== -->
<script>
	function toggleHeart(button) {
		const icon = button.querySelector('i');
		icon.classList.toggle('fa-regular');
		icon.classList.toggle('fa-solid');
		button.classList.toggle('active');
	}
</script>

</body>
</html>
