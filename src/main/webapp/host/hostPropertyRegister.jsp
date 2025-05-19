<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>hostPropertyRegister</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        body.container {
            font-family: Arial, sans-serif;
            background: #fafafa;
            padding: 40px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ddd;
            margin-top: 8px;
            font-size: 15px;
        }
        textarea {
            resize: vertical;
            height: 100px;
        }
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }
        .checkbox-group label {
            font-weight: normal;
        }
        .checkbox-group input {
            margin-right: 6px;
        }
        .btn-submit {
            margin-top: 30px;
            padding: 14px 24px;
            background-color: #ff385c;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #e03150;
        }
    </style>
</head>
<body>
	<div>
		<%@ include file="../html/header_hostpage.jsp"%>
		<!-- 정적 포함 -->
	</div>

<div class="container" style="margin-top: 40px;">
    <h2>새 숙소 등록하기</h2>

    <form action="submitListing.jsp" method="post" enctype="multipart/form-data">
        <!-- 숙소 이름 -->
        <label for="title">숙소 이름</label>
        <input type="text" id="title" name="title" placeholder="예: 한옥 스테이 - 전주 한옥마을 중심" required>

        <!-- 숙소 유형 -->
        <label for="type">숙소 유형</label>
        <input type="text" id="type" name="type" placeholder="예: 전통 한옥, 아파트, 빌라" required>

        <!-- 수용 인원 -->
        <label for="guests">최대 수용 인원</label>
        <input type="number" id="guests" name="guests" min="1" required>

        <!-- 침실 / 침대 / 욕실 -->
        <label for="bedrooms">침실 수</label>
        <input type="number" id="bedrooms" name="bedrooms" min="0" required>

        <label for="beds">침대 수</label>
        <input type="number" id="beds" name="beds" min="0" required>

        <label for="bathrooms">욕실 수</label>
        <input type="number" id="bathrooms" name="bathrooms" min="0" required>

        <!-- 숙소 설명 -->
        <label for="description">숙소 설명</label>
        <textarea id="description" name="description" placeholder="숙소에 대한 자세한 설명을 입력하세요." required></textarea>

        <!-- 주소 -->
        <label for="address">주소</label>
        <input type="text" id="address" name="address" placeholder="예: 전주시 완산구 풍남동3가" required>

        <!-- 편의시설 -->
        <label>편의시설</label>
        <div class="checkbox-group">
            <label><input type="checkbox" name="amenities" value="Wi-Fi">Wi-Fi</label>
            <label><input type="checkbox" name="amenities" value="에어컨">에어컨</label>
            <label><input type="checkbox" name="amenities" value="주방">주방</label>
            <label><input type="checkbox" name="amenities" value="TV">TV</label>
            <label><input type="checkbox" name="amenities" value="세탁기">세탁기</label>
            <label><input type="checkbox" name="amenities" value="난방">난방</label>
        </div>

        <!-- 이미지 업로드 -->
        <label for="thumbnail">대표 이미지 업로드</label>
        <input type="file" id="thumbnail" name="thumbnail" accept="image/*" required>

        <!-- 등록 버튼 -->
        <button type="submit" class="btn-submit">숙소 등록</button>
    </form>
</div>
</body>
</html>
