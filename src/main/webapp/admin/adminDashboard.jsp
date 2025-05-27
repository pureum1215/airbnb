<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDashboard</title>
<style>
.main-content {
	margin-left: 280px;
	margin-top: 70px;
}

.section {
	width: 1570px;
}

/* 테이블 기본 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 1rem;
	table-layout: fixed;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #eee;
}


</style>
</head>
<body>

	<%@ include file="adminHeader.jsp"%>
	<%@ include file="adminSidebar.jsp"%>

	<div class="main-content">
		<div style="padding-top: 30px;">
			<%@ include file="adminDashboard_summary.jsp"%>
		</div>
		<%@ include file="adminDashboard_stats.jsp"%>
		<%@ include file="adminDashboard_user.jsp"%>
		<%@ include file="adminDashboard_listing.jsp"%>
		<%@ include file="adminDashboard_reservation.jsp"%>
		<%@ include file="adminDashboard_admin.jsp"%>
	</div>

</body>
</html>