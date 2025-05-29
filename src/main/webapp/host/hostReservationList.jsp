<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<title>숙소 예약 리스트</title>
	<link rel="stylesheet" href="/css/style.css" />
	
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
		position: relative;
		display: flex;
		flex-direction: column;
		border-bottom: 1px solid #e5e7eb;
		padding: 16px;
		gap: 12px;
	}
	
	.card-header {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
	}
	
	.card-user {
		display: flex;
		align-items: center;
		gap: 6px;
	}
	
	.card-user-icon {
		font-size: 18px;
	}
	
	.card-user-name {
		font-size: 14px;
		color: #2563EB;
		text-decoration: none;
	}
	
	.card-dates {
		text-align: right;
		font-size: 14px;
		color: #4B5563;
	}
	
	.card-total-price {
		font-weight: bold;
		color: #111827;
	}
	
	.card-body {
  		display: flex;
  		gap: 16px;
  		align-items: flex-start;
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
		position: absolute; /* 오른쪽 위 고정 */
		top: 16px;
		right: 16px;
		font-size: 14px;
		color: #6B7280;
		background-color: rgba(255, 255, 255, 0.8); /* 배경 투명 처리 */
		margin: 0;
		border-radius: 4px;
	}
	
	.card-date-range,
	.card-total-price {
  		font-size: 14px;
  		color: #6B7280;
	}
	
	.card-info-middle {
  		margin-top: 8px;
  		dispay: inline-block;
  		display: flex;
	}
	
	.card-info-footer {
  		display: flex;
  		justify-content: space-between;
 		align-items: flex-end;
 		margin-top: 8px;
	}
	
	.card-info-property {
 		margin-left: 5px;
	}
	
	.card-title {
		font-size: 18px;
		font-weight: 600;
	}
	
	.card-location {
		font-size: 14px;
		color: #6B7280;
	}
	.card-user {
		display: flex;
		align-items: center;
		gap: 4px;
	}
	
	.card-actions {
		text-align: right;
	}
	
	.card-created-at {
		font-size: 14px;
		color: #6B7280;
		margin-bottom: 4px;
	}
	.card-more-btn {
		font-size: 14px;
		color: #FF5A5F;
		text-decoration: underline;
		background: none;
		border: none;
		cursor: pointer;
		padding: 0;
	}
	
	.card-info-bottom {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		text-align: right;
		margin-left: auto;
		gap: 4px;
	}
	
	.card-action-btn {
		background-color: #10B981;
		color: white;
		border: none;
		padding: 6px 12px;
		border-radius: 4px;
		font-size: 14px;
		cursor: pointer;
	}
	
	.card-action-btn.decline {
		background-color: #EF4444;
	}
	
	.card-reserving-text {
		font-size: 14px;
		color: #6B7280;
		font-style: italic;
	}
	
	.card-none-text {
  		font-size: 14px;
  		color: #6B7280;
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

	<%@ include file="hostHeader.jsp"%>


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
				url: '${pageContext.request.contextPath}/host_reservation_upcoming.hra',
				type: 'post',
				dataType: 'json',
				success: function(res) {
    				console.log(res);
    				if(res.code ==200) {
    					
   						let card = '';
   						
    					res.data.forEach(item => {
    						console.log('예약 항목:', item);
    						
    						card += '<div class="card-container">';

    						card += '  <div class="card-info">';
    						card += '    <div class="card-info-top">';
    						card += '      <div class="card-date-range">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</div>';
    						card += '      <div class="card-total-price">총 금액: ₩' + item.total_price.toLocaleString() + '</div>';
    						card += '    </div>';

    						card += '    <div class="card-info-middle">';
    						card += '      <img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '      <div class="card-info-property">';
    						card += '        <h2 class="card-title">' + item.property_name + '</h2>';
    						card += '        <p class="card-location">' + item.location_country + ' ' + item.location_city + '</p>';
    						card += '        <button class="card-more-btn" onclick="location.href=\'/main_detail.ma?property_id=' + item.property_id + '\'">더보기</button>';
    						card += '      </div>'
    						card += '    </div>';

    						card += '    <div class="card-info-footer">';
    						card += '      <div class="card-user">';
    						card += '        <span class="card-user-icon">👤</span>';
    						card += '        <a href="/userProfile.us?userId=' + item.user_id + '" class="card-user-name">' + item.user_name + '</a>';
    						card += '      </div>';
    						card += '      <div class="card-actions">';
    						card += '        <p class="card-created-at">예약 신청일: ' + item.reservation_created_at + '</p>';
    						// 아래 조건문 그대로

    						if (item.payment_status === '완료') {
    						  card += '      <span class="card-reserving-text">결제 완료</span>';
    						} 
    						else if (item.payment_status === '대기') {
    						  card += '      <span class="card-reserving-text">결제 진행중</span>';
    						} 
    						else if (item.payment_status === '취소') {
    						  card += '      <span class="card-reserving-text">결제 취소</span>';
    						} 
    						else if (item.reservation_confirm === '보류') {
    						 	card += '      <button class="card-action-btn" onclick="reservation_confirm(\'' + item.reservation_id + '\')">승인</button>';
    							card += '      <button class="card-action-btn decline" onclick="reservation_decline(\'' + item.reservation_id + '\')">거절</button>';
    						} 
    						else if (item.reservation_confirm === '승인') {
    						  card += '      <span class="card-reserving-text">결제 대기중</span>';
    						}
    						else if (item.reservation_confirm === '거절') {
      						  card += '      <span class="card-reserving-text">거절되었습니다</span>';
      						}
    						else {
    							card += '      <span class="card-reserving-text">상태 알 수 없음</span>';
    						}
    						card += '    </div>';
    						card += '  </div>'; 
    						card += ' </div>';
    						card += '</div>'; 
    					});
   						container.innerHTML = card;
    				}
    				else if (res.code ==500) {
    					console.log('500');
    					
    					let card = '';
    					card += '<div class="card-container">';
    					card += '      <span class="card-none-text">예약 내역이 없습니다</span>';
    					card += '</div>';
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
				url: '${pageContext.request.contextPath}/host_reservation_history.hra',
				type: 'post',
				dataType: 'json',
				success: function(res) {
    				console.log(res);
    				if(res.code ==200) {
    					
   						let card = '';
    					
    					res.data.forEach(item => {
    						console.log('예약 항목2:', item);
    						
    						card += '<div class="card-container">';

    						card += '  <div class="card-info">';
    						card += '    <div class="card-info-top">';
    						card += '      <div class="card-date-range">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</div>';
    						card += '      <div class="card-total-price">총 금액: ₩' + item.total_price.toLocaleString() + '</div>';
    						card += '    </div>';

    						card += '    <div class="card-info-middle">';
    						card += '      <img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '      <div class="card-info-property">';
    						card += '        <h2 class="card-title">' + item.property_name + '</h2>';
    						card += '        <p class="card-location">' + item.location_country + ' ' + item.location_city + '</p>';
    						card += '        <button class="card-more-btn" onclick="location.href=\'/main_detail.ma?property_id=' + item.property_id + '\'">더보기</button>';
    						card += '      </div>'
    						card += '    </div>';

    						card += '    <div class="card-info-footer">';
    						card += '      <div class="card-user">';
    						card += '        <span class="card-user-icon">👤</span>';
    						card += '        <a href="/userProfile.us?userId=' + item.user_id + '" class="card-user-name">' + item.user_name + '</a>';
    						card += '      </div>';
    						card += '      <div class="card-actions">';
    						card += '        <p class="card-created-at">예약 신청일: ' + item.reservation_created_at + '</p>';
    						// 아래 조건문 그대로

							if (item.payment_status === '완료') {
    							card += '      <span class="card-reserving-text">결제 완료</span>';
    						} 
    						else if (item.payment_status === '대기') {
    							card += '      <span class="card-reserving-text">결제 진행중</span>';
    						} 
    						else if (item.payment_status === '취소') {
    						  card += '      <span class="card-reserving-text">결제 취소</span>';
    						} 
    						else if (item.reservation_confirm === '보류') {
    						 	card += '      <button class="card-action-btn" onclick="reservation_confirm(\'' + item.reservation_id + '\')">승인</button>';
    							card += '      <button class="card-action-btn decline" onclick="reservation_decline(\'' + item.reservation_id + '\')">거절</button>';
    						} 
    						else if (item.reservation_confirm === '승인') {
    							card += '      <span class="card-reserving-text">결제 대기중</span>';
    						}
    						else if (item.reservation_confirm === '거절') {
      							card += '      <span class="card-reserving-text">거절되었습니다</span>';
      						}
    						else {
    							card += '      <span class="card-reserving-text">상태 알 수 없음</span>';
    						}
    						card += '    </div>';
    						card += '  </div>'; 
    						card += ' </div>';
    						card += '</div>'; 
    					});
    					
    					console.log(card);
   						container.innerHTML = card;
    				}
    				else if (res.code ==500) {
    					console.log('500');
    					
    					let card = '';
    					card += '<div class="card-container">';
    					card += '      <span class="card-none-text">예약 내역이 없습니다</span>';
    					card += '</div>';
    					container.innerHTML = card;
    				}	
    				else {
    					alert('실패');
    				}
				}	
			})
		} 		
 		
	
		// 승인, 거절 누를 시 실행되는 함수
		
		function reservation_confirm(reservation_id) {
			$.ajax({
				url: '${pageContext.request.contextPath}/reservation_confirm.hra',
				type: 'post',
				data: {'reservation_id': reservation_id},
				dataType: 'json',
				success: function(res) {
					console.log(res);
					if (res.code ==200) {
						pagestart();
					} else {
						alert('승인 실패');
					}
				}
			})
		}
		
		function reservation_decline(reservation_id) {
			$.ajax({
				url: '${pageContext.request.contextPath}/reservation_decline.hra',
				type: 'post',
				data: {'reservation_id': reservation_id},
				dataType: 'json',
				success: function(res) {
					console.log(res);
					if (res.code ==200) {
						pagestart();
					} else {
						alert('거절 실패');
					}
				}
			})
		}
		
		
	</script>	

</body>
</html>
