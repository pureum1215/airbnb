<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>adminHeader</title>

<!-- 여기 아래에 CSS 스타일 포함 -->
<style>
.adminHeader-wide {
	margin: 0;
	padding: 0;
}

.adminHeader {
	width: 100%;
	border-bottom: 1px solid #ccc;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 50;
	background-color: #2C3E50;
	color: white;
}

.adminHeader-container {
	width: 100%;
	padding: 16px 28px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-sizing: border-box;
}

.logo-area {
	display: flex;
	align-items: center;
	gap: 8px;
	cursor: pointer;
}

.logo-area img {
	width: 24px;
	height: 24px;
}

.logo-area span {
	font-weight: bold;
	font-size: 18px;
	color: white;
}

.menu-area {
	display: flex;
	align-items: center;
	gap: 16px;
	font-size: 14px;
}

.menu-area a {
	text-decoration: none;
	color: white;
}

.menu-area a:hover {
	text-decoration: underline;
}

.menu-button {
	border: 1px solid white;
	padding: 6px 12px;
	border-radius: 9999px;
	display: flex;
	align-items: center;
	gap: 8px;
	background: none;
	cursor: pointer;
}

.menu-icon {
	font-size: 18px;
	color: white;
}

.user-icon {
	background-color: #e5e5e5;
	color: black;
	border-radius: 9999px;
	width: 24px;
	height: 24px;
	font-size: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>

	<div class="adminHeader-wide">
		<header class="adminHeader">
			<div class="adminHeader-container">
				<!-- 왼쪽 로고 -->
				<div class="logo-area">
					<img
						src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png"
						alt="airbnb logo"> <span>airbnb</span>
				</div>

				<!-- 오른쪽 메뉴 -->
				<div class="menu-area">
					<a href="#">홈페이지로 이동</a>
					<button class="menu-button">
						<span class="menu-icon">☰</span> <span class="user-icon" style="background-color: #F9595E; color: white;">A</span>
					</button>
				</div>
			</div>
		</header>
	</div>
</body>
</html>