<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>예약 상세 페이지</title>
  <style>
/* 새로 추가된 wrapper 스타일 */
.content-wrapper {
  padding: 2rem 0;
}

/* 기존 container에서 배경색 제거 */
.container {
  font-family: Arial, sans-serif;
  margin: 0 auto;
  padding: 2rem;
  max-width: 1200px;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

@media (min-width: 300px) {
  .container {
    max-width: 1232px !important;
  }
}
.left-column,
.right-column {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
.card {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 1rem;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  font-size: 14px;
}
.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 10px;
}
.section-title {
  font-weight: bold;
  margin-bottom: 0.5rem;
}
.gray {
  color: #777;
}
.bold {
  font-weight: bold;
}
.text-small {
  font-size: 12px;
  color: #999;
}
.host {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-top: 0.5rem;
}
.host img {
  width: 32px;
  height: 32px;
  border-radius: 50%;
}
.stars {
  color: gold;
  font-size: 16px;
}
</style>
</head>
<body>
<div>
  <%@ include file="header_default.jsp"%> <!-- 헤더는 그대로 -->
</div>

<!-- ✅ 추가된 wrapper -->
<div class="content-wrapper">
  <div class="container">
    <!-- 왼쪽 영역 -->
    <div class="left-column">
      <div class="card">
        <div class="section-title gray">체크인</div>
        <div class="bold">9월 11일 (월)</div>
        <div class="text-small">오후 4:00</div>
        <hr style="margin: 1rem 0; border: none; border-top: 1px solid #eee;" />
        <div class="section-title gray">체크아웃</div>
        <div class="bold">9월 15일 (금)</div>
        <div class="text-small">오전 11:00</div>
      </div>
      <div class="card">
        <div class="section-title gray">게스트</div>
        <div class="bold">게스트 6명</div>
        <hr style="margin: 1rem 0; border: none; border-top: 1px solid #eee;" />
        <div class="section-title gray">예약 번호</div>
        <div class="bold">HNXJAW282Z</div>
      </div>
      <div class="card">
        <div class="section-title gray">결제 세부 정보</div>
        <div class="bold">총 비용:</div>
        <a href="#" style="color: #0070f3; text-decoration: underline; font-size: 13px;">영수증 보기</a>
      </div>
    </div>

    <!-- 오른쪽 영역 -->
    <div class="right-column">
      <div class="card">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg" alt="숙소 이미지" />
        <div class="bold" style="margin-top: 0.5rem;">Naniwa Ward의 숙소</div>
        <div class="gray">한국 Yesan-gun</div>
        <div class="gray">79km 거리 · 6월 9일~14일</div>
        <div class="gray" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">게스트 한마디 “조용하고 인테리어가 좋았습니다”</div>
        <div class="bold" style="margin-top: 0.5rem;">₩23,374 /박</div>
      </div>
      <div class="card">
        <div class="section-title">호스트: Toshiko 님</div>
        <div class="host">
          <img src="https://randomuser.me/api/portraits/women/1.jpg" alt="호스트 사진" />
          <div class="gray">일본, 오사카 거주. 게스트 응대에 친절하고 빠른 피드백을 주셨습니다.</div>
        </div>
      </div>
      <div class="card">
        <div class="section-title">후기가 제출되었습니다.</div>
        <div class="stars">⭐⭐⭐⭐⭐</div>
      </div>
    </div>
  </div>
</div>


</body>
</html>
