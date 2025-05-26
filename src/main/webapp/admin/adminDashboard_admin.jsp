<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDashboard_admin</title>
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

#toggleAdminBtn {
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
<!-- 관리자 설정 섹션 -->
	<div id="admin" class="section">
		<h3>🔐 관리자 설정</h3>
		<!-- 토글 버튼 -->
		<button id="toggleAdminBtn" style="margin-top: 0;">더 보기</button>

		<table>
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>역할</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
			<tr class="admin-row">
				<td>예시_관리자1</td>
				<td>예시_admin1@email.com</td>
				<td>예시_최고 관리자</td>
				<td>예시_활성</td>
				<td class="actions"><button>삭제</button></td>
			</tr>
			<tr class="admin-row">
				<td>예시_관리자2</td>
				<td>예시_admin2@email.com</td>
				<td>예시_일반 관리자</td>
				<td>예시_활성</td>
				<td class="actions"><button>삭제</button></td>
			</tr>
			<tr class="admin-row">
				<td>예시_관리자3</td>
				<td>예시_admin3@email.com</td>
				<td>예시_일반 관리자</td>
				<td>예시_비활성</td>
				<td class="actions"><button>삭제</button></td>
			</tr>
			<tr class="admin-row">
				<td>예시_관리자4</td>
				<td>예시_admin4@email.com</td>
				<td>예시_일반 관리자</td>
				<td>예시_활성</td>
				<td class="actions"><button>삭제</button></td>
			</tr>			
		</table>
		<br>
		<button class="button">신규 관리자 추가</button>
	</div>
	
	
	
	<script>
	const toggleAdminBtn = document.getElementById('toggleAdminBtn');
	const adminRows = document.querySelectorAll('.admin-row');
	
	// 처음 로드 시: 2개 이후는 숨김
	adminRows.forEach((row, index) => {
	  if (index >= 2) {
	    row.style.display = 'none';
	  }
	});
	
	toggleAdminBtn.addEventListener('click', () => {
	  const isExpanded = toggleAdminBtn.textContent === '접기';
	  adminRows.forEach((row, index) => {
	    if (index >= 2) {
	      row.style.display = isExpanded ? 'none' : 'table-row';
	    }
	  });
	  toggleAdminBtn.textContent = isExpanded ? '더 보기' : '접기';
	});
	</script>
</body>
</html>