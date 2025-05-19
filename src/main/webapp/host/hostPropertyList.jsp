<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostPropoertyList</title>
</head>
<body>
	<div>
		<%@ include file="header_hostpage.jsp"%> 
		<!-- 정적 포함 -->
	</div>

	<!-- 리스팅 페이지 본문 -->
	<main class="px-12 py-8 font-sans">
		<!-- 상단 제목 및 버튼 -->
		<div class="flex justify-between items-center mb-8">
			<h1 class="text-3xl font-bold">리스팅</h1>
			<div class="flex space-x-3">
				<!-- 보기 모드 전환 버튼 -->
				<button id="toggleViewBtn"
					class="w-9 h-9 rounded-full border border-gray-300 flex items-center justify-center hover:bg-gray-100">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-black"
						fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round"
							stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16" />
				</svg>
				</button>

				<!-- 숙소 추가 버튼 -->
				<button
					class="w-9 h-9 rounded-full bg-gray-100 flex items-center justify-center hover:bg-gray-200"
					onclick="location.href='/listing/new'">
					<svg xmlns="http://www.w3.org/2000/svg"
						class="h-5 w-5 text-gray-800" fill="none" viewBox="0 0 24 24"
						stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round"
							stroke-width="2" d="M12 4v16m8-8H4" />
				</svg>
				</button>
			</div>
		</div>

		<!-- 🟨 리스트 뷰 -->
		<div id="listView" class="hidden">
			<table class="min-w-full text-sm text-left border-t">
				<thead>
					<tr class="border-b text-gray-700 font-semibold">
						<th class="py-3 px-2">숙소</th>
						<th class="py-3 px-2">유형</th>
						<th class="py-3 px-2">위치</th>
						<th class="py-3 px-2">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr class="border-b hover:bg-gray-50">
						<td class="py-3 px-2 flex items-center space-x-3"><img
							class="w-14 h-14 object-cover rounded-xl"
							src="https://modo-phinf.pstatic.net/20160324_63/1458757863703eouuM_JPEG/mosa320fGQ.jpeg?type=w720"
							alt="숙소 이미지"> <span class="font-medium">기흥기흥</span></td>
						<td class="py-3 px-2 text-gray-600">숙소</td>
						<td class="py-3 px-2 text-gray-600">Yongin-si, Gyeonggi-do</td>
						<!-- 이 부분은 필요 없을 시 삭제 가능 -->
						<td class="py-3 px-2"><span class="text-orange-600 font-medium text-sm">● 진행 중</span></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 🟩 그리드 뷰 -->
		<div id="gridView"
			class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
			<!-- 카드 1 -->
			<div
				class="rounded-2xl overflow-hidden shadow-sm hover:shadow-md transition border cursor-pointer">
				<div class="relative">
					<img class="w-full h-60 object-cover"
						src="https://modo-phinf.pstatic.net/20160324_63/1458757863703eouuM_JPEG/mosa320fGQ.jpeg?type=w720"
						alt="listing image">
						<!-- 이 부분은 필요 없을 시 삭제 가능 --> 
						<span class="absolute top-2 left-2 bg-white text-sm font-medium rounded-full px-3 py-1 shadow text-orange-600">● 진행 중 </span>
				</div>
				<div class="px-4 py-3">
					<h2 class="font-medium text-base truncate">기흥기흥</h2>
					<p class="text-sm text-gray-500 truncate">Yongin-si,
						Gyeonggi-do</p>
				</div>
			</div>
		</div>
	</main>

	<!-- ✅ 보기 모드 전환 스크립트 -->
	<script>
		let isGridView = true;

		document.getElementById("toggleViewBtn").addEventListener("click",
				function() {
					isGridView = !isGridView;

					const grid = document.getElementById("gridView");
					const list = document.getElementById("listView");

					if (isGridView) {
						grid.classList.remove("hidden");
						list.classList.add("hidden");
					} else {
						grid.classList.add("hidden");
						list.classList.remove("hidden");
					}
				});
	</script>

</body>
</html>