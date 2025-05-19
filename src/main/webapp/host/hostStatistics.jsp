<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>호스팅 수입 | 호스트 통계</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
	color: #222;
}

.container {
	display: flex;
	max-width: 1400px;
	margin: 40px auto;
	padding: 0 20px;
	gap: 40px;
}

.left-panel {
	flex: 2;
}

.right-panel {
	flex: 1;
}

.title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 20px;
}

.income-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}

.income-value {
	font-size: 40px;
	color: #222;
	margin-bottom: 20px;
}

.month-buttons {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	margin-bottom: 30px;
}

.month-buttons button {
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	background-color: white;
	cursor: pointer;
	transition: background-color 0.2s;
}

.month-buttons button:hover {
	background-color: #f0f0f0;
}

.chart-container {
	background: #fafafa;
	border-radius: 16px;
	padding: 20px;
}

canvas {
	max-width: 100%;
}

.summary-card-fixed {
	position: fixed;
	top: 160px;
	right: 80px;
	width: 280px;
	border: 1px solid #e4e4e4;
	border-radius: 12px;
	padding: 20px;
	background-color: white;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	z-index: 1000;
}

.summary-title {
	font-size: 17px;
	font-weight: bold;
	margin-bottom: 6px;
}

.summary-period {
	font-size: 13px;
	color: #717171;
	margin-bottom: 20px;
}

.summary-item {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	padding: 8px 0;
}

.summary-divider {
	height: 1px;
	background-color: #e4e4e4;
	margin: 12px 0;
}

.summary-item.total {
	font-weight: bold;
}

.stat-grid {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.stat-card {
	flex: 1;
	min-width: 200px;
	background-color: #fafafa;
	border-radius: 16px;
	padding: 20px 24px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.stat-title {
	font-size: 16px;
	color: #555;
	margin-bottom: 10px;
}

.stat-value {
	font-size: 28px;
	font-weight: bold;
	color: #222;
}
</style>
</head>
<body>

	<%@ include file="header_hostpage.jsp"%>

	<div class="container">
		<div class="left-panel">
			<div class="title">호스팅 수입</div>

			<div class="income-title">이번 달 수입</div>
			<div class="income-value" id="monthlyIncome">₩0</div>

			<!-- 월별 버튼 -->
			<div class="month-buttons">
				<%
				for (int i = 1; i <= 12; i++) {
				%>
				<button onclick="updateIncome(<%=i - 1%>)"><%=i%>월
				</button>
				<%
				}
				%>
			</div>

			<div class="chart-container">
				<canvas id="incomeChart" height="200"></canvas>
			</div>

			<div style="margin-top: 60px;">
				<div class="stat-grid">
					<div class="stat-card">
						<div class="stat-title">평균 평점</div>
						<div class="stat-value">5.0</div>
					</div>
					<div class="stat-card">
						<div class="stat-title">평균 숙박일수</div>
						<div class="stat-value">3.2일</div>
					</div>
				</div>
			</div>
		</div>

		<div class="right-panel">
			<div class="summary-card-fixed">
				<div class="summary-title">올해 현재까지 요약</div>
				<div class="summary-period">2025년 1월 1일 ~ 5월 19일</div>

				<div class="summary-item">
					<span>총수입</span> <span id="sum-total">₩0</span>
				</div>
				<div class="summary-item">
					<span>수령 대금 조정</span> <span id="adjustment">₩0</span>
				</div>
				<div class="summary-item">
					<span>에어비앤비 서비스 수수료</span> <span id="fee">₩0</span>
				</div>
				<div class="summary-item">
					<span>세금 원천징수</span> <span id="tax">₩0</span>
				</div>

				<div class="summary-divider"></div>

				<div class="summary-item total">
					<span>총액(₩)</span> <span id="final">₩0</span>
				</div>
			</div>
		</div>
	</div>

	<script>
  const incomeData = [135000, 88000, 150000, 170000, 142000, 158000, 190000, 175000, 160000, 185000, 120000, 98000];
  const incomeLabels = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

  const ctx = document.getElementById('incomeChart').getContext('2d');
  const incomeChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: incomeLabels,
      datasets: [{
        label: '월별 수입',
        data: incomeData,
        fill: false,
        borderColor: '#FF385C',
        tension: 0.3,
        pointBackgroundColor: '#FF385C',
        pointRadius: 5,
        pointHoverRadius: 7
      }]
    },
    options: {
      responsive: true,
      plugins: { legend: { display: false } },
      onClick: (e) => {
        const points = incomeChart.getElementsAtEventForMode(e, 'nearest', { intersect: true }, true);
        if (points.length) updateIncome(points[0].index);
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            callback: function(value) {
              return '₩' + value.toLocaleString();
            }
          }
        }
      }
    }
  });

  function formatKRW(num) {
    return '₩' + Math.round(num).toLocaleString();
  }

  function updateIncome(index) {
	  const amount = incomeData[index];
	  document.getElementById('monthlyIncome').textContent = formatKRW(amount);
	  document.querySelector('.income-title').textContent = incomeLabels[index] + ' 수입';
	}

//요약 정보 반영
  document.addEventListener('DOMContentLoaded', () => {
    const janToMay = incomeData.slice(0, 5);
    const totalIncome = janToMay.reduce((a, b) => a + b, 0);
    const adjustment = 30000;
    const serviceFee = totalIncome * 0.03;
    const tax = totalIncome * 0.05;
    const final = totalIncome + adjustment - serviceFee - tax;

    document.getElementById('sum-total').textContent = formatKRW(totalIncome);
    document.getElementById('adjustment').textContent = formatKRW(adjustment);
    document.getElementById('fee').textContent = formatKRW(serviceFee);
    document.getElementById('tax').textContent = formatKRW(tax);
    document.getElementById('final').textContent = formatKRW(final);

    // ⬇️ 초기 표시: 5월 수입
    document.querySelector('.income-title').textContent = incomeLabels[4] + ' 수입';
    document.getElementById('monthlyIncome').textContent = formatKRW(incomeData[4]);
  });
</script>

</body>
</html>
