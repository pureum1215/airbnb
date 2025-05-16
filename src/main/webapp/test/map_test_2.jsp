<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    .wrap {
    	position: absolute;left: 0;
    	bottom: 40px;width: 288px;
    	height: 132px;
    	margin-left: -144px;
    	text-align: left;
    	overflow: hidden;
    	font-size: 12px;
    	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
    	line-height: 1.5;
    }
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;
    	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;
    	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
  </style>
</head>
<body>

<div id="map" style="width:100%;height:800px;"></div>
<img src="/uploads/img.png"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=991e8640696acefd76255f05e2328d69"></script>
<script>
  var mapContainer = document.getElementById('map'),
      mapOption = { 
          center: new kakao.maps.LatLng(33.451475, 126.570528),
          level: 3 
      }; 

  var map = new kakao.maps.Map(mapContainer, mapOption);

  var positions = [
      {
          title: '카카오 스페이스닷원',
          latlng: new kakao.maps.LatLng(33.450701, 126.570667),
          address: '제주특별자치도 제주시 첨단로 242',
          jibun: '(우) 63309 (지번) 영평동 2181',
          link: 'https://www.kakaocorp.com/main',
          img: '/uploads/img.png',
          grade: 1
      },
      {
          title: '강남',
          latlng: new kakao.maps.LatLng(33.451, 126.571),
          address: '서울시 강남구',
          jibun: '강남역 5번출구',
          link: 'https://www.bitacademy.com/',
          img: '/uploads/img2.png',
          grade: 2
      }
  ];

  var currentOverlay = null;

  positions.forEach(function(pos) {
	  
	  console.log('image');
	  console.log(pos);
	  
      var marker = new kakao.maps.Marker({
          map: map,
          position: pos.latlng
      });

      // DOM 요소로 content 만들기
      var content = document.createElement('div');
      content.className = 'wrap';
      
      //html 내용
      let contents = '';
      contents +='<div class="info">';
      contents +='<div class="title">';
      contents += pos.title;
      contents += '<div class="close" title="닫기" style="cursor:pointer;"></div>';
    	  contents += '</div>';
    	  contents +='<div class="body">';
    	  contents +='<div class="img">';
    	  contents +='<img src="'+pos.img+'" width="73" height="70">';
    	  contents +='</div>';
    	  contents +='<div class="desc">';
    	  contents +='<div class="ellipsis">'+pos.address+'</div>';
    	  contents +='<div class="jibun ellipsis">'+pos.jibun+'</div>';
    	  contents +='<div><a href="'+pos.link+'" target="_blank" class="link">홈페이지</a></div>';
    	  contents +='</div>';
   		  contents +='</div>';
 	 	  contents +='</div>';
      
      content.innerHTML = contents;

      var overlay = new kakao.maps.CustomOverlay({
          content: content,
          position: pos.latlng,
          yAnchor: 1
      });

      // 마커 클릭 시 오버레이 표시
      kakao.maps.event.addListener(marker, 'click', function() {
          if (currentOverlay) {
              currentOverlay.setMap(null);
          }
          overlay.setMap(map);
          currentOverlay = overlay;
      });

      // 닫기 버튼 이벤트 연결
      content.querySelector('.close').addEventListener('click', function() {
          overlay.setMap(null);
          currentOverlay = null;
      });
  });
  
//지도 클릭 시 오버레이 닫기
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
      if (currentOverlay) {
          // 클릭한 위치가 열려 있는 오버레이 영역이 아니면 닫기
          const overlayContent = currentOverlay.getContent();
          if (!overlayContent.contains(document.activeElement)) {
              currentOverlay.setMap(null);
              currentOverlay = null;
          }
      }
  });
  
  //하나의 html
  function kakaoOverlayDetail_1(pos) {
	  let contents = '';
      contents +='<div class="info">';
      contents +='<div class="title">';
      contents += pos.title;
      contents += '<div class="close" title="닫기" style="cursor:pointer;"></div>';
    	  contents += '</div>';
    	  contents +='<div class="body">';
    	  contents +='<div class="img">';
    	  contents +='<img src="'+pos.img+'" width="73" height="70">';
    	  contents +='</div>';
    	  contents +='<div class="desc">';
    	  contents +='<div class="ellipsis">'+pos.address+'</div>';
    	  contents +='<div class="jibun ellipsis">'+pos.jibun+'</div>';
    	  contents +='<div><a href="'+pos.link+'" target="_blank" class="link">홈페이지</a></div>';
    	  contents +='</div>';
   		  contents +='</div>';
 	 	  contents +='</div>';
 	 	  
 	 return contents;
  }
</script>


</body>
</html>