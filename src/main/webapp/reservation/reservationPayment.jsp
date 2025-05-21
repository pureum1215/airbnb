<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>확인 및 결제</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white font-sans">

	<div>
		<%@ include file="header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

	<main class="max-w-6xl mx-auto px-6 py-10 grid md:grid-cols-3 gap-10">

	<form
		action="${pageContext.request.contextPath}/reservation_payment.re"
		method="post">
		
		<input type="hidden" id="paymentMethodInput" name="payment_method" />
				
		<!-- 좌측: 결제수단 -->
		<section class="md:col-span-2 space-y-8">
			<h1 class="text-3xl font-bold mb-6">확인 및 결제</h1>

			<!-- 결제 수단 -->
			<div>
				<h2 class="text-lg font-semibold mb-3">결제 수단</h2>
				<div class="relative">
					<button id="paymentToggle" type="button"
						class="w-full border rounded-lg p-4 flex justify-between items-center text-left">
						<div class="flex items-center space-x-2" id="selectedPayment">
							<img id="selectedPaymentIcon" class="w-6 h-6 hidden" src=""
								alt="" /> <span id="selectedPaymentText"
								class="text-sm text-gray-500">결제 수단 선택</span>
						</div>
						<svg xmlns="http://www.w3.org/2000/svg"
							class="w-5 h-5 text-gray-500" fill="none" viewBox="0 0 24 24"
							stroke="currentColor">
							<path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" d="M19 9l-7 7-7-7" />
						</svg>
					</button>

					<!-- 결제 옵션 목록 -->
					<div id="paymentOptions"
						class="absolute z-10 w-full border rounded-lg bg-white shadow-md mt-1 hidden">
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('신용카드 또는 체크카드', 'https://img.icons8.com/ios-filled/50/000000/bank-card-back-side.png', 'card')">
							<img
								src="https://img.icons8.com/ios-filled/50/000000/bank-card-back-side.png"
								class="w-6 h-6 mr-2" /> <span>신용카드 또는 체크카드</span>
						</div>
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('페이팔', 'https://img.icons8.com/color/48/000000/paypal.png', 'paypal')">
							<img src="https://img.icons8.com/color/48/000000/paypal.png"
								class="w-6 h-6 mr-2" /> <span>페이팔</span>
						</div>
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('Google Pay', 'https://img.icons8.com/color/48/000000/google-pay.png', 'google pay')">
							<img src="https://img.icons8.com/color/48/000000/google-pay.png"
								class="w-6 h-6 mr-2" /> <span>Google Pay</span>
						</div>
					</div>
				</div>
			</div>

			<br> <br> <br> <br> <br>


		<%-- servlet으로 보낼 값 --%>
		<input type="hidden" name="payment_method" id="paymentMethodInput" />
		<input type="hidden" name="reservation_id" value=<%=request.getAttribute("reservation_id")%>> 
		<input type="hidden" name="property_id" value="<%= request.getAttribute("property_id") %>">

		<button type="submit"
			class="bg-rose-600 hover:bg-rose-700 text-white font-semibold py-3 px-6 rounded-lg text-base">
			확인 및 결제</button>
	</form>
		</section>

		<!-- 우측: 숙소 요약 카드 -->
		<aside class="border rounded-xl p-5 shadow-md space-y-4 bg-white">
			<div class="flex space-x-4">
				<img
					src="https://dayoff.co.kr/whatsinmytrip/wp-content/uploads/2024/06/%EA%B0%95%EB%A6%89-%EC%88%99%EC%86%8C-%EC%B6%94%EC%B2%9C-%EB%A9%94%EC%9D%B8.webp"
					class="w-24 h-24 rounded-lg object-cover" alt="숙소">
				<div>
					<h2 class="font-semibold text-sm leading-snug">
						산이 감싸고 있는 마을숙소<br>“풀길스테이” 도고온천과 예산 시장 인접
					</h2>
					<p class="text-sm text-gray-500 mt-1">★ 4.93 (후기 110개) • 게스트 선호</p>
				</div>
			</div>

			<div class="text-sm text-gray-700">
				<p class="font-medium">취소 수수료 없음</p>
				<p>예약 후 48시간 이내에 취소하면 요금 전액이 환불됩니다.</p>
			</div>

			<div class="text-sm space-y-1">
				<div class="flex justify-between">
					<p class="font-semibold">여행 세부 정보</p>
					<button class="text-gray-600 underline text-sm">변경</button>
				</div>
				<p>2025년 6월 9일~14일</p>
			</div>

			<div class="text-sm space-y-1">
				<p class="font-semibold">요금 세부 정보</p>
				<div class="flex justify-between mt-1">
					<p>₩ 20,000 × 5박</p>
					<p>₩ 100,000</p>
				</div>
				<div class="flex justify-between">
					<p>에어비앤비 서비스 수수료(10%)</p>
					<p>₩ 10,000</p>
				</div>
			</div>

			<div class="flex justify-between border-t pt-3 font-bold text-base">
				<p>총액 KRW</p>
				<p>₩ 110,000</p>
			</div>

			<a href="#" class="text-sm underline text-gray-600 block">요금 상세
				내역</a>
		</aside>
	</main>

	<!-- 드롭다운 스크립트 -->
	<script>
	
		const toggle = document.getElementById("paymentToggle");
		const options = document.getElementById("paymentOptions");

		toggle.addEventListener("click", (event) => {
			options.classList.toggle("hidden");
		});

		function selectPayment(name, iconUrl, value) {
			const icon = document.getElementById("selectedPaymentIcon");
			const text = document.getElementById("selectedPaymentText");

			icon.src = iconUrl;
			icon.alt = name;
			icon.classList.remove("hidden");

			text.textContent = name;
			
			// 실제 저장할 값 설정
			document.getElementById("paymentMethodInput").value = value;

			options.classList.add("hidden");
		}
	</script>

</body>
</html>
