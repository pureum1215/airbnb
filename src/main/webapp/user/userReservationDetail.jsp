<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>예약 상세</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased">
	<div>
		<%@ include file="../html/header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>


  <main class="max-w-6xl mx-auto px-6 py-12 grid md:grid-cols-2 gap-8">

    <!-- 왼쪽: 예약 정보 -->
    <section class="space-y-6">
      <!-- 날짜 정보 -->
      <div class="border rounded-xl p-4 shadow-sm">
        <div class="grid grid-cols-2 text-center text-sm font-medium">
          <div>
            <p class="text-gray-500">체크인</p>
            <p class="text-black mt-1">9월 11일 (월)</p>
            <p class="text-xs text-gray-400">오후 4:00</p>
          </div>
          <div>
            <p class="text-gray-500">체크아웃</p>
            <p class="text-black mt-1">9월 15일 (금)</p>
            <p class="text-xs text-gray-400">오전 11:00</p>
          </div>
        </div>
      </div>

      <!-- 예약 상세 정보 -->
      <div class="border rounded-xl p-4 shadow-sm text-sm space-y-4">
        <div>
          <p class="text-gray-500">게스트</p>
          <p class="font-medium">게스트 6명</p>
        </div>
        <div>
          <p class="text-gray-500">예약 번호</p>
          <p class="font-medium">HNXJAW282Z</p>
        </div>
      </div>

      <!-- 결제 정보 -->
      <div class="border rounded-xl p-4 shadow-sm text-sm">
        <p class="text-gray-500">결제 세부 정보</p>
        <p class="font-medium">총 비용:</p>
        <a href="#" class="text-sm text-blue-500 hover:underline mt-1 inline-block">영수증 보기</a>
      </div>
    </section>

    <!-- 오른쪽: 숙소 상세 카드 -->
    <section class="space-y-4">
      <div class="border rounded-xl overflow-hidden shadow-sm">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg" alt="숙소 이미지" class="w-full h-52 object-cover" />
        <div class="p-4 space-y-1 text-sm">
          <h2 class="text-lg font-semibold">Naniwa Ward의 숙소</h2>
          <p class="text-gray-600">한국 Yesan-gun</p>
          <p class="text-gray-500">79km 거리 · 6월 9일~14일</p>
          <p class="text-gray-700 truncate">게스트 한마디 “조용하고 인테리어가 좋았습니다”</p>
          <p class="font-semibold mt-1">₩23,374 /박</p>
        </div>
      </div>

      <!-- 호스트 정보 -->
      <div class="border rounded-xl p-4 shadow-sm text-sm space-y-3">
        <p class="font-medium">호스트: Toshiko 님</p>
        <div class="flex items-center gap-2">
          <img src="https://randomuser.me/api/portraits/women/1.jpg" class="w-8 h-8 rounded-full" />
          <p class="text-gray-600 text-sm">일본, 오사카 거주. 게스트 응대에 친절하고 빠른 피드백을 주셨습니다.</p>
        </div>
      </div>

      <!-- 후기 작성 -->
      <div class="border rounded-xl p-4 shadow-sm text-sm">
        <p class="mb-2 font-medium">후기가 제출되었습니다.</p>
        <div class="flex gap-1">
          <span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
        </div>
      </div>
    </section>
  </main>
</body>
</html>
