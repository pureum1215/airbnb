<%@page import="userPage.userProfile.UserProfileVO"%>
<%@page import="userPage.userProfile.UserProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.time.*, java.time.format.*, java.time.temporal.ChronoUnit, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>게스트 프로필</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white font-sans antialiased text-gray-900">

	<div>
		<%@ include file="header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

	<%
	String userId = "user001";// 예시
	UserProfileDAO dao = new UserProfileDAO();
	UserProfileVO upNCvo = dao.profileNC(userId); //user name created_at
	
	%>
		<%
		// 2. 포맷터 설정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		// 3. 문자열 → LocalDateTime
		LocalDateTime pastDateTime = LocalDateTime.parse(upNCvo.getUser_created_at(), formatter);
		LocalDateTime now = LocalDateTime.now();
		
		// 4. 년, 월, 일 차이 계산
		long totalYears = pastDateTime.until(now, ChronoUnit.YEARS);
		long totalMonths = pastDateTime.until(now, ChronoUnit.MONTHS);
		long remainMonths = totalMonths - (totalYears * 12);
		%>
	<main class="max-w-6xl mx-auto px-6 py-10 grid md:grid-cols-3 gap-10">

		<!-- 좌측 프로필 요약 -->
		<aside class="md:col-span-1">
			<div class="bg-white border rounded-xl p-6 shadow-sm text-center">
				<div
					class="w-24 h-24 mx-auto rounded-full bg-black text-white text-4xl flex items-center justify-center font-bold">
					<%=upNCvo.getUser_name() %></div>
				<h2 class="text-lg font-semibold mt-3"><%=upNCvo.getUser_name() %></h2>
				<p class="text-sm text-gray-500">게스트</p>

				<div class="mt-4 space-y-1 text-sm text-gray-700">
					<p>
						후기 <span class="font-semibold">1개</span>
					</p>
					<p>
						에어비앤비 가입 기간 <span class="font-semibold"><%=totalYears %>년 <%=remainMonths %>개월</span>
					</p>
				</div>
			</div>
		</aside>

		<!-- 우측 프로필 본문 -->
		<section class="md:col-span-2 space-y-6">

			<!-- 프로필 소개 -->
			<div>
				<h1 class="text-2xl font-bold"><%=upNCvo.getUser_name()%> 님 소개</h1>
				<button
					class="mt-2 text-sm font-medium border px-4 py-2 rounded-md hover:bg-gray-50">프로필
					수정하기</button>
			</div>

			<!-- 후기 목록 -->
			<div>
				<h2 class="text-xl font-semibold mb-3">푸름 님에 대한 호스트의 후기</h2>

				<!-- 후기 목록 -->
				<div id="reviewList" class="space-y-6">
					<!-- 후기 1 -->
					<div class="border rounded-xl p-4">
						<p class="text-sm">“푸름 그리고 그녀의 일행은 방을 깨끗하게 청소하고 숙소 이용규칙을
							존중했습니다. 체크인 시 연락을 주셨는데 매우 도움이 되었습니다.”</p>
						<div class="flex items-center mt-3 text-sm text-gray-600">
							<img src="https://randomuser.me/api/portraits/women/1.jpg"
								class="w-6 h-6 rounded-full mr-2" /> <span>Toshiko ·
								2023년 9월</span>
						</div>
					</div>

					<!-- 후기 2 -->
					<div class="border rounded-xl p-4">
						<p class="text-sm">“정말 예의 바른 게스트였습니다. 집을 깨끗하게 사용해주셔서 감사드려요.”</p>
						<div class="flex items-center mt-3 text-sm text-gray-600">
							<img src="https://randomuser.me/api/portraits/men/2.jpg"
								class="w-6 h-6 rounded-full mr-2" /> <span>David · 2022년
								12월</span>
						</div>
					</div>

					<!-- 숨겨진 후기 -->
					<div id="moreReviews" class="hidden space-y-6">
						<!-- 후기 3 -->
						<div class="border rounded-xl p-4">
							<p class="text-sm">“훌륭한 커뮤니케이션과 시간 엄수! 언제든지 다시 모시고 싶습니다.”</p>
							<div class="flex items-center mt-3 text-sm text-gray-600">
								<img src="https://randomuser.me/api/portraits/men/3.jpg"
									class="w-6 h-6 rounded-full mr-2" /> <span>Alex · 2022년
									6월</span>
							</div>
						</div>

						<!-- 후기 4 -->
						<div class="border rounded-xl p-4">
							<p class="text-sm">“좋은 에너지의 게스트였어요. 체크인과 체크아웃 모두 원활했습니다.”</p>
							<div class="flex items-center mt-3 text-sm text-gray-600">
								<img src="https://randomuser.me/api/portraits/women/4.jpg"
									class="w-6 h-6 rounded-full mr-2" /> <span>Sara · 2021년
									11월</span>
							</div>
						</div>
					</div>
				</div>

				<!-- 후기 더보기 버튼 -->
				<button id="showMoreBtn"
					class="mt-4 text-sm font-medium underline text-gray-700 hover:text-black">
					후기 더보기</button>

				<!-- 내가 작성한 후기 -->
				<div class="mt-10">
					<h2 class="text-xl font-semibold mb-3">내가 작성한 후기</h2>

					<div class="space-y-6">
						<!-- 내가 쓴 후기 1 -->
						<div class="border rounded-xl p-4">
							<p class="text-sm">“호스트가 정말 친절하고 응답이 빨랐어요. 숙소도 사진보다 훨씬
								좋았습니다!”</p>
							<div class="flex items-center mt-3 text-sm text-gray-600">
								<img src="https://randomuser.me/api/portraits/men/5.jpg"
									class="w-6 h-6 rounded-full mr-2" /> <span>호스트: John ·
									2024년 2월</span>
							</div>
						</div>

						<!-- 내가 쓴 후기 2 -->
						<div class="border rounded-xl p-4">
							<p class="text-sm">“깨끗하고 조용한 숙소였어요. 위치도 좋고 다음에도 꼭 다시 예약하고
								싶어요.”</p>
							<div class="flex items-center mt-3 text-sm text-gray-600">
								<img src="https://randomuser.me/api/portraits/women/6.jpg"
									class="w-6 h-6 rounded-full mr-2" /> <span>호스트: Emily ·
									2023년 8월</span>
							</div>
						</div>
					</div>
					<button id="showMoreBtn"
						class="mt-4 text-sm font-medium underline text-gray-700 hover:text-black">
						후기 더보기</button>
				</div>

			</div>

		</section>
	</main>

	<!-- 후기 더보기 스크립트 -->
	<script>
		document.getElementById("showMoreBtn").addEventListener("click",
				function() {
					const moreReviews = document.getElementById("moreReviews");
					moreReviews.classList.toggle("hidden");

					if (moreReviews.classList.contains("hidden")) {
						this.textContent = "후기 더보기";
					} else {
						this.textContent = "접기";
					}
				});
	</script>
</body>
</html>
