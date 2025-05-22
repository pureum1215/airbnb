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
	  display: flex;                 /* flex */
	  align-items: center;          /* items-center */
	  gap: 16px;                    /* gap-4 */
	}
	
	.card-image {
	  width: 112px;                 /* w-28 */
	  height: 112px;                /* h-28 */
	  border-radius: 8px;           /* rounded-lg */
	  object-fit: cover;            /* object-cover */
	}
	
	.card-title {
	  font-size: 18px;              /* text-lg */
	  line-height: 28px;
	  font-weight: 600;             /* font-semibold */
	}
	
	.card-location {
	  font-size: 14px;              /* text-sm */
	  line-height: 20px;
	  color: #4B5563;               /* text-gray-600 */
	}
	
	.card-date {
	  font-size: 14px;              /* text-sm */
	  line-height: 20px;
	  color: #6B7280;               /* text-gray-500 */
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
		<%@ include file="header_default.jsp"%>
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
				upcomingBtn.classList.add('tab-active');
				upcomingBtn.classList.remove('tab-default');
				
				historyBtn.classList.remove('tab-active');
				historyBtn.classList.add('tab-default');
			} 
			else {
				historyBtn.classList.add('tab-active');
				historyBtn.classList.remove('tab-default');
				
				upcomingBtn.classList.remove('tab-active');
				upcomingBtn.classList.add('tab-default');
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
    						card += '<img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '<div>';
    						card += '<h2 class="card-title">' + item.property_name + '</h2>';
    						card += '<p class="card-location">' + item.country + item.city + '</p>';
    						card += '<p class="card-date">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</p>';
    						card += '</div></div>';
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
    						card += '<img src="/uploads/' + item.property_photo_url + '" alt="숙소 이미지" class="card-image" />';
    						card += '<div>';
    						card += '<h2 class="card-title">' + item.property_name + '</h2>';
    						card += '<p class="card-location">' + item.country + item.city + '</p>';
    						card += '<p class="card-date">' + item.reservation_check_in + ' ~ ' + item.reservation_check_out + '</p>';
    						card += '</div></div>';
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
