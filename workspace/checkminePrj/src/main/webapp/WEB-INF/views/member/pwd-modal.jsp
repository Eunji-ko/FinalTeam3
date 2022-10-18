<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="changePwdLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="changePwdLabel">비밀번호 변경</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="password" class="form-control" name="beforePwd" placeholder="기존 비밀번호">
          <br>
          <input type="password" class="form-control" name="newPwd" placeholder="새 비밀번호">
          <br>
          <input type="password" class="form-control" placeholder="새 비밀번호 확인">
          <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn checkmine-btn">신청하기</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>