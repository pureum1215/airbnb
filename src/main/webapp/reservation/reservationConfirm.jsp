<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즉시 예약</title>
	<style>
		body .container {
			font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue",
				Helvetica, Arial, sans-serif;
			background-color: #fff;
			margin: 0;
			padding: 40px;
		}
		
		.container {
			max-width: 1100px;
			margin: 0 auto;
			display: flex;
			gap: 60px;
		}
		
		.left, .right {
			flex: 1;
		}
		
		h1 {
			font-size: 24px;
			font-weight: 600;
			margin-bottom: 24px;
		}
		
		.notice-box {
			background-color: #f7f7f7;
			border-radius: 12px;
			padding: 16px 20px;
			display: flex;
			align-items: center;
			justify-content: space-between;
			font-size: 15px;
			margin-bottom: 24px;
			border: 1px solid #ddd;
		}
		
		.info-group {
			margin-bottom: 24px;
		}
		
		.info-label {
			font-weight: bold;
			margin-bottom: 4px;
		}
		
		.info-content {
			font-size: 15px;
			margin-bottom: 8px;
		}
		
		.change-link {
			color: #222;
			font-size: 14px;
			text-decoration: underline;
			cursor: pointer;
			float: right;
		}
		
		.submit-btn {
			margin-top: 20px;
			width: 100%;
			padding: 14px;
			background-color: #FF385C;
			border: none;
			color: white;
			font-size: 16px;
			font-weight: bold;
			border-radius: 12px;
			cursor: pointer;
		}
		
		.submit-btn:hover {
			background-color: #e03150;
		}
		
		.summary-box {
			border: 1px solid #ddd;
			border-radius: 16px;
			padding: 20px;
		}
		
		.room-info {
			display: flex;
			gap: 12px;
			margin-bottom: 20px;
		}
		
		.room-info img {
			width: 80px;
			height: 80px;
			border-radius: 12px;
			object-fit: cover;
		}
		
		.room-details {
			font-size: 14px;
		}
		
		.price-breakdown {
			font-size: 15px;
		}
		
		.price-line {
			display: flex;
			justify-content: space-between;
			margin: 6px 0;
		}
		
		.price-total {
			border-top: 1px solid #ddd;
			padding-top: 10px;
			font-weight: bold;
			font-size: 16px;
		}
		
		.tooltip-box {
			position: absolute;
			background: #fff;
			border-radius: 12px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
			padding: 14px 18px;
			font-size: 14px;
			z-index: 100;
			display: none;
			max-width: 300px;
			line-height: 1.4;
			border: 1px solid #ddd;
		}
		
		.tooltip-close {
			position: absolute;
			top: 6px;
			left: 8px;
			background: none;
			border: none;
			font-size: 16px;
			cursor: pointer;
			color: #333;
		}
		
		.tooltip-trigger {
			cursor: pointer;
			text-decoration: underline;
			position: relative;
		}
	</style>
</head>
<body>
	<div>
		<%@ include file="reservationHeader.jsp"%>
		<!-- 정적 포함 -->
	</div>
	<br>

	<div class="container">
		<!-- 좌측 영역 -->
		<div class="left">
			<h1>즉시 예약</h1>

			<form action="${pageContext.request.contextPath}/reservation_confirm.re" method="post">
				<div class="notice-box">
					<span>흔치 않은 기회입니다. Catherine님의 숙소는 보통 예약이 가득 차 있습니다.</span> <span>💎</span>
				</div>
	
				<div class="info-group">
					<div class="info-label">
						날짜 <span class="change-link">수정</span>
					</div>
					<div class="info-content">10월 31일 ~ 11월 2일</div>
					
					
					<%-- 앞에서 받았던 값을 여기서 바로 적용되게 변경하기 기능 추가 필요 --%>
					<%-- servlet으로 보낼 값, 체크인, 체크아웃 날짜 --%>
					<input type="hidden" name="property_id" value="<%= request.getAttribute("property_id") %>">
					<input type="date" name="reservation_check_in" value="<%= request.getAttribute("reservation_check_in") %>" required>
					<input type="date" name="reservation_check_out" value="<%= request.getAttribute("reservation_check_out") %>" required>
					<input type="hidden" name="user_id" value="${sessionScope.user_id}">				
					
				</div>
	
				<div class="info-group">
					<div class="info-label">
						게스트 <span class="change-link">수정</span>
					</div>
					<div class="info-content">게스트 1명</div>
				</div>
					
				<button type="submit" class="submit-btn">즉시 예약</button>
			</form>
		</div>

		<!-- 우측 요금 영역 -->
		<div class="right">
			<div class="summary-box">
				<div class="room-info">
					<img
						src="https://www.agoda.com/wp-content/uploads/2019/04/Where-to-stay-in-Seoul-South-Korea-Shilla-Stay-Seocho.jpg"
						alt="숙소 이미지">
					<div class="room-details">
						<strong>파리 중심가에 위치한 로프트</strong><br> 공동 주택 전체<br> ★ 4.88
						(후기 312개) • 슈퍼호스트
					</div>
				</div>

				<div class="price-breakdown">
					<div class="price-line">
						<span>₩56,113 x 2박</span> <span>₩112,226</span>
					</div>
					<div class="price-line">
						<span> <span class="tooltip-trigger">청소비</span>
						</span> <span>₩14,081</span>
					</div>
					<div class="price-line">
						<span><span class="tooltip-trigger fee-tooltip-trigger">에어비앤비
								서비스 수수료</span></span> <span>₩19,138</span>
					</div>
					<div class="price-line">
						<span><span class="tooltip-trigger tax-tooltip-trigger">세금</span></span>
						<span>₩5,149</span>
					</div>
					<div class="price-line price-total">
						<span>총액 (KRW)</span> <span>₩149,716</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 툴팁 박스 -->
	<div class="tooltip-box" id="tooltipBox">
		<button class="tooltip-close" onclick="hideTooltip()">×</button>
		호스트가 청구하는 일회성 숙소 청소 비용입니다.
	</div>
	<!-- 에어비앤비 수수료 툴팁 -->
	<div class="tooltip-box" id="tooltipBoxFee">
		<button class="tooltip-close" onclick="hideTooltip('tooltipBoxFee')">×</button>
		수수료는 에어비앤비 플랫폼을 운영하고 연중무휴 고객 지원과 같은 다양한 서비스를 제공하는데 사용됩니다.
	</div>
	<!-- 세금 툴팁 -->
	<div class="tooltip-box" id="tooltipBoxTax">
		<button class="tooltip-close" onclick="hideTooltip('tooltipBoxTax')">×</button>
		숙박세, 부가가치세(VAT/GST) 등 숙박 관련 세금.<br> 여기에는 관광 수수료가 포함될 수 있습니다.<br>
		<br> Taxe Additionnelle Article L2531-18<br> Taxe
		Additionnelle Departementale<br> Taxe Additionnelle Regionale<br>
		Taxe de Sejour<br> <a href="#"
			style="color: #008489; text-decoration: underline;">자세히 알아보기</a>
	</div>

	<script>
	  const tooltipTrigger = document.querySelector(".tooltip-trigger");
	  const tooltipBox = document.getElementById("tooltipBox");
	  const taxTrigger = document.querySelector(".tax-tooltip-trigger");
	  const tooltipBoxTax = document.getElementById("tooltipBoxTax");
	
	  taxTrigger.addEventListener("click", (e) => {
	    positionTooltip(e.target, tooltipBoxTax);
	  });
	
	  tooltipTrigger.addEventListener("click", (e) => {
	    positionTooltip(e.target, tooltipBox);
	  });
	
	  const feeTrigger = document.querySelector(".fee-tooltip-trigger");
	  const tooltipBoxFee = document.getElementById("tooltipBoxFee");
	
	  feeTrigger.addEventListener("click", (e) => {
	    positionTooltip(e.target, tooltipBoxFee);
	  });
	
	  function positionTooltip(target, box) {
	    const rect = target.getBoundingClientRect();
	    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	    const tooltipHeight = box.offsetHeight;
	
	    box.style.left = rect.left + "px";
	    box.style.top = (rect.top + scrollTop - tooltipHeight - 8) + "px";
	    box.style.display = "block";
	  }
	
	  function hideTooltip(id) {
	    document.getElementById(id).style.display = "none";
	  }
	
	  window.addEventListener("click", function (e) {
	    if (
	      !tooltipBox.contains(e.target) &&
	      !tooltipTrigger.contains(e.target)
	    ) {
	      tooltipBox.style.display = "none";
	    }
	
	    if (
	      !tooltipBoxFee.contains(e.target) &&
	      !feeTrigger.contains(e.target)
	    ) {
	      tooltipBoxFee.style.display = "none";
	    }
	    
	    if (
	    	    !tooltipBoxTax.contains(e.target) &&
	    	    !taxTrigger.contains(e.target)
	    	  ) {
	    	    tooltipBoxTax.style.display = "none";
	    	  }
	  });
</script>
</body>
</html>