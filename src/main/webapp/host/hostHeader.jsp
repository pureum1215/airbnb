<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>hostHeader</title>

	<!-- Tailwind CSS CDN -->
	<script src="https://cdn.tailwindcss.com"></script>

  <!-- Google Fonts: Noto Sans KR -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
    }

    header {
      width: 100%;
      border-bottom: 1px solid #e5e7eb;
    }

    .headerContainer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 28px;
    }
    
    @media (min-width: 200px) {
    .headerContainer {
        max-width: 1950px !important;
    }

    .logo {
      display: flex;
      align-items: center;
      gap: 8px;
      flex-shrink: 0;
      cursor: pointer;
    }

    .logo img {
      width: 24px;
      height: 24px;
    }

    .logo span {
      color: #ef4444;
      font-weight: bold;
      font-size: 1.125rem;
    }

    nav ul {
      display: flex;
      gap: 8px;
      font-size: 0.875rem;
      color: #374151;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .menu-item {
      padding: 8px 16px;
      border-radius: 9999px;
      font-weight: 500;
      cursor: pointer;
      background-color: transparent;
      border: none;
    }

    .menu-item:hover {
      background-color: #f3f4f6;
    }

    .menu-item.selected {
      font-weight: bold;
      border: 2px solid #000;
      background-color: #F7F7F7;
    }

    .dropdown {
      position: relative;
    }

    .dropdown-menu {
      position: absolute;
      left: 0;
      top: 100%;
      margin-top: 8px;
      width: 160px;
      background-color: white;
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      display: none;
      z-index: 10;
    }

    .dropdown-menu.show {
      display: block;
    }

    .dropdown-item {
      
      display: block;
      padding: 12px 20px;
      text-decoration: none;
      color: #111827;
    }
	
	button.dropdown-item{
		
		width:100%
	}
    .dropdown-item:hover {
      background-color: #f3f4f6;
    }

    .user-menu {
      position: relative;
      display: flex;
      align-items: center;
      gap: 16px;
      font-size: 0.875rem;
    }

    .user-toggle {
      border: 1px solid #d1d5db;
      padding: 6px 12px;
      border-radius: 9999px;
      display: flex;
      align-items: center;
      gap: 8px;
      background-color: white;
      cursor: pointer;
    }

    .user-avatar {
      background-color: #9ca3af;
      color: white;
      border-radius: 9999px;
      width: 24px;
      height: 24px;
      font-size: 0.75rem;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .user-dropdown {
      position: absolute;
      right: 0;
      top: 100%;
      margin-top: 8px;
      width: 224px;
      background-color: white;
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      display: none;
      z-index: 10;
    }

    .user-dropdown.show {
      display: block;
    }
  </style>
</head>
<body>

  <header>
    <div class="headerContainer">
      <!-- 로고 -->
      <div class="logo">   <!-- ★★★★★ 로고 클릭했을 경우, 화면 이동 링크 필요 ★★★★★ -->
        <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png" alt="airbnb logo">
        <span>airbnb</span>
      </div>

      <!-- 중앙 메뉴 -->
      <nav>
        <ul id="menuList">
          <li><button id="header_calendar" class="menu-item" >달력</button></li>   <!-- ★★★★★ hostCalendar 화면 이동 링크 필요 ★★★★★ -->
          <li><button id="header_listing" class="menu-item" onclick="location.href='/hostList.ho'">리스팅</button></li>
          <li><button id="header_reservation" onclick="location.href='/host/hostReservationList.jsp'" class="menu-item">예약목록</button></li>   <!-- ★★★★★ hostPropertyReservationList 화면 이동 링크 필요 ★★★★★ -->
          <li class="dropdown">
            <button id="menuToggle" class="menu-item">메뉴 ▼</button>
            <ul id="dropdownMenu" class="dropdown-menu">

              <li>
              <button class="dropdown-item" onclick="location.href='/hostProfile.ho'">프로필</button>
              </li>
              <li>
              <button class="dropdown-item" onclick="location.href='/host/hostStatistics.jsp'">통계</button></li> 
                <!-- ★★★★★ hostStatistics 화면 이동 링크 필요 ★★★★★ -->
            </ul>
          </li>
        </ul>
      </nav>

      <!-- 유저 메뉴 -->
      <div class="user-menu">
        <button id="menuToggle2" class="user-toggle">
          <span>☰</span>
          <span class="user-avatar"></span>
        </button>
        <ul id="dropdownMenu2" class="user-dropdown">
          <li><a href="#" class="dropdown-item">게스트 모드로 전환</a></li>   <!-- ★★★★★ 로그인 유지된 상태로 main_property_list 화면 이동 링크 필요 ★★★★★ -->
          <div style="border-bottom: 2px solid #E5E7EB; margin: 0 10px;"></div>
          <li><a href="#" class="dropdown-item">로그아웃</a></li>   <!-- ★★★★★ 로그아웃된 상태로 main_property_list 화면 이동 링크 필요 ★★★★★ -->
        </ul>
      </div>
    </div>
  </header>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const menuItems = document.querySelectorAll('.menu-item');
      const dropdownItems = document.querySelectorAll('.dropdown-item');
      const menuToggle = document.getElementById('menuToggle');
      const menuToggle2 = document.getElementById('menuToggle2');
      const dropdownMenu = document.getElementById('dropdownMenu');
      const dropdownMenu2 = document.getElementById('dropdownMenu2');

      const url = window.location.pathname.toLowerCase();
      const header_calendar = document.getElementById('header_calendar');
      const header_listing = document.getElementById('header_listing');
      const header_reservation = document.getElementById('header_reservation');

      if (url.includes('calendar')) highlightMenu(header_calendar);
      else if (url.includes('propertylist')) highlightMenu(header_listing);
      else if (url.includes('reservationlist')) highlightMenu(header_reservation);

      function highlightMenu(target) {
        menuItems.forEach(el => {
          el.classList.remove('selected');
        });
        target.classList.add('selected');
      }

      menuItems.forEach(item => {
        item.addEventListener('click', () => highlightMenu(item));
      });

      dropdownItems.forEach(item => {
        item.addEventListener('click', () => {
          highlightMenu(menuToggle);
          highlightMenu(menuToggle2);
          dropdownMenu.classList.remove('show');
          dropdownMenu2.classList.remove('show');
        });
      });

      menuToggle.addEventListener('click', e => {
        e.stopPropagation();
        dropdownMenu.classList.toggle('show');
      });

      menuToggle2.addEventListener('click', e => {
        e.stopPropagation();
        dropdownMenu2.classList.toggle('show');
      });

      document.addEventListener('click', e => {
        if (!menuToggle.contains(e.target)) dropdownMenu.classList.remove('show');
        if (!menuToggle2.contains(e.target)) dropdownMenu2.classList.remove('show');
      });
    });
  </script>

</body>
</html>
