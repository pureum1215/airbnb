<%@page import="mainPage.mainPropertyDetail.MainPropertyDetailVO"%>
<%@ page import="java.time.*, java.time.format.*, java.time.temporal.ChronoUnit, java.util.List, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mainPage.mainPropertyList.*" %>
<%@ page import="mainPage.mainPropertyList.MainPropertyListVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 리스트</title>
<style>
  body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #fff;
  }

  .container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 24px 0px; /* 위아래 24px, 좌우 4px */
  }

  .property-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  justify-content: flex-start;
}

.property-card {
  width: 200px; /* ✅ 고정 크기 */
  flex: 0 0 auto; /* ✅ flex-grow 비활성화 */
  border: 1px solid #e0e0e0;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
  transition: transform 0.2s ease;
  background: white;
  cursor: pointer;
}

.property-card:hover {
  transform: scale(1.02);
}

.property-card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

  .property-info {
    padding: 10px 12px;
  }

  .property-location {
    font-size: 13px;
    color: #666;
  }

  .property-name {
    font-size: 14px;
    font-weight: bold;
    margin: 4px 0;
    color: #222;
  }

  .property-rating {
    font-size: 13px;
    color: #777;
  }

  .property-price {
    font-size: 14px;
    margin-top: 6px;
    color: #000;
  }

  /* ✅ 반응형 설정 */
  @media (max-width: 1200px) {
    .property-card {
      width: calc(20% - 12px); /* 한 줄에 5개 */
    }
  }

  @media (max-width: 992px) {
    .property-card {
      width: calc(25% - 12px); /* 한 줄에 4개 */
    }
  }

  @media (max-width: 768px) {
    .property-card {
      width: calc(33.33% - 12px); /* 한 줄에 3개 */
    }
  }

  @media (max-width: 576px) {
    .property-card {
      width: calc(50% - 12px); /* 한 줄에 2개 */
    }
  }

  @media (max-width: 400px) {
    .property-card {
      width: 100%; /* 한 줄에 1개 */
    }
  }
</style>
</head>
<body>

  <!-- 헤더 -->
  <jsp:include page="property_header.jsp" />

  <!-- 본문 -->
  <div class="container">
    <div class="property-grid">

      <!-- 예시 카드 반복 -->
      <div class="property-card">
        <img src="https://img.hourplace.co.kr/place/user/33920/2024/04/04/fbbe0f84-2c2a-4432-b884-15f309fa2f51?s=2000x2000&t=inside&q=80" alt="숙소 이미지" />
        <div class="property-info">
          <div class="property-location">서울, 대한민국</div>
          <div class="property-name">도심 속 감성 스튜디오</div>
          <div class="property-rating">⭐ 4.91 후기 135개</div>
          <div class="property-price">₩89,000 /박</div>
        </div>
      </div>
      
      <!-- 원하는 만큼 카드 복제 또는 반복문으로 출력 가능 -->

    </div>
  </div>

  <!-- 푸터 -->
  <jsp:include page="property_footer.jsp" />

</body>
</html>
