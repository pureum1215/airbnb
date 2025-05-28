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
    
    #emailUniqueCheck {
    	font-size: 12px;
    	font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>회원가입</h1>
    <form action="${pageContext.request.contextPath}/registerProcess.me" method="post" onsubmit="return format()">
      <div class="form-group" style="margin-bottom:0px;">
        <input type="email" id="emailInput" name="user_email" placeholder="이메일" required onkeyup="emailCheck()">
      </div>
      <span id="emailUniqueCheck"></span>
      <div class="form-group" style="margin-top:16px;">
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
  
  <script src="../jquery-3.7.1.min.js"></script>  
  <script>
	function format() {
		
		/***************** KJS- 수정 中 *************************************************************************/
		
		// 이메일 처리
		/*
		  const emailInput = document.getElementById("emailInput");

		  if (true) {
		    
		  } else {
		    alert("동일한 이메일 주소를 보유한 회원이 존재하여 가입할 수 없습니다.");
		    return false;
		  }
		  */
		if(idUniqueCheck) {
			alert('아이디 유효성 검사 확인해 주세요.');
		}
		
		/***************** KJS- 수정 中 *************************************************************************/
		
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
	
	
	/****
	 * 아이디 유효성 검사, 비동기
	 * - 사용자가 입력한 이메일 형식이 유효한지 간단히 체크하고,
	 * - 서버에 AJAX 요청을 보내 중복 여부를 확인함.
	 ****/

	// 아이디 중복 체크 결과 상태 저장 변수 (true면 중복 없음, false면 중복 있음)
	let idUniqueCheck = true;

	// 이메일 입력란 DOM 요소 가져오기
	const emailInput = document.getElementById("emailInput");

	// 이메일 유효성 및 중복 검사 함수
	function emailCheck() {
	    // 우선 중복 체크 상태를 true로 초기화 (중복 없음 상태)
	    idUniqueCheck = true;
	    
	    // 이메일 길이가 5자 미만이면 검사 중단하고 표시 초기화
	    if(emailInput.value.length < 5) {
	        emailUniqueCheck.innerHTML = ''; // 안내 메시지 초기화
	        return ;
	    } 
	    
	    // 이메일에 '@' 문자가 없으면 검사 중단하고 표시 초기화
	    if(emailInput.value.indexOf('@') == -1) {
	        emailUniqueCheck.innerHTML = ''; // 안내 메시지 초기화
	        return ;
	    }
	    
	    // 이메일에 '.' 문자가 없으면 검사 중단하고 표시 초기화
	    if(emailInput.value.indexOf('.') == -1) {
	        emailUniqueCheck.innerHTML = ''; // 안내 메시지 초기화
	        return ;
	    }
	    
	    // 유효한 이메일 형식으로 판단되면 AJAX 요청을 서버에 보냄
	    $.ajax({
	        url: '${pageContext.request.contextPath}/member_idcheck.mia',  // 서버 API 주소
	        data: {
	            'member_email': emailInput.value  // 요청 파라미터에 이메일 값 포함
	        },
	        type: 'post',       // POST 방식으로 요청
	        dataType: 'json',   // 응답 데이터를 JSON 형식으로 기대
	        success: function(res) {   // res라는 변수를 여기서 지정한 것. 바꿔도 상관 없음
	            // 서버로부터 받은 응답을 처리하는 콜백 함수
	            const emailUniqueCheck = document.getElementById('emailUniqueCheck'); // 결과 출력용 DOM 요소

	            if(res.code === 200) {   // ResponseData.java 안에 있는 code를 가져옴.
	                // 200: 사용 가능한 이메일일 경우
	                emailUniqueCheck.style.color = 'green'; // 글자색 녹색으로 설정
	                emailUniqueCheck.innerHTML = '🟢 사용이 가능한 아이디 입니다.'; // 안내 메시지 출력
	                idUniqueCheck = false; // 중복 상태 false로 변경 (사용 가능 표시)
	            } else if(res.code === 500) {
	                // 500: 사용 불가능한 이메일일 경우
	                emailUniqueCheck.style.color = 'red'; // 글자색 빨간색으로 설정
	                emailUniqueCheck.innerHTML = '🔴 사용이 불가능한 아이디 입니다.'; // 안내 메시지 출력
	            }
	        }
	    });
	}
	</script>
</body>
</html>
