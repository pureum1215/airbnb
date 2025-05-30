<%@page import="java.util.Date"%>
<%@page import="userPage.userReservationDetail.UserReservationDetailVO"%>
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
	
	.payment-btn {
		background-color: #FF5A5F;
		color: white;
		border: none;
		width: 150px;
		padding: 6px 12px;
		border-radius: 4px;
		cursor: pointer;
		font-size: 14px;
		align-self: flex-end;
	}
	
	
</style>
</head>
<body>
<%
	UserReservationDetailVO vo = (UserReservationDetailVO) request.getAttribute("UserReservationDetailVO");
	String UserId = (String) session.getAttribute("userId");
%>
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
					<div class="bold"> <%=vo.getReservation_check_in() %> </div>
					<div class="text-small">오후 4:00</div>
					<hr
						style="margin: 1rem 0; border: none; border-top: 1px solid #eee;" />
					<div class="section-title gray">체크아웃</div>
					<div class="bold"> <%=vo.getReservation_check_out() %> </div>
					<div class="text-small">오전 11:00</div>
				</div>
				<div class="card">
					<div class="section-title gray">결제 세부 정보</div>
					<div class="bold">총 비용: <%=vo.getPayment_price() %> 원 </div>
					<div>
						<% 
							if ( vo.getReservation_confirm().equals("거절") ) {
								%> <br/><span> 예약 요청이 거절되었습니다 </span> <%
							}
							else if ( vo.getReservation_confirm().equals("보류") ) {
								%> <br/><span> 예약 요청중 </span> <%
							}
							else if ( vo.getReservation_confirm().equals("승인") && vo.getPayment_id().equals("not_paid") ) {
								%> <br/> 
									<button class="payment-btn" 
									onclick="location.href='../reservation/reservationPayment.jsp?reservationId=<%=vo.getReservation_id() %>'">
									결제하기</button> <%
							}
							else if ( vo.getPayment_status().equals("취소") ) {
								%> <br/><span> 결제가 취소되었습니다 </span> <%
							}
							else if ( vo.getPayment_status().equals("대기") ) {
								%> <br/><span> 결제 대기중 </span> <%
							}
							else if ( vo.getPayment_status().equals("완료") ) {
								%> <br/><span> 결제가 완료되었습니다 </span> <%
							}
						%>
	
					</div>
				</div>
			</div>

			<!-- 오른쪽 영역 -->
			<div class="right-column">
			<a href="main_detail.ma?property_id=<%=vo.getProperty_id()%>" style="text-decoration: none; color: inherit;">
				<div class="card">
					<img
						src="/uploads/<%=vo.getProperty_photo_url() %>"
						alt="숙소 이미지" />
					<div class="bold" style="margin-top: 0.5rem;"> <%=vo.getProperty_name() %> </div>
					<div class="gray"> <%=vo.getLocation_country() %> <%=vo.getLocation_city() %> </div>
					<div class="gray"
						style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
						<%=vo.getProperty_description() %>
					</div>
					<div class="bold" style="margin-top: 0.5rem;"> <%=vo.getPrice_per_night() %> / 1박 </div>
				</div>
			</a>
			<a href="hostProfile.ho?host_id=<%=vo.getHost_id()%>" style="text-decoration: none; color: inherit;">	
				<div class="card">
					<div class="section-title">호스트: 
						<%=vo.getUser_name() %>
					</div>
					<div class="host">
						<img src="https://randomuser.me/api/portraits/women/1.jpg"
							alt="호스트 사진" />
						<div class="gray"> <%=vo.getHost_bio() %> </div>
					</div>
				</div>
			</a>	
			</div>

<!-- ===========================리뷰 보여주는 카드 입니다. 참고하세요.(리뷰 등록 전, 후 두가지 case)=========================== -->
				<% 
					// 체크아웃 날짜 전 : 아무것도 x
					// 체크아웃 날짜 후, 리뷰 없음 : 리뷰 작성 칸
					// 리뷰 있음 : 리뷰 보이기
					Date checkOutDate = vo.getReservation_check_out();
    				Date today = new Date();
    				
					if ( vo.getProperty_review_id() != null ) {
						%>
						<br>
						<!-- 리뷰 등록 후: 리뷰 보여주기 박스 -->
						<div class="card" style="display: flex; flex-direction: column; gap: 0.8rem; padding: 1rem;">
						  <!-- 상단 영역: 좌측 숙소사진 + 이름, 우측 별점 -->
						  <div style="display: flex; justify-content: space-between; align-items: center;">
						    <div style="display: flex; align-items: center; gap: 0.6rem;">
						      <img src="/uploads/<%=vo.getProperty_photo_url() %>" 
						           alt="숙소 사진" 
						           style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" />
						      <div class="bold" style="font-size: 16px;"> <%=vo.getProperty_name() %> </div>
						    </div>
						    <div style="display: flex; align-items: center; gap: 0.3rem; font-size: 16px; font-weight: bold;">
						      <span style=" color: gold;">⭐</span>
						      <span> <%=vo.getProperty_review_rating() %> </span>
						    </div>
						  </div>
						
						  <!-- 중단: 리뷰 등록 날짜 -->
						  <div class="text-small gray" style="font-size: 13px;"> <%=vo.getProperty_review_created_at() %> </div>
						
						  <!-- 하단: 리뷰 내용 -->
						  <div style="font-size: 14px; line-height: 1.4;">
						  		<%=vo.getProperty_review_content() %>
						  </div>
						</div>
						<%
					}
					else if ( checkOutDate.before(today) ) {
						%>
						<br>
						<!-- 체크아웃 날짜 후: 별점+리뷰 등록 -->
						<div class="card" style="padding: 10px;">
						 <form id="reviewForm" method="post" action="/userReviewSubmit.us">
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
		
								<button class="reviewSubmit" onclick="reviewSubmit()" >제출</button>
							</div>
		
		
							<!-- 리뷰 작성 영역 -->
							<div>
								<input type="text" name="property_review_content" placeholder="리뷰를 작성해주세요"
									style="width: 100%; padding: 5px; box-sizing: border-box;">
							</div>
							
							    <%-- 서버로 넘길 값 --%>
						    <input type="hidden" name="property_review_rating" id="ratingValue">
						    <input type="hidden" name="reservation_id" value=<%=request.getAttribute("reservation_id") %>>
						    <input type="hidden" name="property_id" value=<%=vo.getProperty_id() %>>
						  </form>
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
						    document.getElementById('ratingValue').value = index;
						  }
						  
						  function reviewSubmit() {
						    const rating = document.getElementById('ratingValue').value;
						    const review = document.getElementById('reviewContent').value;
							  
						    if (!review.trim()) {
						        alert("리뷰 내용을 입력해주세요.");
						        return;
						    }
							  
						    document.getElementById('reviewForm').submit();
						  }
						</script>
						<%
					}
				%>
				
		</div>
	</div>


</body>
</html>
