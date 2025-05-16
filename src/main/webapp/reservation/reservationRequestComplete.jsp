<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 요청 완료</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Helvetica, Arial, sans-serif;
            background-color: #fff;
            color: #222;
        }

        .container {
            max-width: 1000px;
            margin: 60px auto;
            padding: 0 24px;
        }

        .complete-box {
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }

        .check-icon {
            font-size: 48px;
            color: #FF385C;
            margin-bottom: 16px;
        }

        .title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .description {
            font-size: 16px;
            color: #555;
            margin-bottom: 32px;
        }

        .listing-info {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin-bottom: 32px;
        }

        .listing-info img {
            width: 160px;
            height: 120px;
            border-radius: 12px;
            object-fit: cover;
            border: 1px solid #eee;
        }

        .listing-details {
            text-align: left;
            max-width: 400px;
        }

        .listing-details h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0 0 6px;
        }

        .listing-details p {
            font-size: 14px;
            color: #666;
            margin: 0;
        }

        .back-btn {
            background-color: #222;
            color: white;
            font-size: 16px;
            padding: 12px 24px;
            border: none;
            border-radius: 10px;
            text-decoration: none;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="complete-box">
            <div class="title">예약 요청이 완료되었습니다!</div>
            <div class="description">
                호스트가 예약 요청을 확인 중입니다.<br>
                확정 여부는 메시지 또는 이메일로 알려드릴게요.
            </div>

            <div class="listing-info">
                <img src="https://a0.muscache.com/im/pictures/miso/Hosting-123456/original.jpg" alt="숙소 이미지">
                <div class="listing-details">
                    <h3>파리 중심가에 위치한 로프트</h3>
                    <p>공동 주택 전체 ・ 슈퍼호스트</p>
                    <p>2025년 10월 31일 ~ 11월 2일 ・ 게스트 1명</p>
                </div>
            </div>

            <a href="mainPage.us" class="back-btn">숙소 목록으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
