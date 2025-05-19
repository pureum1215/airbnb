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

		<!-- 좌측: 결제수단 -->
		<section class="md:col-span-2 space-y-8">
			<h1 class="text-3xl font-bold mb-6">확인 및 결제</h1>

			<!-- 결제 수단 -->
			<div>
				<h2 class="text-lg font-semibold mb-3">결제 수단</h2>
				<div class="relative">
					<button id="paymentToggle"
						class="w-full border rounded-lg p-4 flex justify-between items-center text-left">
						<div class="flex items-center space-x-2" id="selectedPayment">
							<span class="text-sm text-gray-500">결제 수단 선택</span>
						</div>
						<span class="text-xl">⌄</span>
					</button>

					<!-- 결제 옵션 목록 -->
					<div id="paymentOptions"
						class="absolute z-10 w-full border rounded-lg bg-white shadow-md mt-1 hidden">
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('신용카드', 'https://img.icons8.com/ios/50/000000/bank-card-back-side.png')">
							<img
								src="https://img.icons8.com/ios/50/000000/bank-card-back-side.png"
								class="w-6 h-6 mr-2" /> <span>신용카드 또는 체크카드</span>
						</div>
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('페이팔', 'https://img.icons8.com/color/48/000000/paypal.png')">
							<img src="https://img.icons8.com/color/48/000000/paypal.png"
								class="w-6 h-6 mr-2" /> <span>페이팔</span>
						</div>
						<div
							class="hover:bg-gray-100 px-4 py-3 flex items-center cursor-pointer"
							onclick="selectPayment('Google Pay', 'https://img.icons8.com/color/48/000000/google-pay-india.png')">
							<img
								src="https://img.icons8.com/color/48/000000/google-pay-india.png"
								class="w-6 h-6 mr-2" /> <span>Google Pay</span>
						</div>
					</div>
				</div>
			</div>

			<!-- 결제 버튼 -->
			<br> <br> <br> <br> <br>
			<form action="${pageContext.request.contextPath}/reservation_payment.re" method="post">
				
				<!-- 숨겨진 값들 (서블릿으로 보내야 할 값들) -->
				<input type="hidden" name="reservation_id" value=<%=request.getParameter("reservation_id")%>>
				<input type="hidden" name="user_id" value="${sessionScope.user_id}">
			
				<!-- 결제 버튼 -->
				<button type="submit"
					class="w-full bg-rose-600 hover:bg-rose-700 text-white font-semibold py-3 rounded-lg text-lg">
					확인 및 결제
				</button>
			</form>
		</section>

		<!-- 우측: 숙소 요약 카드 -->
		<aside class="border rounded-xl p-5 shadow-md space-y-4 bg-white">
			<!-- 숙소 요약 -->
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

			<!-- 취소 정책 -->
			<div class="text-sm text-gray-700">
				<p class="font-medium">취소 수수료 없음</p>
				<p>예약 후 48시간 이내에 취소하면 요금 전액이 환불됩니다.</p>
			</div>

			<!-- 여행 정보 -->
			<div class="text-sm space-y-1">
				<div class="flex justify-between">
					<p class="font-semibold">여행 세부 정보</p>
					<button class="text-gray-600 underline text-sm">변경</button>
				</div>
				<p>2025년 6월 9일~14일</p>
				<p>성인 1명</p>
			</div>

			<!-- 요금 정보 -->
			<div class="text-sm space-y-1">
				<p class="font-semibold">요금 세부 정보</p>
				<div class="flex justify-between mt-1">
					<p>¥ 21,347 × 5박</p>
					<p>¥ 106,733</p>
				</div>
				<div class="flex justify-between text-green-600">
					<p>장기 숙박 할인</p>
					<p>− ¥ 5,335</p>
				</div>
				<div class="flex justify-between">
					<p>에어비앤비 서비스 수수료</p>
					<p>¥ 17,019</p>
				</div>
			</div>

			<!-- 총액 -->
			<div class="flex justify-between border-t pt-3 font-bold text-base">
				<p>총액 JPY</p>
				<p>¥ 118,417</p>
			</div>

			<a href="#" class="text-sm underline text-gray-600 block">요금 상세
				내역</a>
		</aside>
	</main>

	<!-- 드롭다운 스크립트 -->
	<script>
    const toggle = document.getElementById("paymentToggle");
    const options = document.getElementById("paymentOptions");
    const selected = document.getElementById("selectedPayment");

    toggle.addEventListener("click", () => {
        options.classList.toggle("hidden");
    });

    function selectPayment(name, iconUrl, detail = "") {
        selected.innerHTML = `
            <img src="${iconUrl}" class="w-6 h-6"/>
            <span class="text-sm">${detail ? detail : name}</span>
        `;
        options.classList.add("hidden");
    }
</script>

</body>
</html>
