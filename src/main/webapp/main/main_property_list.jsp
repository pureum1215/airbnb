<%@page import="mainPage.mainPropertyList.MainPropertyListVO"%>
<%@page import="memberPage.memberLogIn.MemberLogInVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.time.*, java.time.format.*, java.time.temporal.ChronoUnit"%>
<%@ page import="memberPage.memberLogIn.*" %>

<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome 아이콘 CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<meta charset="UTF-8">
<title>숙소 리스트</title>

<!-- ====== 스타일 영역 ====== -->
<style>
/* 기본 레이아웃 */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #fff;
}

.container {
	max-width: 1400px;
	margin: 0 auto;
	padding: 24px 0px;
}

.property-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 24px;
	justify-content: flex-start;
}

/* 숙소 카드 */
.property-card {
	position: relative;
	width: 250px;
	flex: 0 0 auto;
	border: 1px solid #e0e0e0;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
	transition: transform 0.2s ease;
	background: white;
	cursor: pointer;
}

.property-card:hover {
	transform: scale(1.02);
}

.property-card img {
	width: 100%;
	height: 150px;
	object-fit: cover;
}

/* 카드 내부 정보 */
.property-info {
	padding: 10px 12px;
}

.property-location {
	font-size: 13px;
	color: #666;
}

.property-name {
	font-size: 14px;
	font-weight: bold;
	margin: 4px 0;
	color: #222;
}

.property-rating {
	font-size: 13px;
	color: #777;
}

.property-price {
	font-size: 14px;
	margin-top: 6px;
	color: #000;
}

/* 하트 버튼 */
.wishlist-button {
	position: absolute;
	top: 8px;
	right: 8px;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 28px;
	color: rgba(0, 0, 0, 0.5);
	transition: color 0.2s;
	line-height: 1;
}

.wishlist-button.active {
	color: red;
}

/* 게스트 선호 뱃지 */
.badge {
	position: absolute;
	top: 8px;
	left: 8px;
	background-color: #fff;
	padding: 4px 8px;
	border-radius: 8px;
	font-size: 12px;
	font-weight: bold;
	color: #222;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
}

/* 반응형 */
@media (max-width: 1200px) {
	.property-card {
		width: calc(20% - 12px);
	}
}
@media (max-width: 992px) {
	.property-card {
		width: calc(25% - 12px);
	}
}
@media (max-width: 768px) {
	.property-card {
		width: calc(33.33% - 12px);
	}
}
@media (max-width: 576px) {
	.property-card {
		width: calc(50% - 12px);
	}
}
@media (max-width: 400px) {
	.property-card {
		width: 100%;
	}
}
</style>
</head>
<body>



<%
	MemberLogInVO loginVO = (MemberLogInVO) session.getAttribute("userInfo");

	if (loginVO != null) {
		String loginuserId = loginVO.getUser_id();
		String loginuserName = loginVO.getUser_name();
	}

%>


<!-- ====== 공통 헤더 ====== -->
<jsp:include page="mainHeader.jsp" />

<!-- ====== 본문 영역 ====== -->
<%
	List<MainPropertyListVO> propertyList = (List<MainPropertyListVO>) request.getAttribute("property_id_load_list");
	String searchResult = (String) request.getAttribute("search_result");
	
	if ("empty".equals(searchResult)) {
%>
    <p>검색 결과가 없습니다.</p>
<%
    } 
	else if (propertyList != null && !propertyList.isEmpty()) {
%>


<div class="container">
	<div class="property-grid">

	<%
        for (int i = 0; i < propertyList.size(); i++) {
            MainPropertyListVO vo = propertyList.get(i);

            String propertyId = vo.getProperty_id();
            String photoUrl = vo.getProperty_photo_url();
            String propertyName = vo.getProperty_name();
            String country = vo.getLocation_country();
            String city = vo.getLocation_city();
            String description = vo.getProperty_description();
            int price = vo.getPrice_per_night();
            Double rating = vo.getProperty_review_rating();
            String wishList = vo.getWish_list();
	%>
		<div class="property-card">
		
            <!-- ♥ 위시리스트 버튼 -->
            <button class="wishlist-button" onclick="toggleHeart(this)" data-property-id="<%=propertyId%>">
			<%
                if ("Y".equals(wishList)) {
			%>
                <i class="fa-solid fa-heart"></i>
			<%
                } 
                else {
			%>
                <i class="fa-regular fa-heart"></i>
			<%
                }
			%>
            </button>
			
			<!-- 이미지 및 정보 링크 -->
			<a href="main_detail.ma?property_id=<%=propertyId%>" class="property-card-link">
				<img src="/uploads/<%=photoUrl%>" alt="숙소 대표 이미지" />
				<div class="property-info">
					<div class="property-name">
						<%=propertyName%>
						<span style="float: right; font-weight: normal; color: #555;">
							⭐ <%= rating != null ? String.format("%.1f", rating) : "-" %>
						</span>
					</div>
					<div class="property-location"><%=country%> <%=city%></div>
					<div class="property-location"><%=description%></div>
					<div class="property-price">₩<%=price%> / 1박</div>
				</div>
			</a>
		</div>
	<% } %>

	</div>
</div>
<%
    }
    else {
%>
    <p>숙소 정보가 없습니다.</p>
<%
    }
%>

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
