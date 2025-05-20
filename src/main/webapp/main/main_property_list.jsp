<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ====== Java import ====== -->
<%@ page
	import="java.util.*, java.time.*, java.time.format.*, java.time.temporal.ChronoUnit"%>
<%@ page
	import="mainPage.mainPropertyList.*, mainPage.mainPropertyList.MainPropertyListVO"%>
<!DOCTYPE html>
<html>
<head>
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
	font-size: 28px; /* 기존 20px → 28px로 확대 */
	color: rgba(0, 0, 0, 0.5);
	transition: color 0.2s;
	line-height: 1; /* ♥, ♡ 아이콘 정렬 안정화 */
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

/* 반응형 레이아웃 */
@media ( max-width : 1200px) {
	.property-card {
		width: calc(20% - 12px);
	}
}

@media ( max-width : 992px) {
	.property-card {
		width: calc(25% - 12px);
	}
}

@media ( max-width : 768px) {
	.property-card {
		width: calc(33.33% - 12px);
	}
}

@media ( max-width : 576px) {
	.property-card {
		width: calc(50% - 12px);
	}
}

@media ( max-width : 400px) {
	.property-card {
		width: 100%;
	}
}
</style>
</head>
<body>
<%
MainPropertyListDAO dao = new MainPropertyListDAO();
List<MainPropertyListVO> propertyList = dao.allgetProperty();
System.out.println("jsp: "+propertyList.get(1).getProperty_id());
%>
	<!-- ====== 공통 헤더 ====== -->
	<jsp:include page="property_header.jsp" />
	

	<!-- ====== 본문 영역 (숙소 카드 목록) ====== -->
	<div class="container">
		<div class="property-grid">

			<!-- 카드 1: 일반 숙소 -->
	<% for(int i = 0 ; i < propertyList.size(); i++) { 
     String propertyId = propertyList.get(i).getProperty_id();
     String propertyName = propertyList.get(i).getProperty_name();
     String photoUrl = propertyList.get(i).getProperty_photo_url();
	%>
    <a href="main_property_detail.jsp?property_id=<%=propertyId%>" class="property-card-link">
        <div class="property-card">
            <img src="/uploads/<%=photoUrl%>" alt="숙소 대표 이미지" />
            <div class="property-info">
                <div class="property-location"></div>
                <div class="property-name"><%=propertyName%></div>
                <div class="property-rating">⭐ 후기 </div>
                <div class="property-price"></div>
                <!-- hidden input은 필요 없음, GET 파라미터로 전달됨 -->
            </div>
        </div>
    </a>
<% } %>

		</div>
	</div>

	<!-- ====== 공통 푸터 ====== -->
	<jsp:include page="property_footer.jsp" />

	<!-- ====== 하트 토글 스크립트 ====== -->
	<script>
		// 하트 아이콘 클릭 시 찜 토글 (♥/♡)
		function toggleHeart(button) {
			button.classList.toggle('active');
			button.textContent = button.classList.contains('active') ? '♥'
					: '♡';
		}
	</script>

</body>
</html>
