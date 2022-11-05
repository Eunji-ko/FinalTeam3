<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .id-pwd-page{
        margin-left: 300px;
        margin-top: 100px;
        width: 750px;
        height: 500px;
        display: flex;
        align-items: center;
        justify-items: center;
    }
    .id-pwd-page *{
        margin: 0 auto;;
    }
</style>
</head>
<body>
	<div class="id-pwd-page">
    <button type="button" class="checkmine-btn" data-bs-toggle="modal" data-bs-target="#checkEmpModal">사원정보 인증</button>
    <br>
    <a id="kakao-login-btn" href="javascript:loginWithKakao()">
        <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="240"
            alt="카카오 로그인 버튼" />
    </a>
    <p id="token-result"></p>
  </div>
  <button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>





<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous">
</script>

<script>
  Kakao.init('79bcbc07b59703b3bb44d05e91ab8b4d'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://localhost:8888/checkmine/member/kakaoLogin',
      state: 'userme',
      scope: 'account_email'
    });
  }

  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
      data: {
        scopes: ['phone_number']
      }
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('79bcbc07b59703b3bb44d05e91ab8b4d');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>

<%@ include file="/WEB-INF/views/member/checkEmp-modal.jsp" %>

</body>
</html>