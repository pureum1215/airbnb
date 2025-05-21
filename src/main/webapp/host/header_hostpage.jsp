<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostpage_header</title>
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
					<button id="header_calendar"
						class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
						달력</button>
				</li>
				<li>
					<button id="header_listing"
						class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
						리스팅</button>
				</li>
				<li>
					<button id="header_reservation"
						class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium">
						예약목록</button>
				</li>

				<!-- "메뉴" 버튼과 드롭다운 -->
				<li class="relative">
					<button id="menuToggle" class="menu-item px-4 py-2 rounded-full hover:bg-gray-100 font-medium flex items-center space-x-1">
						<span>메뉴</span>
						<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
    					</svg>
					</button> 
					<!-- 클릭 시 토글될 드롭다운 -->
					<ul id="dropdownMenu" class="absolute left-0 mt-2 w-56 bg-white border rounded-lg shadow-lg hidden z-10 text-sm">
						<li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">프로필</a></li>
						<li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">통계</a></li>
					</ul>
				</li>

			</ul>
		</nav>

		<!-- 오른쪽 메뉴 -->
		<div class="relative flex items-center space-x-4 text-sm">
		  <button id="menuToggle2" class="border p-1.5 px-3 rounded-full flex items-center space-x-2">
		    <span class="text-lg">☰</span> 
		    <span class="bg-gray-400 text-white rounded-full w-6 h-6 text-xs flex items-center justify-center"></span>
		  </button>
		  
		<!-- 클릭 시 토글될 드롭다운2 -->
		  <ul id="dropdownMenu2" class="absolute right-0 mt-[120px] w-56 bg-white border rounded-lg shadow-lg hidden z-10 text-sm">
		    <li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">게스트 모드로 전환</a></li>
		    <li><a href="#" class="dropdown-item block px-4 py-2 hover:bg-gray-100">로그아웃</a></li>
		  </ul>
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
    	    el.classList.remove('font-bold', 'border-2', 'border-black');
    	    el.style.backgroundColor = ''; // 배경색 초기화
    	  });

    	  // 강조 스타일 추가
    	  target.classList.add('font-bold', 'border-2', 'border-black');
    	  target.style.backgroundColor = '#F7F7F7'; // 강조 배경색
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

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const menuItems = document.querySelectorAll('.menu-item');
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    const menuToggle = document.getElementById('menuToggle');
    const dropdownMenu = document.getElementById('dropdownMenu');
    const dropdownMenu2 = document.getElementById('dropdownMenu2');
    
    // 현재 URL 불러오기 + 소문자 변경
    //✨✨✨✨✨✨✨✨✨✨✨✨ WebController servlet 정의 하게 되면, 그 명칭에 맞게
    // equals 할 것.
    // 안 되면 내 탓 아님, ★ 희승 ★
    
    /*** No Korean
    When defining a WebController servlet
    , it will be equals according to its name. 
    // If it doesn't work, it's not my fault, ★ Heeseung ★
    **/    
    const url = window.location.pathname.toLowerCase(); //현재 url 정보 불러오기
    
    const header_calendar = document.getElementById('header_calendar');
    const header_listing = document.getElementById('header_listing');
    const header_reservation = document.getElementById('header_reservation');
    // const menuToggle = document.getElementById('menuToggle'); // 얘 위에 존재 함
    
    //자동으로 해당 페이지 올 때, 선택하게 하기
    if(url.indexOf('calendar') != -1) {
    	highlightMenu(header_calendar);
    }
    else if(url.indexOf('propertylist') != -1) {
    	highlightMenu(header_listing);
    } 
    else if(url.indexOf('reservationlist') != -1) {
    	highlightMenu(header_reservation);
    }
    
    

    // 클릭 시 하이라이트 처리
    function highlightMenu(target) {
      menuItems.forEach(el => {
        el.classList.remove('font-bold', 'border-2', 'border-black');
        el.style.backgroundColor = '';
      });
      target.classList.add('font-bold', 'border-2', 'border-black');
      target.style.backgroundColor = '#F7F7F7';
    }

    menuItems.forEach(item => {
      item.addEventListener('click', function () {
        highlightMenu(this);
      });
    });

    dropdownItems.forEach(item => {
      item.addEventListener('click', function () {
        highlightMenu(menuToggle);
        dropdownMenu.classList.add('hidden'); // 선택 시 자동으로 닫힘
      });
    });
    
    dropdownItems.forEach(item => {
        item.addEventListener('click', function () {
          highlightMenu(menuToggle2);
          dropdownMenu2.classList.add('hidden'); // 선택 시 자동으로 닫힘
        });
      });

    // 클릭 시 드롭다운 메뉴 토글
    menuToggle.addEventListener('click', function (e) {
      e.stopPropagation(); // 이벤트 전파 막기
      dropdownMenu.classList.toggle('hidden');
    });
    
    
 	// 클릭 시 드롭다운 메뉴 토글2
    menuToggle2.addEventListener('click', function (e) {
      e.stopPropagation(); // 이벤트 전파 막기
      dropdownMenu2.classList.toggle('hidden');
    });

    // 외부 클릭 시 드롭다운 닫기
    document.addEventListener('click', function (e) {
      if (!menuToggle.contains(e.target)) {
        dropdownMenu.classList.add('hidden');
      }
    });
    
    // 외부 클릭 시 드롭다운 닫기2
    document.addEventListener('click', function (e) {
      if (!menuToggle2.contains(e.target)) {
        dropdownMenu2.classList.add('hidden');
      }
    });
  });
</script>
</body>
</html>