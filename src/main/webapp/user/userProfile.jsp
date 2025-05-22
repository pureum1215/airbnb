<%@page import="userPage.userProfile.UserProfileVO"%>
<%@page import="userPage.userProfile.UserProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.format.*, java.time.temporal.ChronoUnit, java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>게스트 프로필</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    /* 내가 작성한 후기 보기 버튼 스타일 */
    .myreview {
      font-size: 1rem;
      font-weight: 500;
      text-decoration: underline;
      color: #374151;
      margin-bottom: 1rem;
      transition: color 0.2s ease;
    }
    .myreview:hover {
      color: #000000;
    }
    
	.user-session {
	    padding: 24px;
	    border: 1px solid #ddd;
	    border-radius: 16px;
	    background-color: #ffffff;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
	    display: flex;
	    flex-direction: column;
	    gap: 16px;
	    font-family: 'Arial', sans-serif;
	    max-width: 600px;
	}


	.profile-aside {
	  grid-column: span 1;
	}
	
	.profile-box {
	  	padding: 24px;
	    border: 1px solid #ddd;
	    border-radius: 16px;
	    background-color: #ffffff;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
	    display: flex;
	    flex-direction: column;
	    gap: 16px;
	    font-family: 'Arial', sans-serif;
	    max-width: 600px;
	}
	
	.profile-avatar {
	  width: 96px;
	  height: 96px;
	  margin: 0 auto;
	  border-radius: 50%;
	  background-color: black;
	  color: white;
	  font-size: 32px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  font-weight: bold;
	}
	
	.profile-name {
	  font-size: 18px;
	  font-weight: 600;
	  margin-top: 12px;
	}
	
	.profile-role {
	  font-size: 14px;
	  color: #6b7280; /* Tailwind의 gray-500 */
	  margin-top: 4px;
	}
	
	.profile-meta {
	  margin-top: 16px;
	  font-size: 14px;
	  color: #374151; /* Tailwind의 gray-700 */
	}
	
	.profile-meta p {
	  margin: 4px 0;
	}
	
	.font-semibold {
	  font-weight: 600;
	}
  </style>
</head>
<body class="bg-white font-sans antialiased text-gray-900">

<!-- 기본 헤더 include -->
<%@ include file="header_default.jsp" %>

<%
	
  // 1. 사용자 정보 및 후기 데이터 가져오기
  //String userId = "user001";//로그인 안하고, 이 페이지만 사용할때
  System.out.println("test");
  String userId = (String) session.getAttribute("user_id");//로그인하고 이용할 때
  System.out.println("t2");
  if(userId == null) {
	  System.out.println("is null");
  } else {
	  System.out.println("not null");
  }
  UserProfileDAO dao = new UserProfileDAO();
  UserProfileVO upNCvo = dao.profileNC(userId); // 이름, 생성일 등 프로필 정보,개인정보
  List<UserProfileVO> uvoList = dao.userReview(userId); // 호스트가 남긴 후기 리스트
  List<UserProfileVO> pvoList = dao.propertyReview(userId); // 사용자가 작성한 후기 리스트

  // 2. 데이터 존재 여부 확인
  boolean checkcount1 = (uvoList != null && !uvoList.isEmpty());
  boolean checkcount2 = (pvoList != null && !pvoList.isEmpty());

  // 3. 가입일로부터 경과한 년/개월 계산
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
  LocalDateTime joinedDate = LocalDateTime.parse(upNCvo.getUser_created_at(), formatter);
  LocalDateTime now = LocalDateTime.now();
  long years = joinedDate.until(now, ChronoUnit.YEARS);
  long months = joinedDate.until(now, ChronoUnit.MONTHS) - (years * 12);

%>

<main class="max-w-6xl mx-auto px-6 py-10 grid md:grid-cols-3 gap-10">
  <!-- ▒▒ 좌측 프로필 영역 ▒▒ -->
	<aside class="profile-aside">
	  <div class="profile-box">
	    <div class="profile-avatar">
	      <%= upNCvo.getUser_name() %>
	    </div>
	    <h2 class="profile-name"><%= upNCvo.getUser_name() %></h2>
	    <p class="profile-role">게스트</p>
	
	    <div class="profile-meta">
	      <p>후기 <span class="font-semibold"><%= uvoList.size() %>개</span></p>
	      <p>에어비앤비 가입 기간 <span class="font-semibold"><%= years %>년 <%= months %>개월</span></p>
	    </div>
	  </div>
	</aside>

  <!-- ▒▒ 우측 콘텐츠 영역 ▒▒ -->
  <section class="md:col-span-2 space-y-6">

    <!-- 사용자 소개 섹션 -->
    <div class="user-session">
      <h1 class="text-2xl font-bold"><%= upNCvo.getUser_name() %> 님 정보</h1>
      <h2>이메일: <%=upNCvo.getUser_email() %> </h2>
      <h2>전화번호: <%=upNCvo.getUser_phone_number() %> </h2>
      <button class="mt-2 text-sm font-medium border px-4 py-2 rounded-md hover:bg-gray-50">프로필 수정하기</button>
    </div>

    <!-- 호스트가 남긴 후기 리스트 -->
    <div>
      <h2 class="text-xl font-semibold mb-3"><%= upNCvo.getUser_name() %> 님에 대한 호스트의 후기</h2>
      <div id="reviewList" class="space-y-6">
        <% if (checkcount1) {
            for (int i = 0; i < uvoList.size(); i++) {
              UserProfileVO review = uvoList.get(i);
              String hostname = review.getHost_name();
              String content = review.getUser_review_content();
              String createdAt = review.getUser_review_created_at();
              int rating = review.getUser_review_rating();

              // 날짜 포맷: "2023년 5월" 형태로 표시
              LocalDateTime reviewDate = LocalDateTime.parse(createdAt, formatter);
              String dateFormatted = reviewDate.getYear() + "년 " + reviewDate.getMonthValue() + "월";
        %>
        <!-- 기본 2개까지만 보여주고 이후는 접힘 처리 -->
        <div class="<%= i < 2 ? "" : "moreReviews hidden" %> border rounded-xl p-4">
          <p class="text-sm">⭐ <%= rating %> 후기: <%= content %></p>
          <div class="flex items-center mt-3 text-sm text-gray-600">
            <img src="https://randomuser.me/api/portraits/women/1.jpg" class="w-6 h-6 rounded-full mr-2" />
            <span><%= hostname %> · <%= dateFormatted %></span>
          </div>
        </div>
        <% } // end for
          } %>
      </div>

      <!-- 후기 더보기 버튼 -->
      <button id="toggleMoreReviews" class="showMoreBtn mt-4 text-sm font-medium underline text-gray-700 hover:text-black">
        후기 더보기
      </button>
    </div>

    <!-- 사용자가 작성한 후기 -->
    <% if (checkcount2) { %>
    <div class="mt-10">
      <!-- 토글 버튼 -->
      <button id="toggleMyReviews" class="myreview">내가 작성한 후기 보기</button>

      <!-- 후기 내용 영역 (초기 hidden) -->
      <div id="myReviewsSection" class="space-y-6 hidden">
        <% for (UserProfileVO vo : pvoList) {
          int rating = vo.getProperty_review_rating();
          String content = vo.getProperty_review_content();
          String createdAt = vo.getProperty_review_created_at();
          String photo = vo.getProperty_photo_url();
          String name = vo.getProperty_name();
        %>
        <div class="border rounded-xl p-4">
          <p class="text-sm">⭐ <%= rating %> 후기: <%= content %></p>
          <div class="flex items-center mt-3 text-sm text-gray-600 space-x-4">
            <img src="/uploads/<%= photo %>" width="120" height="90" alt="숙소 이미지" class="rounded" />
            <span><%= name %> · <%= createdAt %></span>
          </div>
        </div>
        <% } %>
      </div>
    </div>
    <% } %>

  </section>
</main>

<!-- ▒▒ 스크립트 영역 ▒▒ -->
<script>
  // 후기 더보기/접기 기능
  const showMoreBtn = document.querySelector(".showMoreBtn");
  if (showMoreBtn) {
    showMoreBtn.addEventListener("click", () => {
      document.querySelectorAll(".moreReviews").forEach(el => el.classList.toggle("hidden"));
      showMoreBtn.textContent = showMoreBtn.textContent === "후기 더보기" ? "접기" : "후기 더보기";
    });
  }

  // 내가 작성한 후기 보기/접기 기능
  const toggleMyReviews = document.getElementById("toggleMyReviews");
  if (toggleMyReviews) {
    toggleMyReviews.addEventListener("click", () => {
      const section = document.getElementById("myReviewsSection");
      section.classList.toggle("hidden");
      toggleMyReviews.textContent = section.classList.contains("hidden") ? "내가 작성한 후기 보기" : "접기";
    });
  }
</script>
</body>
</html>
