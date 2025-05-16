<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

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
	flex-direction: column; align-items : center;
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
</style>
</head>

<body>
	<div class="biggest_box">
		<!-- Header -->
		<div class="header">
			<div class="logo">
				<img src="https://cdn.worldvectorlogo.com/logos/airbnb-1.svg"
					alt="Airbnb Logo"> <span
					style="color: #ff385c; font-weight: bold; font-size: 20px;">airbnb</span>
			</div>
			<div class="nav"></div>
			<div class="actions">
				<span>호스트 모드로 전환</span>
				<div class="circle-btn">준</div>
				<div class="circle-btn">
					<i class="fas fa-bars"></i>
				</div>
			</div>
		</div>



</body>
</html>
