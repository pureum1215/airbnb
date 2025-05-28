<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat"%>
<%
//편의시설 리스트
String[] amenities = {"Wi-Fi", "에어컨", "난방", "부엌", "샤워실", "헤어드라이기", "무료주차장", "수영장", "헬스장", "반려동물 가능"};

String[] amenitiesArray = {};

String reservation_default ="예약 요청";

boolean requestReservation = true;

String hostId = (String)session.getAttribute("host_id");
%>


<!DOCTYPE html>
<html>
<head>
<title>숙소 등록</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	color: #222;
	background-color: #fff;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 640px !important;
	margin: auto;
	padding: 20px;
	font-family: Arial;
	margin: auto;
	margin-bottom: 20px;
}

.title {
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 10px;
	color: #222;
}

.thumbnail {
	width: 100%;
	max-width: 100%;
	height: auto;
	border-radius: 12px;
	display: block;
	margin: 0 auto 24px auto;
}

.header {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-top: 20px;
	margin-bottom: 40px;
}

.section-room {
	display: flex;
	gap: 60px;
	margin: 30px 0;
}


  .countbox {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
    margin-bottom: 10px;
    font-size: 16px;
  }

  .btn-count {
    width: 28px;
    height: 28px;
    font-size: 18px;
    cursor: pointer;
    border-radius: 2000px;
  }

  .btn-count:hover {
    background-color: #e0e0e0;
  }


.section-price, .section-address, .section-info, .section-amenity,
	.section-reserve {
	margin-top: 40px;
}

.section-price h2, .section-address h2, .section-info h2,
	.section-amenity h2, .section-reserve h2 {
	font-size: 22px;
	font-weight: 600;
	margin-top: 80px;
	margin-bottom: 12px;
	color: #222;
}

.section-price span, .section-address span, .section-info span {
	font-size: 18px;
	color: #444;
	line-height: 1.6;
}

/* 숙소가 소유하지 않은 편의시설 */
span.amenities {
	display: inline-block;
	margin: 5px 8px;
	background: #f7f7f7;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ddd;
	cursor: pointer;
}
span.amenities:hover {
	background: #e0e0e0;
	border-color: #bbb;
}

/* 숙소가 소유한 편의시설 */
.property-amenities {
	display: inline-block;
	margin: 5px 8px;
	background: #4DC6F4;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 14px;
	color: white;
	border: 1px solid #4DC6F4;
	cursor: pointer;
}
.property-amenities:hover {
	background: #32b3e5;
	border-color: #32b3e5;
}

.section-reserve button {
	font-size: 14px;
}

.top-box {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn-group {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
}

.btn-edit, .btn-delete {
	background-color: transparent;
	color: #222;
	padding: 12px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	transition: background-color 0.2s ease, box-shadow 0.2s ease;
}

/* 현재 선택O 항목 표시를 위한 버튼 style */
.btn-direct-ch, .btn-request-ch {
	color: white;
	background-color: #4DC6F4;
	border: 1px solid #4DC6F4;
	padding: 12px 20px;
	border-radius: 20px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	transition: background-color 0.2s ease, box-shadow 0.2s ease;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* 현재 선택X 항목 표시를 위한 버튼 style */
.btn-direct, .btn-request {
	color: gray;
	border: 1px solid gray;
	padding: 12px 20px;
	border-radius: 20px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	transition: background-color 0.2s ease, box-shadow 0.2s ease;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* Hover 효과: 연한 회색 배경 + 그림자 */
.btn-direct-ch:hover, .btn-request-ch:hover {
	color: white;
	background-color: #4DC6F4;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
}

/* Hover 효과: 연한 회색 배경 + 그림자 */
.btn-edit:hover, .btn-delete:hover, .btn-direct:hover, .btn-request:hover
	{
	background-color: #F3F4F6;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
}

/* 이미지 업로드 */
.preview {
	width: 100%;
	max-width: 400px;
	height: auto;
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 8px;
}

.input-wrapper {
  margin-top: 12px;
}

.input-textarea {
  width: 100%;
  min-height: 120px;
  padding: 14px 16px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 12px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
  resize: vertical;
  transition: all 0.3s ease;
  outline: none;
}

 .input-textarea:focus {
   border-color: #ff385c;
   box-shadow: 0 0 0 3px rgba(255, 56, 92, 0.2);
 }

.input-text {
	width: 100%;
	padding: 14px 16px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 12px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	outline: none;
}

.input-text-price {
	width: 70%;
	padding: 14px 16px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 12px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	outline: none;
}

.input-text-address {
	width: 70%;
	padding: 14px 16px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 12px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	outline: none;
}

.input-text:focus {
	border-color: #ff385c; /* Airbnb 메인 컬러 */
	box-shadow: 0 0 0 3px rgba(255, 56, 92, 0.2);
}

.plusminus {
	display: flex;
	align-items: center;
	gap: 5px;
	justify-content: center;
}
</style>
</head>
<body>
	<div>
		<%@ include file="hostHeader.jsp"%>
	</div>


	<div class="container">

		<div class="top-box" style="border-bottom: 1px solid #E5E7EB">
			<!-- Title: Listing -->
			<h2 class="title">Listing</h2>
			<!-- 관리 버튼 -->
			<div class="btn-group">											<!-- ★★★★★ 수정내용 저장 버튼: 저장후 페이지 이동 필요 ★★★★ -->
				<button class="btn-edit" onclick="createData()">생성</button>
			</div>
		</div>

		<!-- 대표 이미지 -->
		<div class="header">
		  <h2 class="title">대표 이미지 설정</h2>
		
		  <!-- 이미지 미리보기 -->
		  <img id="previewImage" class="preview" 
		       alt="이미지 미리보기" 
		       style="max-width: 300px; display: block; margin-bottom: 10px;" />
		
		  <!-- 파일 업로드 -->
		  <input type="file" id="imageInput" accept="image/*" />
		</div>
		<!-- 상단 제목 -->
		<div class="header">
			<h2 class="title">숙소 이름 설정</h2>
			<div class="input-wrapper">
				<input type="text" class="input-text" placeholder="숙소 이름을 입력하세요."
					name="listingName" />
			</div>
		</div>

		<!-- 침실, 침대, 욕실 -->
		<div class="section-room">
		  <!-- 침실 -->
		  <div class="countbox">
		  	<div class="plusminus">
			  	<button class="btn-count" onclick="changeCount('bedrooms', -1)" style="padding-bottom:3px;">-</button>
			    <span id="bedrooms">0</span>
			    <button class="btn-count" onclick="changeCount('bedrooms', 1)">+</button>
		  	</div>
		    <span style="border-top: 1px solid black">rooms</span>
		  </div>
		
		  <!-- 침대 -->
		  <div class="countbox">
		  	<div class="plusminus">
		    	<button class="btn-count" onclick="changeCount('beds', -1)" style="padding-bottom:3px;">-</button>
		    	<span id="beds">0</span>
		    	<button class="btn-count" onclick="changeCount('beds', 1)">+</button>
		    </div>
		    <span style="border-top: 1px solid black">beds</span>
		  </div>
		
		  <!-- 욕실 -->
		  <div class="countbox">
		  	<div class="plusminus">
			    <button class="btn-count" onclick="changeCount('bathrooms', -1)" style="padding-bottom:3px;">-</button>
			    <span id="bathrooms">0</span>
			    <button class="btn-count" onclick="changeCount('bathrooms', 1)">+</button>
		    </div>
		    <span style="border-top: 1px solid black">bathrooms</span>
		  </div>
		</div>

		<!-- 1박 당 가격 -->
		<div class="header">
			<h2 class="title">1박 가격</h2>
			<div class="input-wrapper">
				<div style="display: flex;align-items: center;">
					<input type="text" class="input-text-price" placeholder="금액을 입력하세요." name="price" />
					<span style="font-size: 20px; margin-left: 10px;"> 원(KRW)</span>
				</div>
			</div>
		</div>
		<!-- 숙소 위치 -->
		<div class="header">
			<h2 class="title">위치</h2>
			<div class="input-wrapper" onclick="onclickAddr()" >
			<input type="text" class="input-text-address"  placeholder="숙소 위치를 입력하세요." name="address" 
				id ="address_detail" />
				<div style="width:500px;height:400px;" flex;align-items: center;" id= "map">
					
				</div>
			</div>
		</div>
		<!-- 숙소 설명 -->
		<div class="header">
		  <h2 class="title">숙소 설명</h2>
		  <div class="input-wrapper">
		    <textarea class="input-textarea" name="listingDescription" placeholder="당신의 숙소를 소개해주세요."></textarea>
		  </div>
		</div>
		<!-- 승인 요청 설정 -->
		<div class="section-reserve">
		  <h2 style="font-size: 24px;">승인 요청 설정</h2>
		  <div>
		    <%
		    if (requestReservation != true) {
		    %>
		    <button class="btn-direct-ch" onclick="selectReserveType(this)">즉시 예약</button>
		    <button class="btn-request" onclick="selectReserveType(this)">예약 요청</button>
		    <%
		    } else {
		    %>
		    <button class="btn-direct" onclick="selectReserveType(this)">즉시 예약</button>
		    <button class="btn-request-ch" onclick="selectReserveType(this)">예약 요청</button>
		    <%
		    }
		    %>
			<input type="hidden" id="reservation_default" name="reservation_default" value="<%= requestReservation ? "예약 요청" : "즉시 가능" %>">

		  </div>
		</div>
	
		<!-- 편의시설 -->
		<div class="section-amenity">
		  <h2 style="font-size: 24px;">편의시설</h2>
		  <div class="amenities">
		  <%
		    for (int i = 0; i < amenities.length; i++) {
		      boolean haveAmenitiesCheck = false;
		      for (int j = 0; j < amenitiesArray.length; j++) {
		        if (amenities[i].equals(amenitiesArray[j])) {
		          haveAmenitiesCheck = true;
		          break;
		        }
		      }
		      if (haveAmenitiesCheck) {
		    %>
		      <span class="property-amenities toggle-amenity" data-property-amenities="true"><%=amenities[i]%></span>
		    <%
		      } else {
		    %>
		      <span class="amenities toggle-amenity" data-property-amenities="false"><%=amenities[i]%></span>
		    <%
		      }
		    }
		    %>
		  </div>
		</div>
	</div>
	<input type="hidden" id="hostId" name="hostId" value="<%= hostId%>">	

	<div>
		<%@ include file="hostFooter.jsp"%>
	</div>

	<script src="../jquery-3.7.1.min.js"></script>  

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17e9a78b24113575792c87c68f10fcb1&libraries=services">
</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	
	//const address_detail = document.getElementById("address_detail");
	mapLocation("서울 종로구 사직로 161");
	let addr_detail;
	let lng = 100;//경도
	let lat = 20;//위도
	
	function onclickAddr(){
		new daum.Postcode({
		    oncomplete: function(data) {
		        //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
		        //주소
		        $("#address_detail").val(data.address);
		        mapLocation(data.address);
		        addr_detail = data.address;
		    }
		}).open();
	}
	function mapLocation(addr){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        lng = coords.getLng();
		        lat = coords.getLat();
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리 숙소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	}

	

	<!-- 편의시설 토글 스크립트 -->
	  document.querySelectorAll('.toggle-amenity').forEach(el => {
	    el.addEventListener('click', e => {
	    	//선택 값 변경하기
	    	const targetObj = e.target.getAttribute("data-property-amenities");
	    	if(targetObj == 'true') {
	    		e.target.setAttribute('data-property-amenities', 'false');
	    	} else {
	    		e.target.setAttribute('data-property-amenities', 'true');
	    	}
	    	
	      el.classList.toggle('property-amenities');
	      el.classList.toggle('amenities');
	    });
	  });

	  const hidden_reservation = document.getElementById('reservation_default');
	
	<!-- 승인요청설정 토글 -->
	 function selectReserveType(clickedBtn) {
	   const buttons = clickedBtn.parentElement.querySelectorAll("button");
	
	   buttons.forEach(btn => {
	     if (btn.textContent.includes("즉시 예약")) {
	       btn.className = "btn-direct";
	     } else if (btn.textContent.includes("예약 요청")) {
	       btn.className = "btn-request";
	     }
	   });
	
	   // 클릭한 버튼에 강조 클래스 부여
	   if (clickedBtn.textContent.includes("즉시 예약")) {
	     clickedBtn.className = "btn-direct-ch";
	     hidden_reservation.value = "즉시 가능";
	   } else if (clickedBtn.textContent.includes("예약 요청")) {
	     clickedBtn.className = "btn-request-ch";
	     hidden_reservation.value = "예약 요청";
	   }
	 }
	 
	 /* 침실,침대,욕실 */
	function changeCount(id, delta) {
	    const countSpan = document.getElementById(id);
	    let current = parseInt(countSpan.textContent);
	
	    if (isNaN(current)) current = 0;
	
	    const newValue = current + delta;
	
	    // 최소 0으로 제한
	    if (newValue >= 0) {
	      countSpan.textContent = newValue;
	    }
	  }
	 
	function createData(){
		alert('생성');
		
		let addr_detail;//자세한 주소
		let lng = 100;//경도
		let lat = 20;//위도
		
		//property_id 는 생성시켜야 함.
		// amenitiesArray 수집
	    const amenitySpans = document.querySelectorAll('span[data-property-amenities="true"]');
		let amenitiesArray = [];
		for(let i=0; i< amenitySpans.length; i++) {
			let target = amenitySpans[i].innerText;
			amenitiesArray.push(target);
		}

		
		
	    const data = {
	    	hostId: document.querySelector('input[name="hostId"]').value,
	    	reservation_default: hidden_reservation.value,
	        listingTitle: document.querySelector('input[name="listingName"]').value,
	        rooms: document.getElementById("bedrooms").innerText,
	        beds: document.getElementById("beds").innerText,
	        bathrooms: document.getElementById("bathrooms").innerText,
	        price: document.querySelector('.input-text-price').value,
	        description: document.querySelector('textarea[name="listingDescription"]').value,
	        amenitiesArray: amenitiesArray.join(','), // 배열 추가
	        address: addr_detail,
	       	address_lng :lng,
	       	address_lat :lat
	    };
	    
	    
	    console.log('data', data);

	    
/* 		$.ajax({
			type : 'post',
			data : data,
			dataType : 'json',
			url : 'host_register.hda',
			success : function(res) {
				console.log(res);
				//여기에 성공했을 때,
				location.href = 'hostList.ho';
			}
		}); */
		//주석 처리한 이유는 data 확인.
	}
	 
	 
	</script>

</body>
</html>


