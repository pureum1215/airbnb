<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userHeader</title>

<!-- 외부 라이브러리 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
/* === 공통 스타일 === */
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

/* === Header 영역 === */
.biggest_box {
	height: 7vh;
	background-color: #FCFCFC;
	border-bottom: 1px solid #ddd;
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px 40px;
}

.header .logo {
	display: flex;
	align-items: center;
	cursor: pointer;
}

.header .logo img {
	height: 30px;
	margin-right: 8px;
}

.header .nav {
	display: flex;
	gap: 40px;
	align-items: center;
}

.header .nav-item {
	text-align: center;
	font-size: 14px;
	color: #333;
}

.header .actions {
	display: flex;
	align-items: center;
	gap: 12px;
}

.header .actions .circle-btn {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-color: #eee;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: bold;
	position: relative;
}

.circle-btn {
	cursor: pointer;
	transition: transform 0.15s ease-in-out;
}

.circle-btn:hover {
	transform: scale(1.05);
}


/* === Search Bar === */
.search-bar {
	margin: 20px auto;
	max-width: 800px;
	background: white;
	border: 1px solid #ddd;
	border-radius: 999px;
	display: flex;
	justify-content: space-between;
	padding: 12px 16px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	position: relative;
	z-index: 5;
}

.search-bar .section {
	flex: 1;
	padding: 10px 16px;
	border-right: 1px solid #eee;
	border-radius: 999px;
	cursor: pointer;
}

.search-bar .section.active {
	background-color: #f0f0f0;
	transition: background-color 0.2s ease;
}

.search-bar .section:last-child {
	border-right: none;
}

.search-bar .section:hover {
	background-color: #ebebeb;
}

.search-bar .section-title {
	font-size: 12px;
	font-weight: bold;
	color: #555;
}

.search-bar .section-value {
	font-size: 14px;
	color: #888;
}

.search-bar .search-icon {
	margin-top: 6px;
	background-color: #ff385c;
	color: white;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

/* === Dropdown Panel (공통) === */
.dropdown-panel {
	position: absolute;
	top: 170px;
	left: 50%;
	transform: translateX(-50%) translateY(-10px);
	width: 700px;
	background: white;
	border-radius: 20px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
	padding: 20px;
	opacity: 0;
	pointer-events: none;
	transition: opacity 0.3s ease, transform 0.3s ease;
	z-index: 10;
}

.dropdown-panel.active {
	opacity: 1;
	transform: translateX(-50%) translateY(0);
	pointer-events: auto;
}

.dropdown-panel ul {
	list-style: none;
	padding: 0;
}

.dropdown-panel li {
	margin-bottom: 10px;
	font-size: 14px;
}

/* === 필터 선택 영역 === */
.filter-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 14px 0;
	border-bottom: 1px solid #eee;
}

.filter-row:last-child {
	border-bottom: none;
}

.label {
	font-weight: bold;
	margin-bottom: 4px;
	width: 80px;
}

.sub {
	font-size: 13px;
	color: #666;
}

.counter {
	display: flex;
	align-items: center;
	gap: 12px;
}

.counter button {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	border: 1px solid #bbb;
	background: white;
	font-size: 20px;
	line-height: 1;
	cursor: pointer;
	color: #222;
}

.counter button.disabled {
	opacity: 0.4;
	cursor: not-allowed;
}

/* === 날짜 선택 영역 === */
.calendar-wrapper {
	display: flex;
	justify-content: center;
	width: 100%;
}

.calendar-panel {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 100%;
}

.calendar-panel .flatpickr-innerContainer {
	display: flex;
	justify-content: center;
}

.flatpickr-calendar.inline, #calendar .flatpickr-calendar {
	margin-left: auto !important;
	margin-right: auto !important;
}

.calendar-panel .flatpickr-calendar {
	width: 100% !important;
	max-width: 100% !important;
	box-shadow: none;
	margin: 0 auto;
}

/* === 가격 범위 스타일 === */
.price-range {
	display: flex;
	flex-direction: column;
	width: 100%;
	margin-top: 10px;
}

.price-sliders {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	align-items: center;
}

.price-sliders input[type="range"] {
	flex: 1;
}

.price-range input[type="range"] {
	width: 100%;
	margin: 4px 0;
}

.price-values {
	font-size: 13px;
	color: #333;
	margin-top: 4px;
}

/* === 침실과 침대 스타일 === */
.bedroom-controls {
	display: flex;
	gap: 24px;
}

.counter-group {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 13px;
}

/* === 편의시설 === */
.amenities {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-top: 8px;
}

.amenity-btn {
	padding: 8px 14px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 20px;
	font-size: 13px;
	cursor: pointer;
	transition: background 0.2s ease;
}

.amenity-btn:hover {
	background-color: #e0e0e0;
}

.hidden {
	display: none;
}

.host-mode-btn {
	display: flex;
	align-items: center;
	padding: 5px;
	gap: 0.5rem;
	border: 1px solid #FCFCFC; /* gray-300 */
	background-color: #FCFCFC;
	color: black;
	font-weight: 500;
	border-radius: 9999px; /* rounded-full */
	transition: background-color 0.2s ease;
	cursor: pointer;
	font-size: 13px;
	font: bolder;
}

.host-mode-btn:hover {
	background-color: 	#EDEDED; /* hover:bg-gray-50 */
}

.host-mode-icon {
	width: 1.25rem; /* w-5 */
	height: 1.25rem; /* h-5 */
	color: #4b5563; /* text-gray-600 */
}

.dropdown {
	position: absolute;
	top: 110%; /* 메뉴 버튼 아래로 */
	right: 0;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	width: 220px;
	padding: 12px 0;
	z-index: 100;
	display: none;
}

.dropdown.active {
	display: block;
}

.dropdown-item {
	padding: 10px 16px;
	font-size: 14px;
	color: #333;
	cursor: pointer;
}

.dropdown-item:hover {
	background-color: #f5f5f5;
}

/** user info container */
.header .actions .circle-btn .user-info-container {
	display: none;
	position: absolute;
	right: 0;
	top: 50px;
	padding: 10px 0px;
	width: 200px;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	border-radius: 10px;
	background-color: #fff;
	z-index: 10;
}

.header .actions .circle-btn .user-info-container.action {
	display: block;
}

.user-info-container .menu-list {
	padding: 15px 30px;
	display: flex;
	justify-content: start;
	align-items: center;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.user-info-container .menu-list:hover {
	background-color: #F7F7F7;
}

.user-info-container .menu-list img {
	margin-right: 10px;
	width: 26px;
	height: 26px;
}
</style>
</head>

<body>
	<%
	String sessionUserId = (String) session.getAttribute("user_id");
	String sessionHostId = (String) session.getAttribute("host_id");
	%>


	<div class="biggest_box">
		<!-- Header -->
		<div class="header">
			<div class="logo" onclick="location.href='/main_list.ma'">
				<img src="https://cdn.worldvectorlogo.com/logos/airbnb-1.svg" 
				alt="Airbnb Logo" >
				<span style="color: #ff385c; font-weight: bold; font-size: 20px;">airbnb</span>
			</div>
			<div class="nav"></div>
			<div class="actions">
			<%
				if(sessionHostId != null ) {
			%>
					<button class="host-mode-btn">호스트 모드로 전환</button>
			<%
				}
			%>
				<div class="circle-btn"  style="background-color: black; color: white;"
					onclick="fn_userinfo_header()">
					<%
					if (sessionUserId != null) {
					%>
					U
					<%
					} else {
					%>x
					<%
					}
					%>                                                                                                                                                                                                                                                                                                                                           
				</div>

				<!--  user info 버튼 ( 햄버거 버튼) -->
				<div class="circle-btn" onclick="fn_userinfo_header()"
					style="cursor: pointer;">
					<div id="userMenuToggle">
						<i class="fas fa-bars"></i>
					</div>

					<div class="user-info-container" id="userInfoContainerID">

						<%
						if (sessionUserId != null) {
						%>

						<!-- 회원일때 -->
						<div class="menu-list" onclick="togglebutton('wish')"> 
							<img src="https://cdn-icons-png.flaticon.com/512/3132/3132924.png" />
							<span>위시리스트</span>
						</div>

						<div class="menu-list" onclick="togglebutton('reservation')">
							<img src="https://cdn-icons-png.flaticon.com/512/2796/2796326.png" />
							<span>예약목록</span>
						</div>

						<div class="menu-list" onclick="togglebutton('profile')">
							<img src="https://cdn-icons-png.flaticon.com/512/6522/6522516.png" />
							<span>프로필</span>
						</div>
						<div style="margin-left: 20px; margin-right: 20px; border-bottom: 1px solid #5B5956;"></div>
						<div class="menu-list" onclick="togglebutton('logout')">
							<span>로그아웃</span>
						</div>

						<%
						} else {
						%>

						<!-- 비회원일때 -->
						<div class="menu-list" onclick="togglebutton('login')">
							<span>로그인</span>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Dropdown Panel -->
	<div class="dropdown-panel" id="dropdownPanel"></div>
	<!-- JS Libraries -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<script>
	/****
		user Info 버튼 토글 버튼 ( 햄버거 버트 )
	**/
	function fn_userinfo_header() {
		const target = document.getElementById('userInfoContainerID');
		console.log(target);
		if (target.classList.contains('action')) {
			target.classList.remove('action');
		} else {
			target.classList.add('action');
		}
	}
	
	
	// === 변수 정의 ===
	const panel = document.getElementById('dropdownPanel');
	let currentType = null;

	// === 외부 클릭 시 패널 닫기 ===
	document.addEventListener('click', function(e) {
		if (!e.target.closest('.search-bar') && !e.target.closest('#dropdownPanel')) {
			panel.classList.remove('active');
			currentType = null;
		}
	});
	
	   // userInfo 버튼 , menu 버튼
	   function togglebutton(menu) {
	      if(menu === 'wish') {
	         location.href = '${pageContext.request.contextPath}/userwishlist.us?userId=<%=sessionUserId%>';
	      } else if(menu === 'reservation') {
	         location.href = '${pageContext.request.contextPath}/user/userReservationList.jsp?userId=<%=sessionUserId%>';
	      } else if(menu === 'profile') {
	         location.href = '${pageContext.request.contextPath}/userProfile.us?userId=<%=sessionUserId%>';
	      } 
	      else if(menu === 'login') {
	         location.href = "login.me";
	      } 
	      else if(menu === 'logout') {
	         location.href = "logout.ma";
	      } 
	   } 
	
	   
	   // === host mode 버튼 ===
	   document.querySelector('.host-mode-btn').addEventListener('click', function() {
		    window.location.href = 'hostList.ho';
		  });
	</script>
</body>
</html>
