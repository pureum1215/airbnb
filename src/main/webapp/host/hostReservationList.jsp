<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%
class Reservation {
	String guestName;
	String listingTitle;
	String imageUrl;
	Date checkIn;
	Date checkOut;
	String status;

	public Reservation(String guestName, String listingTitle, String imageUrl, Date checkIn, Date checkOut,
	String status) {
		this.guestName = guestName;
		this.listingTitle = listingTitle;
		this.imageUrl = imageUrl;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.status = status;
	}
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
List<Reservation> reservations = new ArrayList<>();
reservations.add(new Reservation("김영희", "한옥 스테이 - 전주",
		"https://static9.depositphotos.com/1029202/1109/i/450/depositphotos_11092305-stock-photo-luxury-house.jpg",
		sdf.parse("2025-06-10"), sdf.parse("2025-06-12"), "확정"));
reservations.add(new Reservation("이철수", "서울 중심 아파트",
		"https://modo-phinf.pstatic.net/20160324_129/1458757863460d2Vow_JPEG/mosanu2gjd.jpeg?type=w720",
		sdf.parse("2025-06-15"), sdf.parse("2025-06-18"), "대기 중"));
reservations.add(new Reservation("박민수", "부산 해운대 뷰",
		"https://www.knnews.co.kr/edb/nimages/2011/08/20110804.01010114000001.04L.jpg", sdf.parse("2025-07-01"),
		sdf.parse("2025-07-03"), "취소됨"));
%>

<!DOCTYPE html>
<html>
<head>
<title>숙소 예약 리스트</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
body.container {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	padding: 40px;
}

.container {
	max-width: 1000px;
	margin: auto;
}

.container h2 {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 30px;
	color: #222;
}

.card {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	background: white;
	border-radius: 16px;
	padding: 20px;
	margin-bottom: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.card img {
	width: 140px;
	height: 100px;
	object-fit: cover;
	border-radius: 12px;
	margin-right: 20px;
}

.card-content {
	flex: 1;
}

.card-content h3 {
	margin: 0 0 10px;
	font-size: 18px;
}

.card-content p {
	margin: 4px 0;
	color: #555;
}

.card-actions {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
}

.card-actions button {
	padding: 8px 14px;
	margin-top: 5px;
	font-size: 14px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
}

.approve-btn {
	background-color: #34c759;
	color: white;
}

.reject-btn {
	background-color: #ff3b30;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="../html/header_hostpage.jsp"%>

	<div class="container">
		<br>
		<h2>예약 목록</h2>

		<%
		for (Reservation r : reservations) {
		%>
		<div class="card">
			<img src="<%=r.imageUrl%>" alt="숙소 이미지">
			<div class="card-content">
				<h3><%=r.listingTitle%></h3>
				<p>
					게스트: <strong><%=r.guestName%></strong>
				</p>
				<p>
					체크인:
					<%=sdf.format(r.checkIn)%></p>
				<p>
					체크아웃:
					<%=sdf.format(r.checkOut)%></p>
			</div>
			<div class="card-actions">
				<button class="approve-btn">승인</button>
				<button class="reject-btn">거절</button>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
