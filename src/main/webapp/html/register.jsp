<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .signup-container {
      width: 400px;
      padding: 30px;
      border: 1px solid #ddd;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      margin-bottom: 24px;
    }

    .form-group {
      margin-bottom: 16px;
    }

    select,
    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      box-sizing: border-box;
    }

    input[type="date"]::before {
      content: attr(placeholder);
      color: #aaa;
      margin-right: 10px;
    }

    button {
      width: 100%;
      background-color: #FF385C;
      color: white;
      padding: 14px;
      font-size: 16px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      margin-top: 20px;
    }

    button:hover {
      background-color: #e11e44;
    }
  </style>
</head>
<body>
  <div class="signup-container">
    <h2>회원가입</h2>
    <form action="registerProcess.jsp" method="post">
      
      <div class="form-group">
        <select name="countryCode">
          <option value="+82">한국 (+82)</option>
          <option value="+1">미국 (+1)</option>
          <option value="+81">일본 (+81)</option>
          <!-- 필요 시 추가 -->
        </select>
      </div>

      <div class="form-group">
        <input type="text" name="phoneNumber" placeholder="전화번호">
      </div>

      <div class="form-group">
        <input type="text" name="name" placeholder="이름">
      </div>

      <div class="form-group">
        <input type="date" name="birth" placeholder="생년월일">
      </div>

      <div class="form-group">
        <input type="email" name="email" placeholder="이메일">
      </div>

      <div class="form-group">
        <input type="text" name="username" placeholder="아이디">
      </div>

      <div class="form-group">
        <input type="password" name="password" placeholder="비밀번호">
      </div>

      <div class="form-group">
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인">
      </div>

      <button type="submit">계속</button>
    </form>
  </div>
</body>
</html>
    