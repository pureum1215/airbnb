<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Airbnb 스타일 헤더 -->
<header class="w-full border-b">
	<!-- Google Fonts: Noto Sans KR -->
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
		rel="stylesheet">
	<div class="w-full px-7 py-4 flex justify-between items-center">

		<!-- 왼쪽 로고 -->
		<div class="flex items-center space-x-2 flex-shrink-0">
			<img
				src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png"
				alt="airbnb logo" class="w-6 h-6"> <span
				class="text-red-500 font-bold text-lg">airbnb</span>
		</div>

		<!-- 가운데 메뉴 -->
		<nav class="relative font-sans">
  <ul id="menuList" class="flex space-x-2 text-sm text-gray-700">
    
    <!-- 일반 메뉴 버튼 -->
    <li>
      <button class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
        달력
      </button>
    </li>
    <li>
      <button class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
        리스팅
      </button>
    </li>
    <li>
      <button class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
        예약목록
      </button>
    </li>

    <!-- "메뉴" 버튼과 드롭다운 -->
    <li class="relative group">
      <button id="menuToggle"
        class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium flex items-center space-x-1">
        <span>메뉴</span>
        <span class="text-xs">⌄</span>
      </button>
      <ul
        class="absolute left-0 mt-2 w-24 bg-white border rounded shadow-lg hidden group-hover:block z-10 text-sm">
        <li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">프로필</a></li>
        <li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">통계</a></li>
      </ul>
    </li>

  </ul>
</nav>

		<!-- 오른쪽 메뉴 -->
		<div class="flex items-center space-x-4 text-sm">
			<button
				class="border p-1.5 px-3 rounded-full flex items-center space-x-2">
				<span class="text-lg">☰</span> <span
					class="bg-gray-400 text-white rounded-full w-6 h-6 text-xs flex items-center justify-center"></span>
			</button>
		</div>
	</div>
</header>

<!-- 선택 효과 스크립트 -->
<script>
  // Tailwind 설정 (폰트 적용)
  tailwind.config = {
    theme: {
      extend: {
        fontFamily: {
          sans: ['"Noto Sans KR"', 'sans-serif']
        }
      }
    }
  }

  document.addEventListener("DOMContentLoaded", function () {
    const menuItems = document.querySelectorAll('.menu-item');
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    const menuToggle = document.getElementById('menuToggle');

    function highlightMenu(target) {
      // 모든 메뉴 스타일 초기화
      menuItems.forEach(el => {
        el.classList.remove('font-bold', 'border-2', 'border-black', 'bg-white');
      });

      // 강조 스타일 추가
      target.classList.add('font-bold', 'border-2', 'border-black', 'bg-white');
    }

    menuItems.forEach(item => {
      item.addEventListener('click', function () {
        highlightMenu(this);
      });
    });

    dropdownItems.forEach(item => {
      item.addEventListener('click', function () {
        highlightMenu(menuToggle);
      });
    });
  });
</script>
