<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>이전 여행</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased">

	<div>
		<%@ include file="header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="max-w-4xl mx-auto px-6 py-12">
    <h1 class="text-2xl font-bold mb-8">이전 여행</h1>

    <div class="space-y-8">
      
      <!-- 여행 항목 1 -->
      <div class="flex items-center gap-4">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />
        <div>
          <h2 class="text-lg font-semibold">Nanikei World</h2>
          <p class="text-sm text-gray-600">도쿄, 일본</p>
          <p class="text-sm text-gray-500">2023년 9월 11일 ~ 9월 15일</p>
        </div>
      </div>

      <!-- 여행 항목 2 -->
      <div class="flex items-center gap-4">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10249_2656.jpg" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />
        <div>
          <h2 class="text-lg font-semibold">Paju Stay</h2>
          <p class="text-sm text-gray-600">파주시, 경기도</p>
          <p class="text-sm text-gray-500">2022년 7월 12일 ~ 7월 15일</p>
        </div>
      </div>

    </div>
  </main>
</body>
</html>
