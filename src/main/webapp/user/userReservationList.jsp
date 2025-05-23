<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>이전 여행</title>

<style>

	.body {
      background-color: white;        /* bg-white */
      color: #1f2937;                 /* text-gray-900 */
      font-family: sans-serif;       /* font-sans */
      -webkit-font-smoothing: antialiased; /* antialiased */
      -moz-osx-font-smoothing: grayscale;  /* antialiased */
    }
    
    .main-container {
      max-width: 896px;         /* max-w-4xl */
      margin-left: auto;        /* mx-auto */
      margin-right: auto;       /* mx-auto */
      padding-left: 24px;       /* px-6 */
      padding-right: 24px;      /* px-6 */
      padding-top: 48px;        /* py-12 */
      padding-bottom: 48px;     /* py-12 */
    }
    
    .title-sytle{
      font-size: 24px;        /* text-2xl */
      line-height: 32px;      /* text-2xl */
      font-weight: 700;       /* font-bold */
      margin-bottom: 32px;    /* mb-8 */
    }
    
    .tab-container {
      display: flex;                          /* flex */
      border-bottom: 1px solid #e5e7eb;       /* border-b + border-gray-200 */
    }
    
    .list-container > * + * {
      margin-top: 32px; /* space-y-8 */
    }

    .reservation-list {
      display: flex;        /* flex */
      flex-direction: column; /* flex-col */
    }

    .reservation-list > * + * {
      margin-top: 16px; /* space-y-4 */
    }    

	.card-container {
	  display: flex;
	  align-items: flex-start;
	  gap: 16px;
	  border-bottom: 1px solid #e5e7eb; /* 구분선 추가 (필요시) */
	  padding-bottom: 16px;
	  position: relative; 
	}
	
	.card-image {
	  width: 112px;
	  height: 112px;
	  border-radius: 8px;
	  object-fit: cover;
	  flex-shrink: 0;
	}
	
	.card-info {
	  flex-grow: 1;
	  display: flex;
	  flex-direction: column;
	  justify-content: space-between;
	}
	
	.card-info-top {
	  /* 왼쪽: 숙소 이름, 위치, 더보기 */
	}
	
	.card-info-bottom {
	  /* 오른쪽: 체크인~체크아웃, 결제/예약중 영역 */
	  display: flex;
	  flex-direction: column;
	  justify-content: space-between;
	  text-align: right;
	  min-width: 160px;
	}
	
	.card-title {
	  font-size: 18px;
	  font-weight: 600;
	  margin: 0;
	}
	
	.card-location {
	  font-size: 14px;
	  color: #4B5563;
	  margin: 4px 0;
	}
	
	.card-more-btn {
	  background: none;
	  border: none;
	  color: #FF5A5F;
	  cursor: pointer;
	  font-size: 14px;
	  padding: 0;
	  text-decoration: underline;
	}
	
	.card-date {
		position: absolute; /* 오른쪽 위 고정 */
		top: 0;
		right: 0;
		font-size: 14px;
		color: #6B7280;
		background-color: rgba(255, 255, 255, 0.8); /* 배경 투명 처리 */
		margin: 0;
		border-radius: 4px;
	}
	
	.card-action-btn {
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
	
	.card-reserving-text {
	  font-size: 14px;
	  color: #6B7280;
	  font-style: italic;
	}

	
	.tab-button {
	  padding: 8px 16px;
	  font-size: 14px;
	  line-height: 20px;
	  font-weight: 500;
	  color: #6B7280; /* 기본: 회색 */
	  background: none;
	  border: none;
	  border-bottom: none;
	  cursor: pointer;
	}
	
	.tab-button.active {
	  color: #FF5A5F; /* 선택된 탭: 빨강 */
	  border-bottom: 2px solid #FF5A5F;
	}
    
</style>

</head>
<body onload="pagestart()">

	<div>
		<%@ include file="userHeader.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="main-container">
    <h1 class="title-style">이전 여행</h1>
	
	<div class="tab-container">
		<button type="button" id="tab-upcoming" class="tab-button active" onclick="showUpcomingList()">
		    다가오는 예약
		</button>
		<button type="button" id="tab-history" class="tab-button" onclick="showHistoryList()">
		    지난 예약
		</button>
	</div>
	<br/>
	<div class="list-container">
		<div id="reservation-content" class="reservation-list" ></div>
	</div>
    
  </main>

	<script src="../jquery-3.7.1.min.js"></script>  
	<script>
	
		const container = document.getElementById('reservation-content');
		
		function pagestart() {
			showUpcomingList();
		}

		function showUpcomingList() {
			setActiveTab('upcoming');
			showUpcoming();
 		}

 		function showHistoryList() {
			setActiveTab('history');
			showHistory();
 		}

		
 		function setActiveTab(tab) {
			const upcomingBtn = document.getElementById('tab-upcoming');
			const historyBtn = document.getElementById('tab-history');
			
			if (tab === 'upcoming') {
				upcomingBtn.classList.add('active');
				historyBtn.classList.remove('active');
			} 
			else if (tab === 'history') {
				historyBtn.classList.add('active');
				upcomingBtn.classList.remove('active');
			}
		}
		
		
		function showUpcoming() {
			console.log("showupcoming 실행")
			
			$.ajax({
				url: '${pageContext.request.contextPath}/user_reservation_upcoming.ura',
				type: 'post',
				dataType: 'json',
				success: function(res) {
    				console.log(res);
    				if(res.code ==200) {
    					
   						let card = '';
   						
    					res.data.forEach(item => {
    						console.log('예약 항목:', item);
    						
    						card += '<div class="card-container">';
    						card += '  <img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '  <div class="card-info">';
    						card += '    <div class="card-info-top">';
    						card += '      <h2 class="card-title">' + item.property_name + '</h2>';
    						card += '      <p class="card-location">' + item.country + ' ' + item.city + '</p>';
    						card += '      <button class="card-more-btn" onclick="location.href=\'/property_detail?propertyId=' + item.property_id + '\'">더보기</button>';
    						card += '    </div>';
    						card += '    <div class="card-info-bottom">';
    						card += '      <p class="card-date">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</p>';
    						if (item.payment_status === '완료') {
    							card += '      <span class="card-reserving-text">결제 완료</span>';
    						}
    						else if (item.payment_status === '대기') {
    							card += '      <span class="card-reserving-text">결제 진행중</span>';
    						}
    						else if (item.payment_status === '취소') {
    							card += '      <span class="card-reserving-text">결제 취소</span>';
    						}
    						else if (item.reservation_confirm === '승인') {
    							card += '      <button class="card-action-btn" onclick="location.href=\'../reservation/reservationPayment.jsp?reservationId=' + item.reservation_id + '\'">결제하기</button>';
    						}
    						else if (item.reservation_confirm === '보류') {
    							card += '      <span class="card-reserving-text">승인 요청 중</span>';
    						}
    						else if (item.reservation_confirm === '거절') {
    							card += '      <span class="card-reserving-text">거절되었습니다</span>';
    						}
    						else {
    							card += '      <span class="card-reserving-text">상태 알 수 없음</span>';
    						}
    						card += '    </div>';
    						card += '  </div>';
    						card += '</div>';
    					});
   						container.innerHTML = card;
    				}	
    				else {
    					alert('실패');
    				}
				}	
			})
		}
		
		function showHistory() {
			console.log("showhistory 실행")
			
			$.ajax({
				url: '${pageContext.request.contextPath}/user_reservation_history.ura',
				type: 'post',
				dataType: 'json',
				success: function(res) {
    				console.log(res);
    				if(res.code ==200) {
    					
   						let card = '';
    					
    					res.data.forEach(item => {
    						console.log('예약 항목2:', item);
    						
    						card += '<div class="card-container">';
    						card += '  <img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '  <div class="card-info">';
    						card += '    <div class="card-info-top">';
    						card += '      <h2 class="card-title">' + item.property_name + '</h2>';
    						card += '      <p class="card-location">' + item.country + ' ' + item.city + '</p>';
    						card += '      <button class="card-more-btn" onclick="location.href=\'/property_detail?propertyId=' + item.property_id + '\'">더보기</button>';
    						card += '    </div>';
    						card += '    <div class="card-info-bottom">';
    						card += '      <p class="card-date">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</p>';
    						if (item.payment_status === '완료') {
    							card += '      <span class="card-reserving-text">결제 완료</span>';
    						}
    						else if (item.payment_status === '대기') {
    							card += '      <span class="card-reserving-text">결제 진행중</span>';
    						}
    						else if (item.payment_status === '취소') {
    							card += '      <span class="card-reserving-text">결제 취소</span>';
    						}
    						else if (item.reservation_confirm === '승인') {
    							card += '      <button class="card-action-btn" onclick="location.href=\'../reservation/reservationPayment.jsp?reservationId=' + item.reservation_id + '\'">결제하기</button>';
    						} 
    						else if (item.reservation_confirm === '보류') {
    							card += '      <span class="card-reserving-text">승인 요청 중</span>';
    						}
    						else if (item.reservation_confirm === '거절') {
    							card += '      <span class="card-reserving-text">거절되었습니다</span>';
    						}
    						else {
    							card += '      <span class="card-reserving-text">상태 알 수 없음</span>';
    						}
    						card += '    </div>';
    						card += '  </div>';
    						card += '</div>';
    					});
    					
    					console.log(card);
   						container.innerHTML = card;
    				}	
    				else {
    					alert('실패');
    				}
				}	
			})
		}
	
	</script>
  
</body>
</html>
