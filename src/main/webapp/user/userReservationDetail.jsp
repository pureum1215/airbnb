<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

@media ( min-width : 300px) {
	.container {
		max-width: 1232px !important;
	}
}

.left-column, .right-column {
	display: flex;
	flex-direction: column;
	gap: 1.5rem;
}

.card {
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 1rem;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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

#starContainer {
	display: flex;
	gap: 5px;
}

.star {
	width: 30px;
	height: 30px;
	display: inline-block;
	cursor: pointer;
	background-color: transparent;
	clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%,
		32% 57%, 2% 35%, 39% 35%);
	background-color: #ccc; /* 빈 별 기본 회색 */
	transition: background-color 0.3s ease;
}

.star.filled {
	background-color: gold; /* 채워진 별 노란색 */
}

.reviewSubmit {
	background-color: #ff385c;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 8px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
</style>
</head>
<body>
	<div>
		<%@ include file="userHeader.jsp"%>
		<!-- 헤더는 그대로 -->
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
					<hr
						style="margin: 1rem 0; border: none; border-top: 1px solid #eee;" />
					<div class="section-title gray">체크아웃</div>
					<div class="bold">9월 15일 (금)</div>
					<div class="text-small">오전 11:00</div>
				</div>
				<div class="card">
					<div class="section-title gray">예약 번호</div>
					<div class="bold">HNXJAW282Z</div>
				</div>
				<div class="card">
					<div class="section-title gray">결제 세부 정보</div>
					<div class="bold">총 비용:</div>
					<a href="#"
						style="color: #0070f3; text-decoration: underline; font-size: 13px;">영수증
						보기</a>
				</div>
			</div>

			<!-- 오른쪽 영역 -->
			<div class="right-column">
				<div class="card">
					<img
						src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg"
						alt="숙소 이미지" />
					<div class="bold" style="margin-top: 0.5rem;">Naniwa Ward의 숙소</div>
					<div class="gray">한국 Yesan-gun</div>
					<div class="gray">79km 거리 · 6월 9일~14일</div>
					<div class="gray"
						style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">게스트
						한마디 “조용하고 인테리어가 좋았습니다”</div>
					<div class="bold" style="margin-top: 0.5rem;">₩23,374 /박</div>
				</div>
				<div class="card">
					<div class="section-title">호스트: Toshiko 님</div>
					<div class="host">
						<img src="https://randomuser.me/api/portraits/women/1.jpg"
							alt="호스트 사진" />
						<div class="gray">일본, 오사카 거주. 게스트 응대에 친절하고 빠른 피드백을 주셨습니다.</div>
					</div>
				</div>


<!-- ===========================리뷰 보여주는 카드 입니다. 참고하세요.(리뷰 등록 전, 후 두가지 case)=========================== -->
				<br>
				<!-- 체크아웃 날짜 후: 별점+리뷰 등록 -->
				<div class="card" style="padding: 10px;">
					<!-- 별점 영역 -->
					<div class="stars"
						style="margin-bottom: 10px; display: flex; justify-content: space-between; align-items: center;">
						<div id="starContainer">
							<span class="star" data-index="1" onclick="setRating(1)"></span>
							<span class="star" data-index="2" onclick="setRating(2)"></span>
							<span class="star" data-index="3" onclick="setRating(3)"></span>
							<span class="star" data-index="4" onclick="setRating(4)"></span>
							<span class="star" data-index="5" onclick="setRating(5)"></span>
						</div>

						<button class="reviewSubmit">제출</button>
					</div>


					<!-- 리뷰 작성 영역 -->
					<div>
						<input type="text" placeholder="리뷰를 작성해주세요"
							style="width: 100%; padding: 5px; box-sizing: border-box;">
					</div>
				</div>

				<!-- JavaScript 추가 -->
				<script>
				  function setRating(index) {
				    const stars = document.querySelectorAll('#starContainer .star');
				    stars.forEach((star, i) => {
				      if (i < index) {
				        star.classList.add('filled');
				      } else {
				        star.classList.remove('filled');
				      }
				    });
				  }
				</script>
			</div>
			
			
			<br>
			<!-- 리뷰 등록 후: 리뷰 보여주기 박스 -->
			<div class="card" style="display: flex; flex-direction: column; gap: 0.8rem; padding: 1rem;">
			  <!-- 상단 영역: 좌측 숙소사진 + 이름, 우측 별점 -->
			  <div style="display: flex; justify-content: space-between; align-items: center;">
			    <div style="display: flex; align-items: center; gap: 0.6rem;">
			      <img src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg" 
			           alt="숙소 사진" 
			           style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" />
			      <div class="bold" style="font-size: 16px;">기흥 아늑한 집</div>
			    </div>
			    <div style="display: flex; align-items: center; gap: 0.3rem; font-size: 16px; font-weight: bold;">
			      <span style=" color: gold;">⭐</span>
			      <span>4.85</span>
			    </div>
			  </div>
			
			  <!-- 중단: 리뷰 등록 날짜 -->
			  <div class="text-small gray" style="font-size: 13px;">2025.05.21</div>
			
			  <!-- 하단: 리뷰 내용 -->
			  <div style="font-size: 14px; line-height: 1.4;">
			    너무 멋진 숙소입니다! 가족 단위의 게스트에게 추천합니다~
			  </div>
			</div>

		</div>
	</div>


</body>
</html>
