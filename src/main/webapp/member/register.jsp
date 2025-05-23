<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입 - Airbnb</title>
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

    .login-link {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
      color: #484848;
    }

    .login-link a {
      color: #007bff;
      text-decoration: none;
      margin-left: 4px;
    }

    .login-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>회원가입</h1>
    <form action="${pageContext.request.contextPath}/registerProcess.me" method="post" onsubmit="return format()">
      <div class="form-group">
        <input type="email" name="user_email" placeholder="이메일" required>
      </div>
      <div class="form-group">
        <input type="text" name="user_name" placeholder="이름" required>
      </div>
      <div class="form-group">
        <input type="password" name="user_password" placeholder="비밀번호" required>
      </div>
      <div class="form-group">
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>
      </div>
      <div class="form-group">
        <input type="text" id="phoneInput" name="user_phone_number" placeholder="전화번호(예: 01012345678)" required>
      </div>
      <div class="form-group">
        <input type="text" id="birthdayInput" name="user_birthday" placeholder="생년월일 (예: 20000401)" required>
      </div>
      <button type="submit" class="btn">회원가입</button>
    </form>
    <div class="login-link">
      이미 계정이 있으신가요?
      <a href="${pageContext.request.contextPath}/login.me">로그인</a>
    </div>
  </div>
  
  <script>
	function format() {
		// 전화번호 처리
		  const phoneInput = document.getElementById("phoneInput");
		  let phone = phoneInput.value.replace(/[^0-9]/g, "");

		  if (phone.length === 11) {
		    phone = phone.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
		    phoneInput.value = phone;
		  } else {
		    alert("전화번호는 11자리 숫자여야 합니다.");
		    return false;
		  }

		  // 생년월일 처리
		  const birthdayInput = document.getElementById("birthdayInput");
		  let birthday = birthdayInput.value.replace(/[^0-9]/g, "");

		  if (birthday.length === 8) {
		    birthday = birthday.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3");
		    birthdayInput.value = birthday;
		  } else {
		    alert("생년월일은 8자리 숫자여야 합니다. 예: 20000401");
		    return false;
		  }

		  return true;
	}
	</script>
</body>
</html>
