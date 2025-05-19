<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>위시리스트</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased">

	<div>
		<%@ include file="../html/header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="max-w-7xl mx-auto px-6 py-10 space-y-6">
    <!-- 위시리스트 제목 -->
    <h1 class="text-2xl font-bold">위시리스트</h1>

    <!-- 카드 리스트 -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
      <%-- 임시 카드1 --%>
      <div class="border rounded-2xl overflow-hidden shadow-sm">
        <div class="relative">
          <img src="https://static.hubzum.zumst.com/hubzum/2023/12/18/14/9c73367c393e4a55b922c457a7574ee9.jpg" alt="숙소 이미지" class="w-full h-48 object-cover" />
          <div class="absolute top-2 left-2 bg-white text-xs font-medium px-2 py-1 rounded-full shadow">게스트 선호</div>
          <div class="absolute top-2 right-2">
            <svg class="w-6 h-6 text-red-500 fill-current" viewBox="0 0 24 24">
              <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 
              6.5 3.5 5 5.5 5c1.54 0 3.04.99 
              3.57 2.36h1.87C13.46 5.99 14.96 5 
              16.5 5 18.5 5 20 6.5 20 8.5c0 
              3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
            </svg>
          </div>
        </div>
        <div class="p-4 space-y-1 text-sm">
          <h2 class="font-semibold truncate">Vredehoek의 로프트</h2>
          <p class="text-gray-600 text-sm truncate">전용 수영장과 대형 창문을 갖춘 세련된 집</p>
          <p class="text-gray-500 text-xs">퀸사이즈 침대 1개</p>
          <p class="text-gray-500 text-xs">5박 · 7월 5일~10일</p>
          <p class="font-semibold text-sm mt-1">₩ 17,176 /박 · 총액 ₩ 85,879</p>
          <p class="text-sm text-gray-700">★ 4.86</p>
        </div>
      </div>

      <%-- 임시 카드1 --%>
      <div class="border rounded-2xl overflow-hidden shadow-sm">
        <div class="relative">
          <img src="https://static.hubzum.zumst.com/hubzum/2023/12/18/14/9c73367c393e4a55b922c457a7574ee9.jpg" alt="숙소 이미지" class="w-full h-48 object-cover" />
          <div class="absolute top-2 left-2 bg-white text-xs font-medium px-2 py-1 rounded-full shadow">게스트 선호</div>
          <div class="absolute top-2 right-2">
            <svg class="w-6 h-6 text-red-500 fill-current" viewBox="0 0 24 24">
              <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 
              6.5 3.5 5 5.5 5c1.54 0 3.04.99 
              3.57 2.36h1.87C13.46 5.99 14.96 5 
              16.5 5 18.5 5 20 6.5 20 8.5c0 
              3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
            </svg>
          </div>
        </div>
        <div class="p-4 space-y-1 text-sm">
          <h2 class="font-semibold truncate">Vredehoek의 로프트</h2>
          <p class="text-gray-600 text-sm truncate">전용 수영장과 대형 창문을 갖춘 세련된 집</p>
          <p class="text-gray-500 text-xs">퀸사이즈 침대 1개</p>
          <p class="text-gray-500 text-xs">5박 · 7월 5일~10일</p>
          <p class="font-semibold text-sm mt-1">₩ 17,176 /박 · 총액 ₩ 85,879</p>
          <p class="text-sm text-gray-700">★ 4.86</p>
        </div>
      </div>
      
      <%-- 임시 카드1 --%>
      <div class="border rounded-2xl overflow-hidden shadow-sm">
        <div class="relative">
          <img src="https://static.hubzum.zumst.com/hubzum/2023/12/18/14/9c73367c393e4a55b922c457a7574ee9.jpg" alt="숙소 이미지" class="w-full h-48 object-cover" />
          <div class="absolute top-2 left-2 bg-white text-xs font-medium px-2 py-1 rounded-full shadow">게스트 선호</div>
          <div class="absolute top-2 right-2">
            <svg class="w-6 h-6 text-red-500 fill-current" viewBox="0 0 24 24">
              <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 
              6.5 3.5 5 5.5 5c1.54 0 3.04.99 
              3.57 2.36h1.87C13.46 5.99 14.96 5 
              16.5 5 18.5 5 20 6.5 20 8.5c0 
              3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
            </svg>
          </div>
        </div>
        <div class="p-4 space-y-1 text-sm">
          <h2 class="font-semibold truncate">Vredehoek의 로프트</h2>
          <p class="text-gray-600 text-sm truncate">전용 수영장과 대형 창문을 갖춘 세련된 집</p>
          <p class="text-gray-500 text-xs">퀸사이즈 침대 1개</p>
          <p class="text-gray-500 text-xs">5박 · 7월 5일~10일</p>
          <p class="font-semibold text-sm mt-1">₩ 17,176 /박 · 총액 ₩ 85,879</p>
          <p class="text-sm text-gray-700">★ 4.86</p>
        </div>
      </div>
    </div>
  </main>
</body>
</html>
