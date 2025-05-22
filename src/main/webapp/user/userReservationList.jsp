<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>이전 여행</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-900 font-sans antialiased" onload="pagestart()">

	<div>
		<%@ include file="header_default.jsp"%>
		<!-- 정적 포함 -->
	</div>

  <main class="max-w-4xl mx-auto px-6 py-12">
    <h1 class="text-2xl font-bold mb-8">이전 여행</h1>
	
	<div class="flex border-b border-gray-200">
	<button type="button" id="tab-upcoming" class="px-4 py-2 text-sm font-medium text-[#FF5A5F] border-b-2 border-[#FF5A5F]" 
		onclick="showUpcomingList()" >
    	다가오는 예약</button>
	<button type="button" id="tab-history" class="px-4 py-2 text-sm font-medium text-gray-500 hover:text-[#FF5A5F]" 
    	onclick="showHistoryList()">
    	지난 예약</button>
	</div>
	<div class="space-y-8">
		<div id="reservation-content"></div>
	</div>
	<br/>
    
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
    						
    						card += '<div class="flex items-center gap-4 mb-6">';
    						card += '<img src="'+ item.property_photo_url +'" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />';
    						card += '<div>';
    						card += '<h2 class="text-lg font-semibold">'+ item.property_name +'</h2>';
    						card += '<p class="text-sm text-gray-600">'+item.country + item.city +'</p>';
    						card += '<p class="text-sm text-gray-500">'+ item.reservation_check_in +' ~ '+ item.reservation_check_out +'</p>';
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
    						
    						card += '<div class="flex items-center gap-4 mb-6">';
    						card += '<img src="'+ item.property_photo_url +'" alt="숙소 이미지" class="w-28 h-28 rounded-lg object-cover" />';
    						card += '<div>';
    						card += '<h2 class="text-lg font-semibold">'+ item.property_name +'</h2>';
    						card += '<p class="text-sm text-gray-600">'+item.country + item.city +'</p>';
    						card += '<p class="text-sm text-gray-500">'+ item.reservation_check_in +' ~ '+ item.reservation_check_out +'</p>';
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
