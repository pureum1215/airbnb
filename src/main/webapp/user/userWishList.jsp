<%@page import="userPage.userWishList.UserWishListVO"%>
<%@page import="userPage.userWishList.UserWishListDAO"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>위시리스트</title>
  <style>
body.body {
  background-color: #ffffff;
  color: #1f2937;
  font-family: sans-serif;
}

.main {
  max-width: 1280px;
  margin: 0 auto;
  padding: 40px 24px;
}

.title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 24px;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 24px;
}

.card {
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  background: #fff;
  cursor: pointer;
}

.card-img-container {
  position: relative;
}

.card-img {
  width: 100%;
  height: 192px;
  object-fit: cover;
}

.label {
  position: absolute;
  top: 8px;
  left: 8px;
  background: #ffffff;
  font-size: 12px;
  font-weight: 500;
  padding: 4px 8px;
  border-radius: 9999px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.heart-icon {
  position: absolute;
  top: 8px;
  right: 8px;
}

.heart-icon svg {
  width: 24px;
  height: 24px;
  fill: #ef4444;
}

.card-body {
  padding: 16px;
  font-size: 14px;
}

.card-title {
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.card-description {
  color: #6b7280;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.card-price {
  font-weight: 600;
  margin-top: 4px;
}

.property-card-link {
  text-decoration: none;   /* 밑줄 제거 */
  color: inherit;          /* 상위 요소의 글자 색상 상속 */
  display: block;          /* 카드 전체에 링크 걸리게 하기 위해 block 처리 */
}
  </style>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body class="body">
	<%
	//String userId = (String)session.getAttribute("user_id");//실제 사
	String userId ="user002";//테스트
	UserWishListDAO dao = new UserWishListDAO();
	List<UserWishListVO> propvoList = dao.wishListProp(userId);
	%>
	<div>
		<%@ include file="userHeader.jsp"%>
	</div>

  <main class="main">
    <h1 class="title">위시리스트</h1>

    <div class="card-grid">
            <%
        for(int i=0; i<propvoList.size(); i++){
        	String property_name = propvoList.get(i).getProperty_name();
        	int price = propvoList.get(i).getPrice_per_night();
        	String photo_url = propvoList.get(i).getProperty_photo_url();
        	String property_descript = propvoList.get(i).getProperty_description();
        	String property_id = propvoList.get(i).getProperty_id();
		%>
      <div class="card">
		<a href="/main_detail.ma?property_id=<%=property_id%>" class="property-card-link">
        	<div class="card-img-container">
	            <img src="/uploads/<%=photo_url%>" alt="숙소 이미지" class="card-img" />
	            	<div class="label">게스트 선호</div>
	            <div class="heart-icon">
	              <svg viewBox="0 0 24 24">
	              <!-- 하트(❤️) 모양 아이콘을 그리는 SVG 경로 -->
	                <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 
	                6.5 3.5 5 5.5 5c1.54 0 3.04.99 
	                3.57 2.36h1.87C13.46 5.99 14.96 5 
	                16.5 5 18.5 5 20 6.5 20 8.5c0 
	                3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
	              </svg>
	            </div>
	        </div>
	        <div class="card-body">
	          <h2 class="card-title"><%=property_name %></h2>
	          <p class="card-description"><%=property_descript %></p>
	          <p class="card-price">₩ <%=price %>/박 </p>
	        </div>
          </a>
      </div>
      <% } %>
    </div>
  </main>
</body>
</html>
