<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ✅ 지도 보여줄 div -->
	<div id="map" style="width:100%; height:400px;"></div>
	
	<!-- ✅ 카카오 지도 API (autoload=false 사용) -->
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=991e8640696acefd76255f05e2328d69&autoload=false"></script>
	
	<script>
	  kakao.maps.load(function () {
	    // ✅ 지도 표시할 div와 옵션
	    var mapContainer = document.getElementById('map');
	    var mapOption = {
	      center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울시청
	      level: 3
	    };
	
	    // ✅ 지도 생성
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	
	    // ✅ 마커 위치
	    var markerPosition = new kakao.maps.LatLng(37.5665, 126.9780);
	
	    // ✅ 마커 생성
	    var marker = new kakao.maps.Marker({
	      position: markerPosition
	    });
	
	    // ✅ 마커 지도에 표시
	    marker.setMap(map);
	  });
	</script>

</body>
</html>