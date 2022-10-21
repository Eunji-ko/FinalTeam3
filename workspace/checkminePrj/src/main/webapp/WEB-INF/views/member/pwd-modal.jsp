<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="${rootPath}/member/changePwd" method="post" onsubmit="return check();">
    <div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="changePwdLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="changePwdLabel">비밀번호 변경</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" value="${loginMember.no}" name="no">
            <input type="password" class="form-control" name="oldPwd" placeholder="기존 비밀번호" style="margin-bottom: 10px;">

            <input type="password" class="form-control" name="newPwd" placeholder="새 비밀번호" style="margin-bottom: 10px;">

            <input type="password" class="form-control" name="newPwd2" placeholder="새 비밀번호 확인" style="margin-bottom: 10px;">
            
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn checkmine-btn" value="변경하기">
          </div>
        </div>
      </div>
    </div>
</form>

<script>
	const oldPwd = document.querySelector('input[name=oldPwd]');
  const pwd = document.querySelector('input[name=newPwd]');
  const pwd2 = document.querySelector('input[name=newPwd2]');

  function check(){

      //중복확인 했는지 체크
      if(oldPwd.value != ${loginPwd}){
          alert("기존 비밀번호가 틀립니다 !");
          return false;
      }

      //비밀번호 일치 여부
      if(pwd.value.length == 0 || pwd.value != pwd2.value){
          alert("비밀번호를 확인해주세요 !");
          return false;
      }

      return true;
  }
</script>

</body>
</html>