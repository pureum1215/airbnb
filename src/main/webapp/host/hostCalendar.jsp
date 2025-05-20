<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header_hostpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>hostCalendar</title>
<style>
/* 화면 넓이에 따라 calendar wrapper 최대 너비 설정 */
@media (min-width: 1000px) {
    .calendar-wrapper {
        max-width: 100vw;
    }
}

body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Helvetica Neue', sans-serif;
    background: #fff;
}

.calendar-wrapper {
	padding: 2rem;
	width: 100%;
}

/* 월 타이틀 스타일 */
.month-title {
	font-size: 1.5rem;
	font-weight: 600;
	margin: 3rem 0 1rem;
}

/* 요일 헤더 스타일 */
.weekday-header {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	padding: 0.5rem 0;
	text-align: center;
}

/* 달력 그리드 (7x6) */
.calendar-grid {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	gap: 1px;
	background-color: #ccc;
	margin-bottom: 2rem;
}

/* 날짜 셀 스타일 */
.day-cell {
	background-color: #f5f5f5;
	padding: 0.75rem;
	min-height: 100px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	font-size: 14px;
	position: relative;
	color: #111;
}

/* 숙소별 예약 색상 클래스 ................. 호스트 한 명의 최대 숙소 수 : 3개 .................... 색상 마음에 안드시면 변경 가능 */
.reserved-1 { background-color: #f28b82; } /* 숙소1: 빨간색 */
.reserved-2 { background-color: #90caf9; } /* 숙소2: 파란색 */
.reserved-3 { background-color: #81c784; } /* 숙소3: 초록색 */

/* 날짜 숫자 */
.day-cell span {
	font-weight: 600;
	margin-bottom: 0.25rem;
}

/* 예약 정보 텍스트 */
.reservation-info {
	font-size: 13px;
	font-weight: 500;
	color: #333;
	line-height: 1.4;
}

/* 상단 고정 요일/월 타이틀 바 */
.middlebar {
	position: sticky;
	top: 0;
	background-color: #fff;
	z-index: 1;
}

/* 과거 날짜 흐리게 표시 */
.past-date {
	opacity: 0.5;
}
</style>
</head>
<body>

<div class="calendar-wrapper">
	<!-- 상단 고정 타이틀 및 요일 표시 -->
	<div class="middlebar">
		<div class="month-title" id="floatingMonthTitle">5월 2025</div>
		<div class="weekday-header">
			<div>일</div><div>월</div><div>화</div><div>수</div>
			<div>목</div><div>금</div><div>토</div>
		</div>
	</div>

	<%
	// 현재 날짜 가져오기
	LocalDate today = LocalDate.now();

	// 숙소별 색상 정의
	Map<String, String> houseColors = new HashMap<>();
	houseColors.put("숙소1", "reserved-1");
	houseColors.put("숙소2", "reserved-2");
	houseColors.put("숙소3", "reserved-3");

	// 예약 데이터 샘플 생성 ............. 나중에 삭제 바랍니다.
	String[][] sampleData = {
		{"2025-05-10", "숙소1", "예약자1", "3"},
		{"2025-05-20", "숙소2", "예약자2", "2"},
		{"2025-06-01", "숙소3", "예약자3", "5"},
		{"2025-06-18", "숙소1", "예약자4", "1"},
		{"2025-07-05", "숙소2", "예약자5", "4"},
		{"2025-07-15", "숙소3", "예약자6", "7"},
		{"2025-08-01", "숙소1", "예약자7", "2"},
		{"2025-08-10", "숙소2", "예약자8", "3"},
		{"2025-09-03", "숙소3", "예약자9", "6"},
		{"2025-10-12", "숙소1", "예약자10", "10"},
	};

	// 예약 날짜별로 저장 (key = 날짜, value = 색상/숙소명/예약자명)
	Map<String, String[]> reservedDates = new HashMap<>();
	for (String[] entry : sampleData) {
		LocalDate start = LocalDate.parse(entry[0]);
		String house = entry[1];
		String guest = entry[2];
		int nights = Integer.parseInt(entry[3]);
		String colorClass = houseColors.get(house);
		for (int i = 0; i < nights; i++) {
			LocalDate current = start.plusDays(i);
			String key = current.toString();
			reservedDates.put(key, new String[]{colorClass, house, guest});
		}
	}

	// 1월 ~ 12월 반복 생성
	for (int m = 1; m <= 12; m++) {
		YearMonth ym = YearMonth.of(2025, m);
		LocalDate date = ym.atDay(1);
		int daysInMonth = ym.lengthOfMonth();
		int startOffset = date.getDayOfWeek().getValue() % 7; // 일요일 기준
		int totalCells = 42; // 6주 기준
	%>
	<!-- 각 월 타이틀 및 달력 -->
	<div class="month-title" data-month="<%=m%>월 2025" id="month-<%=m%>"><%=m%>월 2025</div>
	<div class="calendar-grid">
		<%
		for (int i = 0; i < totalCells; i++) {
			if (i < startOffset || i >= startOffset + daysInMonth) {
		%>
		<!-- 빈 셀 (월 시작 전/끝 이후) -->
		<div class="day-cell"></div>
		<%
			} else {
				int day = i - startOffset + 1;
				LocalDate currentDate = LocalDate.of(2025, m, day);
				String dateStr = currentDate.toString();
				boolean isPast = currentDate.isBefore(today);
				String[] info = reservedDates.get(dateStr);
				String className = (info != null) ? info[0] : "";
				String houseName = (info != null) ? info[1] : "";
				String guestName = (info != null) ? info[2] : "";
				String pastClass = isPast ? "past-date" : "";
		%>
		<!-- 실제 날짜 셀 -->
		<div class="day-cell <%=className%> <%=pastClass%>">
			<span><%=day%></span>
			<% if (!houseName.isEmpty()) { %>
				<div class="reservation-info">
					<%=houseName%><br>
					<%=guestName%>
				</div>
			<% } %>
		</div>
		<%
			}
		}
		%>
	</div>
	<%
	}
	%>
</div>

<!-- 상단 타이틀 업데이트 + 현재 월로 자동 스크롤 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
	const monthTitleEls = document.querySelectorAll(".calendar-wrapper .month-title[data-month]");
	const floatingTitle = document.getElementById("floatingMonthTitle");

	// 상단 타이틀 동기화
	const observer = new IntersectionObserver((entries) => {
		entries.forEach(entry => {
			if (entry.isIntersecting) {
				const newMonth = entry.target.getAttribute("data-month");
				floatingTitle.textContent = newMonth;
			}
		});
	}, { rootMargin: "-30% 0px -70% 0px", threshold: 0 });

	monthTitleEls.forEach(el => observer.observe(el));


});
</script>

</body>
</html>
