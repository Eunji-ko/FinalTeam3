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
  <div class="modal fade" id="changeAcc" tabindex="-1" aria-labelledby="changeAccLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="changeAccLabel">거래처 정보</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" value="1" name="no">
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="name" id="floatingName" value="(주)거래처">
            <label for="floatingName">거래처명</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="address" id="floatingAddress" value="">
            <label for="floatingAddress">거래처 주소</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="tel" class="form-control" name="tel" id="floatingTel" value="">
            <label for="floatingTel">거래처 전화번호</label>
          </div> 
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="fax" id="floatingFax" value="">
            <label for="floatingFax">거래처 팩스번호</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="pname" id="floatingPName" value="일번거">
            <label for="floatingPName">담당자명</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="dept" id="floatingPDept" value="">
            <label for="floatingPDept">담당자 부서</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="position" id="floatingPPosition" value="">
            <label for="floatingPPosition">담당자 직급</label>
          </div>
          <div class="form-floating" style="margin-bottom: 10px;">
            <input type="tel" class="form-control" name="phone" id="floatingPhone" value="010-1234-1234">
            <label for="floatingPhone">담당자 전화번호</label>
          </div> 
          <div class="form-floating">
            <input type="email" class="form-control" name="email" id="floatingEmail" value="trade1@checkmine.com">
            <label for="floatingEmail">이메일 주소</label>
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