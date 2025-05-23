<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인 - Airbnb</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Helvetica, Arial, sans-serif;
      background-color: #ffffff;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      width: 100%;
      max-width: 400px;
      background-color: #fff;
      padding: 32px;
      border-radius: 16px;
      box-shadow: 0 2px 16px rgba(0, 0, 0, 0.1);
      border: 1px solid #e0e0e0;
    }

    h1 {
      text-align: center;
      font-size: 22px;
      font-weight: 600;
      margin-bottom: 24px;
    }

    .form-group {
      margin-bottom: 16px;
    }

    input {
      width: 100%;
      padding: 14px;
      border: 1px solid #dddddd;
      border-radius: 12px;
      font-size: 16px;
      outline: none;
      transition: border-color 0.2s;
    }

    input:focus {
      border-color: #FF385C;
    }

    .btn {
      width: 100%;
      padding: 14px;
      background-color: #FF385C;
      color: white;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #e03150;
    }

    .register-link {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
      color: #484848;
    }

    .register-link a {
      color: #007bff;
      text-decoration: none;
      margin-left: 4px;
    }

    .register-link a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: #ff4444;
      font-size: 14px;
      margin-top: 10px;
      text-align: center;
    }
  </style>
</head>
<body>
<%
    String referer = request.getHeader("Referer");
	System.out.println("REFERER: " + referer);
    if (referer != null && !referer.contains("login")) {
        session.setAttribute("prevPage", referer);
    }
%>
    <div class="container">
        <h1>로그인</h1>
        <form action="${pageContext.request.contextPath}/loginProcess.me" method="post">
            <div class="form-group">
                <label for="user_email">이메일</label>
                <input type="text" id="user_email" name="user_email" required>
            </div>
            <div class="form-group">
                <label for="user_password">비밀번호</label>
                <input type="password" id="user_password" name="user_password" required>
            </div>
            <button type="submit" class="btn">로그인</button>
        </form>
        <div class="register-link">
            계정이 없으신가요? <a href="${pageContext.request.contextPath}/register.me">회원가입</a>
        </div>
    </div>
  </div>
</body>
</html>