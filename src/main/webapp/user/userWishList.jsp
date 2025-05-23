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
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased">
	<%
	//String userId = (String)session.getAttribute("user_id");//실제 사
	String userId ="user002";//테스트
	UserWishListDAO dao = new UserWishListDAO();
	List<UserWishListVO> propvoList = dao.wishListProp(userId);
	%>
	<div>
		<%@ include file="userHeader.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="max-w-7xl mx-auto px-6 py-10 space-y-6">
    <!-- 위시리스트 제목 -->
    <h1 class="text-2xl font-bold">위시리스트</h1>

    <!-- 카드 리스트 -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            <%
        for(int i=0; i<propvoList.size(); i++){
        	String property_name = propvoList.get(i).getProperty_name();
        	int price = propvoList.get(i).getPrice_per_night();
        	String photo_url = propvoList.get(i).getProperty_photo_url();
        	String property_descript = propvoList.get(i).getProperty_description();
        	String property_id = propvoList.get(i).getProperty_id();
		%>
      <%-- 임시 카드1 --%>
      <div class="border rounded-2xl overflow-hidden shadow-sm">
        <div class="relative">
        <a href="/main_detail.ma?property_id=<%=property_id%>" class="property-card-link">
          <img src="/uploads/<%=photo_url%>" alt="숙소 이미지" class="w-full h-48 object-cover" />
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
          <h2 class="font-semibold truncate"><%=property_name %></h2>
          <p class="text-gray-600 text-sm truncate"><%=property_descript %></p>
          <p class="font-semibold text-sm mt-1">₩ <%=price %>/박 </p>
        </div>
      </div>
      <% 
        }
        %>
      
    </div>
  </main>
</body>
</html>
