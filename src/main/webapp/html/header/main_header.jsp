<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airbnb Style Search</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #FBFBFB;
	height: 100vh;
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px 40px;
	border-bottom: 1px solid #ddd;
	background-color: #FBFBFB;
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

.guest-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 14px 0;
	border-bottom: 1px solid #eee;
}

.guest-row:last-child {
	border-bottom: none;
}

.label {
	font-weight: bold;
	margin-bottom: 4px;
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

.counter button:disabled {
	cursor: not-allowed;
	border-color: #ddd;
	color: #ccc;
}

/* 체크인/체크아웃 날짜 정보 스타일 */
#dateInfo {
	margin-top: 24px;
	padding: 12px 24px;
	border: 1px solid #eee;
	border-radius: 12px;
	background-color: #fafafa;
	font-size: 15px;
	color: #333;
	text-align: center;
	line-height: 1.6;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	font-family: 'Segoe UI', sans-serif;
}

#calendar {
	width: 100%;
}
.calendar-wrapper {
  display: flex;
  justify-content: center;  /* 수평 중앙 정렬 */
  width: 100%;
}
/* 부모 컨테이너에서 중앙 정렬만 담당 */
.calendar-panel {
  display: flex;
  flex-direction: column;
  align-items: center;  /* 내부 요소 수직 중앙 정렬 */
  justify-content: center;
  width: 100%;
}
.calendar-panel .flatpickr-innerContainer {
    display: flex;
    justify-content: center;
}

/* 달력 스타일은 유지하되 display 변경 없이 중앙에 위치 */
.flatpickr-calendar.inline {
  margin-left: auto !important;
  margin-right: auto !important;
}

.calendar-panel .flatpickr-calendar {
	width: 100% !important;
	max-width: 100% !important;
	box-shadow: none;
	margin: 0 auto;
}

/* flatpickr 달력 자체를 중앙에 */
#calendar .flatpickr-calendar {
  margin-left: auto !important;
  margin-right: auto !important;
}
</style>
</head>
<body>

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

	<!-- Search Bar -->
	<div class="search-bar">
		<div class="section" data-type="location">
			<div class="section-title">여행지</div>
			<div class="section-value">여행지 검색</div>
		</div>
		<div class="section" data-type="date">
			<div class="section-title">날짜</div>
			<div class="section-value">날짜 추가</div>
		</div>
		<div class="section" data-type="guest">
			<div class="section-title">여행자</div>
			<div class="section-value">게스트 추가</div>
		</div>
		<div class="search-icon">
			<i class="fas fa-search"></i>
		</div>
	</div>

	<!-- Dropdown Panel -->
	<div class="dropdown-panel" id="dropdownPanel"></div>

	<!-- JS Libraries -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<!-- JS Logic -->
	<script>
const panel = document.getElementById('dropdownPanel');
const sections = document.querySelectorAll('.search-bar .section');
let currentType = null;

const guestCounts = {
    adult: 1,
    child: 0,
    infant: 0,
    pet: 0
};

function renderGuestContent() {
    return `
        <h4>여행자 선택</h4>
        <div class="guest-row">
            <div>
                <div class="label">성인</div>
                <div class="sub">13세 이상</div>
            </div>
            <div class="counter">
                <button class="minus" data-type="adult">−</button>
                <span>${guestCounts.adult}</span>
                <button class="plus" data-type="adult">+</button>
            </div>
        </div>
        <div class="guest-row">
            <div>
                <div class="label">어린이</div>
                <div class="sub">2~12세</div>
            </div>
            <div class="counter">
                <button class="minus" data-type="child">−</button>
                <span>${guestCounts.child}</span>
                <button class="plus" data-type="child">+</button>
            </div>
        </div>
        <div class="guest-row">
            <div>
                <div class="label">유아</div>
                <div class="sub">2세 미만</div>
            </div>
            <div class="counter">
                <button class="minus" data-type="infant">−</button>
                <span>${guestCounts.infant}</span>
                <button class="plus" data-type="infant">+</button>
            </div>
        </div>
        <div class="guest-row">
            <div>
                <div class="label">반려동물</div>
                <div class="sub">보조동물을 동반하십니까?</div>
            </div>
            <div class="counter">
                <button class="minus" data-type="pet">−</button>
                <span>${guestCounts.pet}</span>
                <button class="plus" data-type="pet">+</button>
            </div>
        </div>
    `;
}

function updateGuestUI() {
    const counters = panel.querySelectorAll('.guest-row');
    counters.forEach(row => {
        const type = row.querySelector('.minus').dataset.type;
        row.querySelector('span').textContent = guestCounts[type];
        row.querySelector('.minus').disabled = guestCounts[type] === 0;
    });
}

sections.forEach(section => {
    section.addEventListener('click', () => {
        const type = section.dataset.type;

        if (type === currentType && panel.classList.contains('active')) {
            panel.classList.remove('active');
            currentType = null;
            return;
        }

        panel.classList.remove('active');
        setTimeout(() => {
            if (type === 'guest') {
                panel.innerHTML = renderGuestContent();
                attachGuestEvents();
                updateGuestUI();
            } else if (type === 'location') {
                panel.innerHTML = `
                    <h4>추천 여행지</h4>
                    <ul>
                        <li>🏕️ 근처 체험 찾기 - 가까운 체험</li>
                        <li>🗼 파리, 프랑스 - 추천 숙소</li>
                        <li>🏰 런던, 영국 - 관광 명소</li>
                        <li>🌲 그린델발트, 스위스 - 자연</li>
                        <li>🏞️ 인터라켄, 스위스 - 호수</li>
                        <li>🏖️ 바르셀로나, 스페인 - 해변</li>
                    </ul>
                `;
            } else if (type === 'date') {
                panel.innerHTML = `
                	<div class="calendar-wrapper">
                	  <div class="calendar-panel">
                	    <div id="calendar"></div>
                	  </div>
                	</div>
                        <div>체크인 날짜: <span id="checkin">-</span></div>
                        <div>체크아웃 날짜: <span id="checkout">-</span></div>
                    </div>
                `;
                flatpickr("#calendar", {
                    mode: "range",
                    minDate: "today",
                    dateFormat: "Y-m-d",
                    inline: true,
                    static: true,
                    onChange: function(selectedDates, dateStr, instance) {
                        const [start, end] = selectedDates;
                        document.getElementById('checkin').textContent = start ? instance.formatDate(start, "Y-m-d") : "-";
                        document.getElementById('checkout').textContent = end ? instance.formatDate(end, "Y-m-d") : "-";
                    }
                });
            }

            panel.classList.add('active');
            currentType = type;
        }, 200);
    });
});

function attachGuestEvents() {
    panel.querySelectorAll('.plus').forEach(btn => {
        btn.addEventListener('click', () => {
            const type = btn.dataset.type;
            guestCounts[type]++;
            updateGuestUI();
        });
    });

    panel.querySelectorAll('.minus').forEach(btn => {
        btn.addEventListener('click', () => {
            const type = btn.dataset.type;
            if (guestCounts[type] > 0) {
                guestCounts[type]--;
                updateGuestUI();
            }
        });
    });
}

document.addEventListener('click', function(e) {
    if (!e.target.closest('.search-bar') && !e.target.closest('#dropdownPanel')) {
        panel.classList.remove('active');
        currentType = null;
    }
});
</script>

</body>
</html>
