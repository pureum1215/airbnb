<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		  <title>이전 여행</title>
		  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

	<%-- ---------------------------------------- 
				css 예시 부분
	------------------------------------------- 
    <div class="space-y-8">
      
      <!-- 여행 항목 1 -->
      <div class="flex items-center gap-4">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10248_2650.jpg" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />
        <div>
          <h2 class="text-lg font-semibold">Nanikei World</h2>
          <p class="text-sm text-gray-600">도쿄, 일본</p>
          <p class="text-sm text-gray-500">2023년 9월 11일 ~ 9월 15일</p>
        </div>
      </div>

      <!-- 여행 항목 2 -->
      <div class="flex items-center gap-4">
        <img src="https://cdn.travie.com/news/photo/202102/21745_10249_2656.jpg" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />
        <div>
          <h2 class="text-lg font-semibold">Paju Stay</h2>
          <p class="text-sm text-gray-600">파주시, 경기도</p>
          <p class="text-sm text-gray-500">2022년 7월 12일 ~ 7월 15일</p>
        </div>
      </div>

    </div>
     ---------------------------------------- 
				css 예시 부분
	------------------------------------------- --%>

		<div>
			<%@ include file="header_default.jsp"%>
			<!-- 정적 포함 -->
		</div>
	
	  <main class="max-w-4xl mx-auto px-6 py-12">
	    <h1 class="text-2xl font-bold mb-8">이전 여행</h1>
	    
		<div class="flex border-b border-gray-200">
		<button id="tab-upcoming" onclick="console.log('눌림'); showUpcoming()" 
	    	class="px-4 py-2 text-sm font-medium text-[#FF5A5F] border-b-2 border-[#FF5A5F]">
	    	다가오는 예약</button>
		<button id="tab-history" onclick="showHistory()" 
	    	class="px-4 py-2 text-sm font-medium text-gray-500 hover:text-[#FF5A5F]">
	    	지난 예약</button>
		</div>
		<div class="space-y-8">
			<div id="reservation-content"></div>
		</div>
		<br/>
	  </main>

	<script src="../jquery-3.7.1.min.js"></script>  
 	<script>
 		const contextPath = '${pageContext.request.contextPath}';	
 	
 	  	window.onload = function() {
 		    showUpcoming(); // 페이지 열자마자 다가오는 예약 먼저 불러오기
 		  };

		function showUpcoming() {
			setActiveTab('upcoming');
			loadUpcomingReservations();
 		}

 		function showHistory() {
			setActiveTab('history');
			loadHistoryReservations();
 		}

		function formatDate(dateStr) {
			  const date = new Date(dateStr);
			  const year = date.getFullYear();
			  const month = date.getMonth() + 1;
			  const day = date.getDate();

			  return '${year}년 ${month}월 ${day}일';
		}
		
 		function setActiveTab(tab) {
			const upcomingBtn = document.getElementById('tab-upcoming');
			const historyBtn = document.getElementById('tab-history');

			if (tab === 'upcoming') {
 		    	upcomingBtn.classList.add('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	historyBtn.classList.remove('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	historyBtn.classList.add('text-gray-500');
			} 
			else {
 		    	historyBtn.classList.add('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	upcomingBtn.classList.remove('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	upcomingBtn.classList.add('text-gray-500');
			}
		}
 	
		function loadUpcomingReservations() {
			$.ajax({
				url: contextPath + '/user_reservation_upcoming.ura',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					console.log('서버 응답:', data); 
					renderReservationList(data.data, '다가오는 예약이 없습니다.');
				},
				error: function(xhr, status, error) {
					console.error('다가오는 예약 조회 실패:', error);
				}
			});
		}

		function loadHistoryReservations() {
			$.ajax({
				url: contextPath + '/user_reservation_history.ura',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					console.log('서버 응답:', data); 
					renderReservationList(data.data, '지난 예약이 없습니다.');
				},
				error: function(xhr, status, error) {
					console.error('지난 예약 조회 실패:', error);
				}
			});
		}
		
		function renderReservationList(reservations, emptyMessage) {
			const container = document.getElementById('reservation-content');
			container.innerHTML = '';
			
			console.log('넘어온 예약 배열:', reservations);

			if (reservations.length === 0) {
				container.innerHTML = `<p class="text-gray-500">${emptyMessage}</p>`;
				return;
			}

			reservations.forEach(res => {
				console.log('예약 항목:', res);
				
				let card = '';
				card += `<div class="flex items-center gap-4 mb-6">`;
				card += `<img src="${res.propertyPhotoUrl}" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />`;
				card += `<div>`;
				card += `<h2 class="text-lg font-semibold">${res.propertyName}</h2>`;
				card += `<p class="text-sm text-gray-600">${res.locationCity}, ${res.locationCountry}</p>`;
				card += `<p class="text-sm text-gray-500">${res.reservationCheckIn} ~ ${res.reservationCheckOut}</p>`;
				card += `</div></div>`;
				container.innerHTML += card;
			});
			
			container.innerHTML += card;
		}

 		</script>
 		
 		
 		
 		
 		
 		
 		
 		
 		
 		
 <%--		
 	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>이전 여행</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased">

	<div>
		<%@ include file="header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="max-w-4xl mx-auto px-6 py-12">
    <h1 class="text-2xl font-bold mb-8">이전 여행</h1>
	
	<div class="flex border-b border-gray-200">
	<button id="tab-upcoming" onclick="console.log('눌림'); showUpcoming()" 
    	class="px-4 py-2 text-sm font-medium text-[#FF5A5F] border-b-2 border-[#FF5A5F]">
    	다가오는 예약</button>
	<button id="tab-history" onclick="showHistory()" 
    	class="px-4 py-2 text-sm font-medium text-gray-500 hover:text-[#FF5A5F]">
    	지난 예약</button>
	</div>
	<div class="space-y-8">
		<div id="reservation-content"></div>
	</div>
	<br/>
    
  </main>

	<script src="../jquery-3.7.1.min.js"></script>  
 	<script>
 	  const contextPath = '<%= request.getContextPath() %>';
 		console.log("contextPath:", contextPath);
 	  	window.onload = function() {
 		    showUpcoming(); // 페이지 열자마자 다가오는 예약 먼저 불러오기
 		  };

		function showUpcoming() {
			setActiveTab('upcoming');
			loadUpcomingReservations();
 		}

 		function showHistory() {
			setActiveTab('history');
			loadHistoryReservations();
 		}

		function formatDate(dateStr) {
			  const date = new Date(dateStr);
			  const year = date.getFullYear();
			  const month = date.getMonth() + 1;
			  const day = date.getDate();

			  return '${year}년 ${month}월 ${day}일';
		}
		
 		function setActiveTab(tab) {
			const upcomingBtn = document.getElementById('tab-upcoming');
			const historyBtn = document.getElementById('tab-history');

			if (tab === 'upcoming') {
 		    	upcomingBtn.classList.add('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	historyBtn.classList.remove('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	historyBtn.classList.add('text-gray-500');
			} 
			else {
 		    	historyBtn.classList.add('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	upcomingBtn.classList.remove('text-[#FF5A5F]', 'border-b-2', 'border-[#FF5A5F]');
 		    	upcomingBtn.classList.add('text-gray-500');
			}
		}
 	
		function loadUpcomingReservations() {
			$.ajax({
				url: contextPath + '/user_reservation_upcoming.ura',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					console.log('서버 응답:', data); 
					renderReservationList(data.data, '다가오는 예약이 없습니다.');
				},
				error: function(xhr, status, error) {
					console.error('다가오는 예약 조회 실패:', error);
				}
			});
		}

		function loadHistoryReservations() {
			$.ajax({
				url: contextPath + '/user_reservation_history.ura',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					console.log('서버 응답:', data); 
					renderReservationList(data.data, '지난 예약이 없습니다.');
				},
				error: function(xhr, status, error) {
					console.error('지난 예약 조회 실패:', error);
				}
			});
		}
		
		function renderReservationList(reservations, emptyMessage) {
			const container = document.getElementById('reservation-content');
			container.innerHTML = '';
			
			console.log('넘어온 예약 배열:', reservations);

			if (reservations.length === 0) {
				container.innerHTML = `<p class="text-gray-500">${emptyMessage}</p>`;
				return;
			}

			reservations.forEach(res => {
				console.log('예약 항목:', res);
				
				let card = '';
				card += '<div class="flex items-center gap-4 mb-6">';
				card += '<img src="'+ res.propertyPhotoUrl +'" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />';
				card += '<div>';
				card += '<h2 class="text-lg font-semibold">'+ res.propertyName +'</h2>';
				card += '<p class="text-sm text-gray-600">'+ res.locationCity + res.locationCountr +'</p>';
				card += '<p class="text-sm text-gray-500">'+ res.reservationCheckIn +' ~ '+ res.reservationCheckOut +'</p>';
				card += '</div></div>';
				container.innerHTML += card;
			});
			
		}

 	</script>
  --%>
</body>
</html>
 		
 		
 		
 		
 		
 		
 		
</body>
</html>