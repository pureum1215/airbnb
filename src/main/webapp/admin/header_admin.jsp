<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Airbnb 스타일 헤더 (배경색 #2C3E50로 변경) -->
<header class="w-full border-b fixed top-0 left-0 z-50 text-white" style="background-color: #2C3E50;">
  <div class="w-full px-7 py-4 flex justify-between items-center">
    <!-- 왼쪽 로고 -->
    <div class="flex items-center space-x-2">
      <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png" alt="airbnb logo" class="w-6 h-6">
      <span class="font-bold text-lg text-white">airbnb</span>
    </div>
    
    <!-- 오른쪽 메뉴 -->
    <div class="flex items-center space-x-4 text-sm">
      <a href="#" class="hover:underline text-white">홈페이지로 이동</a>
      <button class="border border-white p-1.5 px-3 rounded-full flex items-center space-x-2">
        <span class="text-lg text-white">☰</span>
        <span class="bg-gray-200 text-black rounded-full w-6 h-6 text-xs flex items-center justify-center"></span>
      </button>
    </div>
  </div>
</header>
