<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<script>
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
