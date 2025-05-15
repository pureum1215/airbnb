<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>카카오 지도 테스트</title>
  <meta charset="UTF-8">
  <style>
    #map { width: 100%; height: 400px; }
    .customoverlay {
      position: relative;
      bottom: 40px;
      background: white;
      border: 1px solid #888;
      border-radius: 8px;
      padding: 10px;
      font-size: 13px;
      width: 250px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.3);
    }
    .customoverlay img {
      width: 100%;
      height: auto;
      border-radius: 4px;
    }
    .customoverlay h4 {
      margin: 10px 0 5px;
      font-size: 16px;
    }
    .customoverlay p {
      margin: 0;
      font-size: 13px;
    }
    .customoverlay a {
      display: block;
      margin-top: 8px;
      color: #0066cc;
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <h2>카카오 지도 오버레이 테스트</h2>
  <div id="map"></div>

  <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=991e8640696acefd76255f05e2328d69&autoload=false"></script>
  <script>
    kakao.maps.load(function () {
      var mapContainer = document.getElementById('map');
      var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 3
      };
      var map = new kakao.maps.Map(mapContainer, mapOption);

      var locations = [
        {
          lat: 37.5665,
          lng: 126.9780,
          name: "서울 시청",
          img: "http://localhost:8080/uploads/img.png", // <-- 여기에 실제 있는 이미지 경로
          desc: "서울의 중심부에 위치한 시청입니다.",
          url: "https://map.kakao.com/link/map/서울시청"
        }
      ];

      var currentOverlay = null;

      kakao.maps.event.addListener(map, 'click', function () {
        if (currentOverlay) {
          currentOverlay.setMap(null);
          currentOverlay = null;
        }
      });

      locations.forEach(function (loc) {
        var marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(loc.lat, loc.lng),
          title: loc.name
        });

        var content = `
          <div class="customoverlay">
            <img src="${loc.img}" alt="${loc.name}">
            <h4>${loc.name}</h4>
            <p>${loc.desc}</p>
            <a href="${loc.url}" target="_blank">자세히 보기</a>
          </div>
        `;
        
        console.log(content);

        var overlay = new kakao.maps.CustomOverlay({
          content: content,
          position: marker.getPosition(),
          yAnchor: 1
        });

        kakao.maps.event.addListener(marker, 'click', function () {
          if (currentOverlay) {
            currentOverlay.setMap(null);
          }
          overlay.setMap(map);
          currentOverlay = overlay;
        });
      });
    });
  </script>
</body>
</html>
