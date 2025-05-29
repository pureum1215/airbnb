<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Airbnb Header</title>
  <style>
    .header-wrapper {
      width: 100%;
      border-bottom: 1px solid #e5e5e5;
    }

    .header-container {
      width: 98%;
      padding: 16px 28px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .header-logo-group {
      display: flex;
      align-items: center;
      gap: 8px;
      cursor: pointer;
    }

    .header-logo-image {
      width: 24px;
      height: 24px;
    }

    .header-logo-text {
      color: #ff385c;
      font-weight: bold;
      font-size: 1.125rem;
    }
  </style>
</head>
<body>

<header class="header-wrapper">
  <div class="header-container">
  
    <!-- 왼쪽 로고 -->
    <div class="header-logo-group" onclick="location.href='/main_list.ma'">
      <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/airbnb_logo_icon_170605.png" alt="airbnb logo" class="header-logo-image">
      <span class="header-logo-text">airbnb</span>
    </div>
    
  </div>
</header>

</body>
</html>
