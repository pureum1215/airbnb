<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDashboard_reservation</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background-color: #f4f4f4;
}

/* 섹션 박스 스타일 */
.section {
	margin-bottom: 2rem;
	background: white;
	padding: 1rem;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	
	scroll-margin-top: 6rem;
}

.section h3 {
	margin-top: 0;
}

/* 공통 버튼 스타일 */
.button {
	background-color: #4a6fa5;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	font-size: 15px;
	cursor: pointer;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #3b5b85;
}

/* 테이블 내 액션 버튼 */
.actions button {
	background-color: #4a6fa5;
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: background-color 0.2s ease, box-shadow 0.2s ease;
}

.actions button:hover {
	background-color: #3b5b85;
}

.actions button:nth-child(2) {
	background-color: #6b8e23;
}

.actions button:nth-child(2):hover {
	background-color: #556b2f;
}

/* 마지막 열은 너비 고정 */
th:last-child, td:last-child {
	width: 180px;
	white-space: nowrap;
}

#toggleReservationBtn {
	margin-top: 20px;
	background-color: transparent;
	border: none;
	color: #FF385C;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
}

</style>
</head>
<body>
	<!-- 예약 관리 섹션 -->
	<div id="bookings" class="section">
		<h3>📅 예약 관리</h3>
		<!-- 토글 버튼 -->
		<button id="toggleReservationBtn" style="margin-top: 0;">더 보기</button>
		
		<table id="reservationTable">
			<tr>
				<th>예약번호</th>
				<th>숙소</th>
				<th>게스트</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
			<tr class="reservation-row">
				<td>예시_#A123</td>
				<td>예시_숙소1</td>
				<td>예시_유저1</td>
				<td>예시_진행중</td>
				<td class="actions">
					<button>취소</button>
					<button>환불</button>
				</td>
			</tr>
			<tr class="reservation-row">
				<td>예시_#A124</td>
				<td>예시_숙소2</td>
				<td>예시_유저2</td>
				<td>예시_환불됨</td>
				<td class="actions">
					<button>취소</button>
					<button>환불</button>
				</td>
			</tr>
			<tr class="reservation-row">
				<td>예시_#A125</td>
				<td>예시_숙소3</td>
				<td>예시_유저3</td>
				<td>예시_진행중</td>
				<td class="actions">
					<button>취소</button>
					<button>환불</button>
				</td>
			</tr>
			<tr class="reservation-row">
				<td>예시_#A126</td>
				<td>예시_숙소4</td>
				<td>예시_유저4</td>
				<td>예시_진행중</td>
				<td class="actions">
					<button>취소</button>
					<button>환불</button>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
	const toggleReservationBtn = document.getElementById('toggleReservationBtn');
	const reservationRows = document.querySelectorAll('.reservation-row');
	
	// 처음 로드 시: 2개 이후는 숨김
	reservationRows.forEach((row, index) => {
	  if (index >= 2) {
	    row.style.display = 'none';
	  }
	});
	
	toggleReservationBtn.addEventListener('click', () => {
	  const isExpanded = toggleReservationBtn.textContent === '접기';
	  reservationRows.forEach((row, index) => {
	    if (index >= 2) {
	      row.style.display = isExpanded ? 'none' : 'table-row';
	    }
	  });
	  toggleReservationBtn.textContent = isExpanded ? '더 보기' : '접기';
	});
	</script>
</body>
</html>