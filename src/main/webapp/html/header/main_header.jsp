<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #FBFBFB;
            height: 500px;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 40px;
            border-bottom: 1px solid #ddd;
            background-color: #FBFBFB;
        }

        .header .logo {
            display: flex;
            align-items: center;
        }

        .header .logo img {
            height: 30px;
            margin-right: 8px;
        }

        .header .nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .header .nav-item {
            text-align: center;
            font-size: 14px;
            color: #333;
        }

        .header .nav-item img {
            height: 24px;
            display: block;
            margin: 0 auto 5px;
        }

        .header .actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header .actions .circle-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: bold;
        }

        /* Search bar */
        .search-bar {
            margin: 0 auto;
            margin-top: 20px;
            max-width: 800px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 40px;
            display: flex;
            justify-content: space-between;
            padding: 12px 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .search-bar .section {
            flex: 1;
            padding: 0 16px;
            border-right: 1px solid #eee;
        }
        
        .search-bar .section:hover{
            flex: 1;
            padding: 0 16px;
            border-right: 1px solid #eee;
        }

        .search-bar .section:last-child {
            border-right: none;
        }

        .search-bar .section-title {
            font-size: 12px;
            font-weight: bold;
            color: #555;
        }

        .search-bar .section-value {
            font-size: 14px;
            color: #888;
        }

        .search-bar .search-icon {
            background-color: #ff385c;
            color: white;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="logo">
        <img src="https://cdn.worldvectorlogo.com/logos/airbnb-1.svg" alt="Airbnb Logo">
        <span style="color:#ff385c; font-weight: bold; font-size: 20px;">airbnb</span>
    </div>

    <div class="nav">
        <div class="nav-item">
            
            숙소
        </div>
        <div class="nav-item">
            
            체험 <span style="color:#ff385c; font-size:10px;"></span>
        </div>
        <div class="nav-item">
         
            서비스 <span style="color:#ff385c; font-size:10px;"></span>
        </div>
    </div>

    <div class="actions">
        <span>호스트 모드로 전환</span>
        <div class="circle-btn">준</div>
        <div class="circle-btn"><i class="fas fa-bars"></i></div>
    </div>
</div>

<div class="search-bar">
    <div class="section">
        <div class="section-title">여행지</div>
        <div class="section-value">여행지 검색</div>
    </div>
    <div class="section">
        <div class="section-title">날짜</div>
        <div class="section-value">날짜 추가</div>
    </div>
    <div class="section">
        <div class="section-title">여행자</div>
        <div class="section-value">게스트 추가</div>
    </div>
    <div class="search-icon">
        <i class="fas fa-search"></i>
    </div>
</div>

</body>
</html>