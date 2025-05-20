<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_hostpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>hostCalendar</title>
<style>

/* 제정신 아닌놈 */
@media (min-width: 1000px) {
    .container {
        max-width: 100vw;
    }
}

.container {
	display: flex;
}

.calendar-wrapper {
	padding: 2rem;
	width: 90%;
}

.sidebar {
	padding: 2rem;
	border-left: 1px solid #ddd;
	background-color: #fafafa;
	height: 100vh;
	position: sticky;
	top: 0;
	right: 0;
}

.month-title {
	font-size: 1.5rem;
	font-weight: bold;
	margin: 3rem 0 1rem;
}

.calendar-grid {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	gap: 1px;
	background-color: #ccc;
	margin-bottom: 2rem;
}

.day-cell {
	background-color: #f5f5f5;
	padding: 0.75rem;
	min-height: 100px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	font-size: 14px;
}

.day-cell span {
	display: block;
}

.weekday-header {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	padding: 0.5rem 0;
	text-align: center;
}

.price {
	margin-top: auto;
	font-weight: bold;
}

.setting-title {
	font-size: 1.3rem;
	font-weight: bold;
	margin-bottom: 1rem;
}

.setting-box {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 1rem;
	margin-bottom: 1.5rem;
	background: #fff;
}

.toggle {
	margin-top: 0.5rem;
}

.discount {
	font-size: 0.9rem;
	color: #777;
	margin-top: 0.3rem;
}

.middlebar {
	position: sticky;
	top: 0;
	background-color: #fff; /* 배경을 지정해 가려지지 않도록 */
	z-index: 1;
}
</style>
<body>
	<div class="container">
		<div class="calendar-wrapper">
			<div class="middlebar">
				<div class="month-title" id="floatingMonthTitle">5월 2025</div>
				<div class="weekday-header">
					<div>일</div>
					<div>월</div>
					<div>화</div>
					<div>수</div>
					<div>목</div>
					<div>금</div>
					<div>토</div>
				</div>
			</div>


			<%
			java.time.YearMonth ym;
			java.time.LocalDate date;
			java.time.DayOfWeek dow;
			java.util.Locale locale = java.util.Locale.KOREAN;

			for (int m = 1; m <= 12; m++) {
				ym = java.time.YearMonth.of(2025, m);
				date = ym.atDay(1);
				int daysInMonth = ym.lengthOfMonth();
				int startOffset = date.getDayOfWeek().getValue() % 7; // 일요일=0

				int totalCells = 42; // 6x7 grid
			%>
			<div class="month-title" data-month="<%=m%>월 2025"><%=m%>월 2025
			</div>
			<div class="calendar-grid">
				<%
				for (int i = 0; i < totalCells; i++) {
					if (i < startOffset || i >= startOffset + daysInMonth) {
				%>
				<div class="day-cell"></div>
				<%
				} else {
				int day = i - startOffset + 1;
				%>
				<div class="day-cell">
					<span><%=day%></span> <span class="price">₩15,000</span>
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

		<div class="sidebar">
			<div class="setting-title">설정</div>
			<div>이 설정은 날짜별로 맞춤 설정하지 않은 모든 날짜에 적용됩니다.</div>

			<hr style="margin: 1.5rem 0;">

			<div class="setting-box">
				<div style="font-weight: bold;">기본 요금</div>
				<input id="basePriceInput" type="number" value="15000"
					style="font-size: 2rem; margin-top: 0.5rem; width: 100%; border: none; border-bottom: 1px solid #ccc;" />
			</div>

			<div class="setting-box">
				<div style="font-weight: bold;">맞춤 주말 요금</div>
				<button style="margin-top: 0.5rem;">추가</button>
			</div>


			<div class="setting-box">
				<div style="font-weight: bold;">할인</div>
				<div class="discount">요금을 조정하여 더 많은 게스트를 유치해보세요.</div>
				<div style="margin-top: 1rem;">
					<div>
						<strong>주간 (7박 이상):</strong> 0%
					</div>
					<div class="discount">주 평균 요금은 ₩105,000입니다.</div>
				</div>
			</div>
		</div>
	</div>

	<script>
document.addEventListener("DOMContentLoaded", function () {
	const input = document.getElementById("basePriceInput");

	// 함수: 모든 가격을 갱신
	function updateCalendarPrices(newPrice) {
		const prices = document.querySelectorAll(".price");
		prices.forEach(priceEl => {
			priceEl.textContent = "₩" + parseInt(newPrice).toLocaleString();
		});
	}

	// 이벤트 연결
	input.addEventListener("input", function () {
		const value = input.value;
		if (!isNaN(value) && value.trim() !== "") {
			updateCalendarPrices(value);
		}
	});
});

document.addEventListener("DOMContentLoaded", function () {
	const input = document.getElementById("basePriceInput");

	// 기본 요금 변경 처리
	function updateCalendarPrices(newPrice) {
		const prices = document.querySelectorAll(".price");
		prices.forEach(priceEl => {
			priceEl.textContent = "₩" + parseInt(newPrice).toLocaleString();
		});
	}

	input.addEventListener("input", function () {
		const value = input.value;
		if (!isNaN(value) && value.trim() !== "") {
			updateCalendarPrices(value);
		}
	});

	// 월 자동 업데이트 처리
	const monthTitleEls = document.querySelectorAll(".calendar-wrapper .month-title[data-month]");
	const floatingTitle = document.getElementById("floatingMonthTitle");

	const observerOptions = {
		root: null,
		rootMargin: "-30% 0px -70% 0px", // 화면 가운데 기준
		threshold: 0
	};

	const observer = new IntersectionObserver((entries) => {
		entries.forEach(entry => {
			if (entry.isIntersecting) {
				const newMonth = entry.target.getAttribute("data-month");
				floatingTitle.textContent = newMonth;
			}
		});
	}, observerOptions);

	monthTitleEls.forEach(el => observer.observe(el));
});
</script>
</body>
</html>
