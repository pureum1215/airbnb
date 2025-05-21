<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AdminDashboard</title>

<!-- 관리자 대시보드 스타일 정의 -->
<style>
/* 전체 바디 기본 설정 */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background-color: #f4f4f4;
}

/* 사이드바 스타일 */
.sidebar {
	width: 220px;
	height: 100vh;
	position: fixed;
	background-color: #2c3e50;
	color: white;
	padding: 20px;
	padding-top: 6rem;
}

/* 사이드바 제목 */
.sidebar h2 {
	font-size: 20px;
	margin-bottom: 1rem;
}

/* 사이드바 링크 스타일 */
.sidebar a {
	color: white;
	display: block;
	margin: 10px 0;
	text-decoration: none;
}

/* 메인 콘텐츠 영역 */
.main-content {
	margin-left: 240px;
	padding: 2rem;
	padding-top: 6rem;
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

/* 테이블 기본 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 1rem;
	table-layout: fixed;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #eee;
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

/* 통계 그래프 영역 스타일 */
#stats .chart-container {
	display: flex;
	flex-wrap: nowrap; /* 가로로 배치 */
	justify-content: flex-start;
	gap: 3rem; /* 도넛 그래프와 막대 그래프 사이 여백 증가 */
	padding: 0 1rem;
}

#stats canvas {
	max-width: 100%;
}

#stats .donut-chart {
	width: 400px !important; /* 예시: 도넛은 조금 작게 */
	height: 400px !important;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
	padding: 1rem;
}

#stats .bar-chart {
	width: 700px !important; /* 예시: 막대는 좀 더 넓게 */
	height: 400px !important;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
	padding: 1rem;
}
</style>

<!-- Chart.js 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<!-- 관리자 헤더 인클루드 -->
	<div>
		<%@ include file="header_admin.jsp"%>
	</div>

	<!-- 왼쪽 고정 사이드바 -->
	<div class="sidebar">
		<h2>관리자 모드</h2>
		<a href="#dashboard">📊 요약</a> <a href="#stats">👥 통계 분석</a> <a
			href="#users">👥 사용자 관리</a> <a href="#listings">🏠 숙소 관리</a> <a
			href="#bookings">📅 예약 관리</a> <a href="#admin">🔐 관리자 설정</a>
	</div>

	<!-- 오른쪽 메인 콘텐츠 -->
	<div class="main-content">

		<!-- 요약 정보 영역 -->
		<div id="dashboard" class="section">
			<h3>📊 요약</h3>
			<p>
				총 사용자: 1200 | 숙소 수: 340 | 예약 진행 중: 82
				<!-- 나중에 삭제 요청 바랍니다. -->
			</p>
		</div>

		<!-- 통계 그래프 영역 -->
		<div id="stats" class="section">
			<h3>📈 통계 분석</h3>
			<br>
			<div class="chart-container">
				<div>
					<canvas id="bookingChart" class="donut-chart"></canvas>
					<p style="text-align: center; margin-top: 1rem; font-weight: bold;">예약
						현황</p>
				</div>

				<div>
					<canvas id="revenueChart" class="bar-chart"></canvas>
					<p style="text-align: center; margin-top: 1rem; font-weight: bold;">월별
						수익</p>
				</div>
			</div>
		</div>

		<!-- 사용자 관리 섹션 -->
		<div id="users" class="section">
			<h3>👥 사용자 관리</h3>
			<table>
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>역할</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>김유저</td>
					<td>user1@email.com</td>
					<td>게스트</td>
					<td>활성</td>
					<td class="actions"><button>삭제</button></td>
				</tr>
				<tr>
					<td>박호스트</td>
					<td>host1@email.com</td>
					<td>호스트</td>
					<td>삭제됨</td>
					<td class="actions"><button>삭제</button></td>
				</tr>
			</table>
		</div>

		<!-- 숙소 관리 섹션 -->
		<div id="listings" class="section">
			<h3>🏠 숙소 관리</h3>
			<table>
				<tr>
					<th>숙소명</th>
					<th>호스트</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>서울 감성하우스</td>
					<td>박호스트</td>
					<td>활성</td>
					<td class="actions">
						<button>삭제</button>
						<button>상세보기</button>
					</td>
				</tr>
				<tr>
					<td>제주 해변민박</td>
					<td>이호스트</td>
					<td>삭제됨</td>
					<td class="actions">
						<button>삭제</button>
						<button>상세보기</button>
					</td>
				</tr>
			</table>
		</div>

		<!-- 예약 관리 섹션 -->
		<div id="bookings" class="section">
			<h3>📅 예약 관리</h3>
			<table>
				<tr>
					<th>예약번호</th>
					<th>숙소</th>
					<th>게스트</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>#A123</td>
					<td>서울 감성하우스</td>
					<td>김유저</td>
					<td>진행중</td>
					<td class="actions">
						<button>취소</button>
						<button>환불</button>
					</td>
				</tr>
				<tr>
					<td>#A124</td>
					<td>제주 해변민박</td>
					<td>최게스트</td>
					<td>환불됨</td>
					<td class="actions">
						<button>취소</button>
						<button>환불</button>
					</td>
				</tr>
			</table>
		</div>

		<!-- 관리자 설정 섹션 -->
		<div id="admin" class="section">
			<h3>🔐 관리자 설정</h3>
			<table>
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>역할</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>관리자1</td>
					<td>admin1@email.com</td>
					<td>최고 관리자</td>
					<td>활성</td>
					<td class="actions"><button>삭제</button></td>
				</tr>
				<tr>
					<td>관리자2</td>
					<td>admin2@email.com</td>
					<td>일반 관리자</td>
					<td>활성</td>
					<td class="actions"><button>삭제</button></td>
				</tr>
				<tr>
					<td>관리자3</td>
					<td>admin3@email.com</td>
					<td>일반 관리자</td>
					<td>비활성</td>
					<td class="actions"><button>삭제</button></td>
				</tr>
			</table>
			<br>
			<button class="button">신규 관리자 추가</button>
		</div>
	</div>

	<!-- 통계용 차트 생성 스크립트 -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// 예약 상태 도넛 차트
			const bookingCtx = document.getElementById('bookingChart')
					.getContext('2d');
			new Chart(bookingCtx, {
				type : 'doughnut',
				data : {
					labels : [ '진행중', '완료됨', '취소됨' ],
					datasets : [ {
						label : '예약 상태',
						data : [ 82, 120, 38 ], // 나중에 삭제 요청 바랍니다.
						backgroundColor : [ '#4a6fa5', '#6b8e23', '#d9534f' ],
						borderColor : '#fff',
						borderWidth : 2
					} ]
				},
				options : {
					responsive : true,
					maintainAspectRatio : true,
					plugins : {
						legend : {
							position : 'bottom',
							labels : {
								boxWidth : 12,
								padding : 15
							}
						},
						tooltip : {
							callbacks : {
								label : function(context) {
									return `${context.label}: ${context.raw}건`;
								}
							}
						}
					}
				}
			});

			// 월별 수익 바 차트
			const revenueCtx = document.getElementById('revenueChart')
					.getContext('2d');
			new Chart(revenueCtx, {
				type : 'bar',
				data : {
					labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
							'9월', '10월', '11월', '12월' ],
					datasets : [ {
						label : '플랫폼 수익 (₩)',
						data : [ 345000, 420000, 380000, 500000, 460000,
								530000, 480000, 510000, 495000, 520000, 475000,
								550000 ], // 나중에 삭제 요청 바랍니다.
						backgroundColor : '#4a6fa5'
					} ]
				},
				options : {
					responsive : true,
					maintainAspectRatio : true,
					scales : {
						y : {
							beginAtZero : true,
							ticks : {
								callback : function(value) {
									return '₩' + value.toLocaleString();
								}
							}
						}
					},
					plugins : {
						legend : {
							display : false
						},
						tooltip : {
							callbacks : {
								label : function(context) {
									return `₩${context.raw.toLocaleString()}`;
								}
							}
						}
					}
				}
			});
		});
	</script>

</body>
</html>
