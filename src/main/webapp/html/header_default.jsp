<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Airbnb 스타일 헤더 -->
<header class="w-full border-b">
  <div class="w-full px-7 py-4 flex justify-between items-center">
    <!-- 왼쪽 로고 -->
    <div class="flex items-center space-x-2">
      <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png" alt="airbnb logo" class="w-6 h-6">
      <span class="text-red-500 font-bold text-lg">airbnb</span>
    </div>

    <!-- 오른쪽 메뉴 -->
    <div class="flex items-center space-x-4 text-sm">
      <a href="#" class="hover:underline">호스트 모드로 전환</a>
      <button class="border p-2 rounded-full text-xs">🌐</button>
      <button class="border p-1.5 px-3 rounded-full flex items-center space-x-2">
        <span class="text-lg">☰</span>
        <span class="bg-gray-400 text-white rounded-full w-6 h-6 text-xs flex items-center justify-center"></span>
      </button>
    </div>
  </div>
</header>
