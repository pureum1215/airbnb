
<%



// 더미 데이터 관련된 것들은 나중에 삭제 바랍니다.
// 더미 데이터 선언 (Controller 또는 Servlet에서 전달받을 수도 있음)
String listingTitle = "한옥 스테이 - 전주 한옥마을 중심";
int bedrooms = 2;
int beds = 2;
int bathrooms = 1;
int price = 100000;
String description = "전통 한옥에서의 특별한 하루를 보내보세요.";
String address = "전주시 완산구 풍남동3가";
String thumbnailUrl = "https://img.gqkorea.co.kr/gq/2020/07/style_5f02a9fd0f28d.jpg";

// 편의시설 리스트
String[] amenities = {"Wi-Fi", "에어컨", "난방", "부엌", "샤워실", "헤어드라이기", "무료주차장", "수영장", "헬스장", "반려동물 가능"};

// 숙소가 소유한 편의시설
String[] haveAmenities = {"Wi-Fi", "에어컨", "부엌", "샤워실", "수영장", "반려동물 가능"};

// 승인 요청 설정 ( true: 예약 요청, false: 즉시 예약)
boolean requestReservation = true;
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat"%>
<%
NumberFormat formatter = NumberFormat.getInstance();
String formattedPrice = formatter.format(price); // 100000 → "100,000"
%>


<!DOCTYPE html>
<html>
<head>
<title><%=listingTitle%> - 숙소 세부 정보</title>
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
			<div class="btn-group">
				<button class="btn-edit">수정 내용 저장</button>
			</div>
		</div>

		<!-- 대표 이미지 -->
		<div class="header">
		  <h2 class="title">대표 이미지 설정</h2>
		
		  <!-- 이미지 미리보기 -->
		  <img id="previewImage" class="preview" 
		       src="<%= thumbnailUrl %>" 
		       alt="이미지 미리보기" 
		       style="max-width: 300px; display: block; margin-bottom: 10px;" />
		
		  <!-- 파일 업로드 -->
		  <input type="file" id="imageInput" accept="image/*" />
		</div>
		<!-- 상단 제목 -->
		<div class="header">
			<h2 class="title">숙소 이름 설정</h2>
			<div class="input-wrapper">
				<input type="text" class="input-text" value="<%=listingTitle %>" placeholder="숙소 이름을 입력하세요."
					name="listingName" />
			</div>
		</div>

		<!-- 침실, 침대, 욕실 -->
		<div class="section-room">
		  <!-- 침실 -->
		  <div class="countbox">
		  	<div class="plusminus">
			  	<button class="btn-count" onclick="changeCount('bedrooms', -1)" style="padding-bottom:3px;">-</button>
			    <span id="bedrooms"><%=bedrooms%></span>
			    <button class="btn-count" onclick="changeCount('bedrooms', 1)">+</button>
		  	</div>
		    <span style="border-top: 1px solid black">rooms</span>
		  </div>
		
		  <!-- 침대 -->
		  <div class="countbox">
		  	<div class="plusminus">
		    	<button class="btn-count" onclick="changeCount('beds', -1)" style="padding-bottom:3px;">-</button>
		    	<span id="beds"><%=beds%></span>
		    	<button class="btn-count" onclick="changeCount('beds', 1)">+</button>
		    </div>
		    <span style="border-top: 1px solid black">beds</span>
		  </div>
		
		  <!-- 욕실 -->
		  <div class="countbox">
		  	<div class="plusminus">
			    <button class="btn-count" onclick="changeCount('bathrooms', -1)" style="padding-bottom:3px;">-</button>
			    <span id="bathrooms"><%=bathrooms%></span>
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
					<input type="text" class="input-text-price" value="<%=price %>" placeholder="금액을 입력하세요." name="listingName" />
					<span style="font-size: 20px; margin-left: 10px;"> 원(KRW)</span>
				</div>
			</div>
		</div>
		<!-- 숙소 위치 -->
		<div class="header">
			<h2 class="title">위치</h2>
			<div class="input-wrapper">
				<div style="display: flex;align-items: center;">
					<input type="text" class="input-text-address" value="<%=address %>" placeholder="숙소 위치를 입력하세요." name="listingName" />
				</div>
			</div>
		</div>
		<!-- 숙소 설명 -->
		<div class="header">
		  <h2 class="title">숙소 설명</h2>
		  <div class="input-wrapper">
		    <textarea class="input-textarea" name="listingDescription" placeholder="당신의 숙소를 소개해주세요."><%= description %></textarea>
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
		  </div>
		</div>
		
		<!-- 편의시설 -->
		<div class="section-amenity">
		  <h2 style="font-size: 24px;">편의시설</h2>
		  <div class="amenities">
		    <%
		    for (int i = 0; i < amenities.length; i++) {
		      boolean haveAmenitiesCheck = false;
		      for (int j = 0; j < haveAmenities.length; j++) {
		        if (amenities[i].equals(haveAmenities[j])) {
		          haveAmenitiesCheck = true;
		          break;
		        }
		      }
		      if (haveAmenitiesCheck) {
		    %>
		      <span class="property-amenities toggle-amenity"><%=amenities[i]%></span>
		    <%
		      } else {
		    %>
		      <span class="amenities toggle-amenity"><%=amenities[i]%></span>
		    <%
		      }
		    }
		    %>
		  </div>
		</div>

	</div>


	<div>
		<%@ include file="hostFooter.jsp"%>
	</div>


	<script>
		const imageInput = document.getElementById("imageInput");
		const previewImage = document.getElementById("previewImage");

		imageInput.addEventListener("change", function() {
			const file = imageInput.files[0];
			if (file) {
				const reader = new FileReader();
				reader.onload = function(e) {
					previewImage.src = e.target.result;
					previewImage.style.display = "block";
				}
				reader.readAsDataURL(file);
			}
		});
		
		

	<!-- 편의시설 토글 스크립트 -->
	  document.querySelectorAll('.toggle-amenity').forEach(el => {
	    el.addEventListener('click', () => {
	      el.classList.toggle('property-amenities');
	      el.classList.toggle('amenities');
	    });
	  });

	
	
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
	   } else if (clickedBtn.textContent.includes("예약 요청")) {
	     clickedBtn.className = "btn-request-ch";
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
	</script>

</body>
</html>


