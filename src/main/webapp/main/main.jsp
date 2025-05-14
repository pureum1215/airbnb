<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>에어비앤비 메인</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html, body {
      height: 100%;
      font-family: Arial, sans-serif;
      background: #fff;
    }

    .container {
      max-width: 1400px;
      margin: 0 auto;
      padding: 0;
    }

    header.navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 2px 0;
      border-bottom: 1px solid #ddd;
      position: sticky;
      top: 0;
      background-color: #fff;
      z-index: 100;
    }

    .logo img {
      height: 120px;
    }

    .search-bar {
      display: flex;
      align-items: center;
      border: 1px solid #ddd;
      border-radius: 9999px;
      background: #fff;
      box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 100%;
      transition: all 0.3s ease;
    }

    .search-section {
      flex: 1;
      padding: 12px 16px;
      font-size: 14px;
      display: flex;
      flex-direction: column;
      font-weight: 500;
      color: #333;
      white-space: nowrap;
      border-right: 1px solid #ddd;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .search-section:last-child {
      border-right: none;
    }

    .search-section:hover {
      background-color: #f7f7f7;
      border: 1px solid #ccc;
      z-index: 1;
      border-radius: 9999px;
    }

    .search-section div:first-child {
      font-size: 12px;
      font-weight: 600;
    }

    .search-section div:last-child {
      color: #888;
      font-weight: normal;
      font-size: 13px;
    }

    .search-bar button {
      background-color: #ff385c;
      color: white;
      border: none;
      border-radius: 50%;
      padding: 10px;
      margin-right: 8px;
      cursor: pointer;
      width: 32px;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .menu button {
      border: none;
      background: none;
      margin-left: 12px;
      font-size: 16px;
      cursor: pointer;
    }

    main.card-grid {
      padding: 24px 0;
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 24px;
    }

    .card {
      border: 1px solid #eee;
      border-radius: 12px;
      overflow: hidden;
      background: #fff;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      position: relative;
    }

    .card .tag {
      position: absolute;
      top: 12px;
      left: 12px;
      background: #fff;
      font-size: 12px;
      font-weight: bold;
      padding: 4px 8px;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .card-info {
      padding: 12px;
    }

    .card-info p {
      margin: 4px 0;
      font-size: 14px;
    }

    .location {
      font-weight: bold;
    }

    .rating {
      color: #ff385c;
      font-weight: bold;
    }

    .guest-review, .distance, .dates {
      color: #666;
      font-size: 13px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .filter-panel {
      margin-top: 8px;
      border: 1px solid #ddd;
      border-radius: 20px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 320px;
      background-color: #fff;
      display: none;
      position: absolute;
      z-index: 99;
    }

    .filter-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid #eee;
    }

    .filter-row:last-child {
      border-bottom: none;
    }

    .filter-row div:first-child {
      font-weight: bold;
    }

    .filter-controls {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .filter-controls button {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      border: 1px solid #ccc;
      background: #fff;
      font-weight: bold;
      cursor: pointer;
    }

    .filter-controls span {
      min-width: 20px;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="main_header.jsp" />
  <div class="container">
    <header class="navbar">
      <div class="logo">
        <img src="https://cdn.iconscout.com/icon/free/png-256/free-airbnb-2-282311.png" alt="Airbnb Logo" />
      </div>
      <div style="position: relative; display: flex; flex-direction: column; flex: 1; margin: 0 20px;">
        <div class="search-bar">
          <div class="search-section">
            <div>여행지</div>
            <div>여행지 검색</div>
          </div>
          <div class="search-section">
            <div>체크인</div>
            <div>날짜 추가</div>
          </div>
          <div class="search-section">
            <div>체크아웃</div>
            <div>날짜 추가</div>
          </div>
          <div class="search-section" onclick="toggleFilter()">
            <div>여행자</div>
            <div>게스트 추가</div>
          </div>
          <button>🔍</button>
        </div>
        <div id="filterPanel" class="filter-panel">
          <div class="filter-row">
            <div>성인<br><small>13세 이상</small></div>
            <div class="filter-controls">
              <button onclick="changeCount('adult', -1)">−</button>
              <span id="adultCount">0</span>
              <button onclick="changeCount('adult', 1)">+</button>
            </div>
          </div>
          <div class="filter-row">
            <div>어린이<br><small>2~12세</small></div>
            <div class="filter-controls">
              <button onclick="changeCount('child', -1)">−</button>
              <span id="childCount">0</span>
              <button onclick="changeCount('child', 1)">+</button>
            </div>
          </div>
          <div class="filter-row">
            <div>유아<br><small>2세 미만</small></div>
            <div class="filter-controls">
              <button onclick="changeCount('infant', -1)">−</button>
              <span id="infantCount">0</span>
              <button onclick="changeCount('infant', 1)">+</button>
            </div>
          </div>
          <div class="filter-row">
            <div>반려동물<br><small>보조동물을 동반하시나요?</small></div>
            <div class="filter-controls">
              <button onclick="changeCount('pet', -1)">−</button>
              <span id="petCount">0</span>
              <button onclick="changeCount('pet', 1)">+</button>
            </div>
          </div>
        </div>
      </div>
      <div class="menu">
        <button>호스트 모드로 전환</button>
        <button>🌐</button>
        <button>☰</button>
      </div>
    </header>

    <main class="card-grid">
      <script>
        const container = document.currentScript.parentElement;
        const imageUrls = [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCN-7h-kMHAyIcQMYpymhnpOdLV0nAnyHWXA&s",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2_ItxyF9TVbu9h8V0rrTPikT2EJZSge1_EQ&s",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1Hi_ftmmeGiIEIJtToWBje3NGzZpOTeA9FQ&s"
        ];

        const cardData = new Array(15).fill(0).map((_, i) => ({
          location: `한국 Yesan-gun`,
          distance: `${50 + i * 2}km 거리`,
          dates: `6월 ${9 + (i % 5)}일~${14 + (i % 3)}일`,
          review: `게스트 한마디 “깔끔하고 인테리어가 좋았어요!”`,
          price: `₩${(23000 + i * 1000).toLocaleString()} /박`,
          rating: `★ ${(4.5 + (i % 5) * 0.1).toFixed(2)}`,
          image: imageUrls[Math.floor(Math.random() * imageUrls.length)]
        }));

        cardData.forEach(data => {
          const card = document.createElement('div');
          card.className = 'card';
          card.innerHTML = `
            <div class="tag">게스트 선호</div>
            <img src="${data.image}" alt="숙소 이미지">
            <div class="card-info">
              <p class="location">${data.location} <span class="rating">${data.rating}</span></p>
              <p class="distance">${data.distance}</p>
              <p class="dates">${data.dates}</p>
              <p class="guest-review">${data.review}</p>
              <p class="price">${data.price}</p>
            </div>
          `;
          container.appendChild(card);
        });

        function toggleFilter() {
          const panel = document.getElementById('filterPanel');
          panel.style.display = panel.style.display === 'block' ? 'none' : 'block';
        }

        const counts = { adult: 0, child: 0, infant: 0, pet: 0 };

        function changeCount(type, delta) {
          counts[type] = Math.max(0, counts[type] + delta);
          document.getElementById(`${type}Count`).innerText = counts[type];
        }
      </script>
    </main>
  </div>
</body>
</html>
