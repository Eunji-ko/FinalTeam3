<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #emp-img {
        margin: 0 auto;
        width: 180px;
        height: 180px;
        border: 8px solid #B0D9D1;
        border-radius: 20px;
        background-color: white;
        margin-bottom: 15px;
        overflow: hidden;
    }
  #emp-img > img {
      width: 100%;
      height: 100%;
      object-fit: cover;
  }
</style>
</head>
<body>
  <div class="modal fade" id="changeEmp" tabindex="-1" aria-labelledby="changeEmpLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="changeEmpLabel">사원 정보</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div id="emp-img">
            <img src="${imgPath}/none-profile.jpg">
          </div>
          <input type="hidden" name="no" value="1">
          <input type="text" class="form-control" name="name" value="테스트" disabled  style="margin-bottom: 10px;">
          <div class="form-floating" style="margin-bottom: 10px;">
            <select class="form-select" id="floatingDept" aria-label="Floating label select example">
              <option selected>-</option>
              <option value="1">인사부</option>
              <option value="2">총무부</option>
              <option value="3">회계부</option>
              <option value="4">영업부</option>
              <option value="5">마케팅부</option>
            </select>
            <label for="floatingDept">부서</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <select class="form-select" id="floatingPosi" aria-label="Floating label select example">
              <option value="1">사원</option>
              <option value="2">주임</option>
              <option value="3">대리</option>
              <option value="4">과장</option>
              <option value="5">차장</option>
              <option value="6">부장</option>
              <option value="7" selected>사장</option>
            </select>
            <label for="floatingPosi">직위</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="email" class="form-control" name="email" id="floatingEmail" value="test@checkmine.com">
            <label for="floatingEmail">이메일 주소</label>
          </div>
          <div class="form-floating">
            <input type="tel" class="form-control" name="phone" id="floatingPhone" value="010-1234-1234">
            <label for="floatingPhone">휴대폰 번호</label>
          </div> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn checkmine-btn">변경하기</button>
        </div>
      </div>
    </div>
  </div>

  </script>
</body>
</html>