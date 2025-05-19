<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>호스트 프로필 | Airbnb</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Inter', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fafafa;
	color: #222;
}

.container {
	display: flex;
	gap: 40px;
	max-width: 1200px;
	margin: 40px auto;
	padding: 0 20px;
}

.left-panel {
	width: 320px;
	display: flex;
	flex-direction: column;
	gap: 24px;
	position: sticky;
	top: 100px;
	align-self: flex-start;
}

.profile-box, .verify-box {
	background: #fff;
	border-radius: 16px;
	padding: 24px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
}

.profile-box img {
	width: 96px;
	height: 96px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 16px;
}

.profile-box h2 {
	font-size: 20px;
	font-weight: 600;
	margin: 10px 0 4px;
}

.profile-box .rating {
	font-size: 15px;
	color: #555;
	margin-bottom: 8px;
}

.profile-box .badge {
	display: inline-block;
	background-color: #FF385C;
	color: white;
	font-size: 12px;
	padding: 4px 10px;
	border-radius: 999px;
	margin-top: 6px;
	font-weight: 500;
}

.verify-box {
	font-size: 14px;
	line-height: 1.8;
	color: #555;
}

.right-panel {
	flex: 1;
	background: #fff;
	border-radius: 16px;
	padding: 32px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
}

.section-title {
	font-size: 22px;
	font-weight: 700;
	margin-bottom: 24px;
}

.info-list {
	font-size: 15px;
	color: #333;
	line-height: 2;
	margin-bottom: 24px;
}

.introduction {
	font-size: 15px;
	line-height: 1.8;
	color: #444;
}

.review-box {
	margin-top: 48px;
	border-top: 1px solid #e4e4e4;
	padding-top: 32px;
}

.review {
	background: #f7f7f7;
	padding: 20px;
	border-radius: 12px;
	margin-top: 12px;
}

.review .reviewer {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.review .reviewer img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 12px;
}

.review .reviewer-info {
	font-size: 14px;
	color: #555;
}

.review .content {
	font-size: 14px;
	color: #333;
	line-height: 1.6;
}

#toggleReviewsBtn {
	margin-top: 20px;
	background-color: transparent;
	border: none;
	color: #FF385C;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
}

.listing-carousel {
	display: flex;
	gap: 20px;
	overflow-x: auto;
	padding-bottom: 10px;
}

.listing-card {
	min-width: 240px;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	flex-shrink: 0;
}

.listing-card img {
	width: 100%;
	height: 160px;
	object-fit: cover;
}

.listing-info {
	padding: 12px;
	font-size: 14px;
}

.listing-type {
	color: #555;
	margin-bottom: 4px;
}

.listing-name {
	font-weight: 600;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-bottom: 4px;
}

.listing-rating {
	color: #222;
}
</style>
</head>
<body>
	<%@ include file="../html/header_hostpage.jsp"%>

	<div class="container">
		<!-- 왼쪽 패널 -->
		<div class="left-panel">
			<div class="profile-box">
				<img src="https://i.pravatar.cc/150?img=11" alt="Toshiko 프로필 사진">
				<h2>Toshiko</h2>
				<div class="rating">⭐ 4.98 ・ 후기 1037개</div>
				<div class="badge">슈퍼호스트</div>
			</div>

			<div class="verify-box">
				<p>✔ 신원 인증</p>
				<p>✔ 이메일 주소</p>
				<p>✔ 전화번호</p>
			</div>
		</div>

		<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★삭제할 부분은 나중에 삭제 바랍니다.★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		<!-- 임시로 넣어놓음 -->
		<!-- 오른쪽 패널 -->
		<div class="right-panel">
			<div class="section-title">Toshiko 님 소개</div>

			<div class="info-list">
				직업/직장: 직원<br> 취미: 만화 체험<br> 숙소의 특별한 점: 공용 및 실내 통석<br>
				게스트를 위해 노력하는 일: 깨끗한 숙소 제공하기<br> 음성 언어: 70대여성<br> 출신 학교:
				日本理容美容専門学校<br> 가장 쓸모있는 재능: 디테일이 걱정되네요<br> 요즘 푹 빠져 있는 것:
				스트레칭<br> 구사 언어: 영어, 일본어 및 중국어<br> 거주 지역: 오사카, 일본<br>
				조식 메뉴: 프라이팬
			</div>

			<div class="introduction">
				안녕하세요, 저는 Toshiko입니다. <br> <br> 카가와현에서 태어난 저는 오사카에서 대만 해외
				중국인 남편을 만났고, 지금은 남편과 함께 에어비앤비를 운영하고 있습니다.<br> 저는 중국어를 할 수 없지만,
				남편은 중국어를 구사합니다.<br> <br> 제 취미는 여행과 이 동네에서 현지 음식을 먹는 것을
				좋아합니다. 저는 남편의 동생이 대만에 살고 있기 때문에 대만에 자주 갑니다.<br> <br> 2살과
				11세 어린이로 인해 안타깝게도 체크인 시 만날 수 없습니다. 남편과 직원이 에어비앤비에서 대신 기시모토를 통해 연락
				가능합니다.<br> <br> 오사카에서 20년정도 살았는데 궁금하신 점 있으시면 언제든지 연락주세요!
			</div>

			<div class="review-box" style="border-bottom: 1px solid #e4e4e4;">
				<div class="section-title">Toshiko 님의 후기</div>

				<!-- 후기 리스트 -->
				<div class="review-list">
					<div class="review">
						<div class="reviewer">
							<img src="https://i.pravatar.cc/150?img=5" alt="리뷰어 사진">
							<div class="reviewer-info">
								Terii<br>2025년 5월
							</div>
						</div>
						<div class="content">"...이곳에서 즐거운 시간을 보냈습니다. 매우 깨끗하고 공간 내에
							멋진 현대적인 분위기가 있었습니다..."</div>
					</div>

					<!-- 두 번째 후기 (예시) -->
					<div class="review" style="display: none;">
						<div class="reviewer">
							<img src="https://i.pravatar.cc/150?img=6" alt="리뷰어 사진">
							<div class="reviewer-info">
								Haruka<br>2025년 4월
							</div>
						</div>
						<div class="content">"호스트가 너무 친절하고 숙소 위치도 완벽했습니다. 다음에도 꼭 다시
							예약하고 싶어요."</div>
					</div>
				</div>

				<!-- 토글 버튼 -->
				<button id="toggleReviewsBtn">후기 더 보기</button>
			</div>
			<!-- Toshiko 님의 숙소 -->
			<div style="margin-top: 64px;">
				<div class="section-title">Toshiko 님의 숙소</div>
				<div class="listing-carousel">
					<!-- 숙소 카드 1 -->
					<div class="listing-card">
						<img
							src="https://content.r9cdn.net/rimg/himg/60/bd/6c/agoda-2975064-129665769-167419.jpg?width=1366&height=768&crop=true"
							alt="오두막">
						<div class="listing-info">
							<div class="listing-type">오두막</div>
							<div class="listing-name">Machiya 1DK ・ #01</div>
							<div class="listing-rating">⭐ 4.99</div>
						</div>
					</div>

					<!-- 숙소 카드 2 -->
					<div class="listing-card">
						<img
							src="https://st2.depositphotos.com/1007034/6589/i/450/depositphotos_65894943-stock-photo-luxury-villa-bunker.jpg"
							alt="공동 주택">
						<div class="listing-info">
							<div class="listing-type">공동 주택</div>
							<div class="listing-name">#401 Matsujyuju 2LDK 100㎡
								Ebisucho...</div>
							<div class="listing-rating">⭐ 4.98</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		const toggleBtn = document.getElementById('toggleReviewsBtn');
		const reviews = document.querySelectorAll('.review-list .review');

		toggleBtn.addEventListener('click', () => {
   			const isExpanded = toggleBtn.textContent === '접기';
  			reviews.forEach((review, index) => {
       		if (index > 0) {
       			review.style.display = isExpanded ? 'none' : 'block';
    			}
   		 	});
   			toggleBtn.textContent = isExpanded ? '후기 더 보기' : '접기';
		});
	</script>

	<%@ include file="../html/footer.jsp"%>
</body>
</html>
