<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="/property/upload" method="post" enctype="multipart/form-data">
    	<input type="text" name="title" placeholder="숙소 제목" />
	    <input type="file" name="image" />
    	<button type="submit">업로드</button>
	</form>
	
</body>
</html>