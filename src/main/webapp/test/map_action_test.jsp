<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>카카오 지도 커스텀 오버레이 예제</title>
  <style>
    #map { width: 100%; height: 800px; }
    .customoverlay {
      padding: 10px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.3);
      max-width: 250px;
      font-family: Arial, sans-serif;
    }
    .customoverlay img {
      width: 100%;
      border-radius: 5px;
      margin-bottom: 8px;
    }
    .customoverlay h4 {
      margin: 0 0 5px 0;
      font-size: 16px;
      color: #333;
    }
    .customoverlay p {
      margin: 0 0 8px 0;
      font-size: 14px;
      color: #555;
    }
    .customoverlay a {
      display: inline-block;
      padding: 6px 12px;
      background: #3c82f6;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      font-weight: bold;
    }
    .customoverlay a:hover {
      background: #2a62c4;
    }
  </style>
</head>
<body>
  <h2>카카오 지도 커스텀 오버레이 예제</h2>
  <div id="map"></div>

  <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=991e8640696acefd76255f05e2328d69&autoload=false"></script>
  <script>
    var locations = [
      {
        lat: 37.5665,
        lng: 126.9780,
        name: "서울 시청",
        url: "https://map.kakao.com/link/map/서울시청",
        img: "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/14Fa/image/joib7vCDm4iIP7rNJR2ojev0A20.jpg",
        desc: "서울 시청은 서울특별시의 행정 중심지입니다."
      },
      {
        lat: 37.5700,
        lng: 126.9820,
        name: "덕수궁",
        url: "https://map.kakao.com/link/map/덕수궁",
        img: "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/14Fa/image/joib7vCDm4iIP7rNJR2ojev0A20.jpg",
        desc: "덕수궁은 조선시대의 궁궐 중 하나입니다."
      },
      {
        lat: 37.5651,
        lng: 126.9895,
        name: "을지로입구역",
        url: "https://map.kakao.com/link/map/을지로입구역",
        img: "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/14Fa/image/joib7vCDm4iIP7rNJR2ojev0A20.jpg",
        desc: "을지로입구역은 서울 지하철 2호선 역입니다."
      }
    ];

    kakao.maps.load(function() {
      var mapContainer = document.getElementById('map');
      var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 4
      };
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var currentOverlay = null;

      // 지도 클릭 시 오버레이 닫기
      kakao.maps.event.addListener(map, 'click', function() {
        if(currentOverlay) {
          currentOverlay.setMap(null);
          currentOverlay = null;
        }
      });

      locations.forEach(function(loc) {
        var markerImage = new kakao.maps.MarkerImage(
          "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
          new kakao.maps.Size(24, 35)
        );

        var marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(loc.lat, loc.lng),
          image: markerImage,
          title: loc.name
        });

        var content = `
          <div class="customoverlay">
            <img src="${loc.img}" alt="${loc.name}" />
            <h4>${loc.name}</h4>
            <p>${loc.desc}</p>
            <a href="${loc.url}" target="_blank">바로가기</a>
          </div>
        `;

        var overlay = new kakao.maps.CustomOverlay({
          content: content,
          position: marker.getPosition(),
          yAnchor: 1
        });

        kakao.maps.event.addListener(marker, 'click', function() {
          if(currentOverlay) {
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
