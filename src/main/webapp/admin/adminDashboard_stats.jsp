<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDashboard_stats</title>
<style>
/* 전체 바디 기본 설정 */
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
</head>
<body>
<!-- Chart.js 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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