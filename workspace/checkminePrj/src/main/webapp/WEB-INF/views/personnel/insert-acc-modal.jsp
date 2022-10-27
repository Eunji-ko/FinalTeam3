<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="${rootPath}/personnel/insertAcc" method="post" onsubmit="return checkAccInsert();">
    <div class="modal fade" id="insertAcc" tabindex="-1" aria-labelledby="insertAccLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="insertAccLabel">거래처 추가</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="corporate" id="floatingICorp">
              <label for="floatingICorp">거래처명 *</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="address" id="floatingIAddress">
              <label for="floatingIAddress">거래처 주소</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="tel" class="form-control" name="tel" id="floatingITel">
              <label for="floatingITel">거래처 전화번호 *</label>
            </div> 
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="fax" id="floatingIFax">
              <label for="floatingIFax">거래처 팩스번호</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="pname" id="floatingIPName">
              <label for="floatingIPName">담당자명 *</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="dept" id="floatingIPDept">
              <label for="floatingIPDept">담당자 부서</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="position" id="floatingIPPosition">
              <label for="floatingIPPosition">담당자 직급</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="tel" class="form-control phoneNumber" name="phone" id="floatingIPPhone">
              <label for="floatingIPPhone">담당자 전화번호</label>
            </div> 
            <div class="form-floating">
              <input type="email" class="form-control" name="email" id="floatingIPEmail">
              <label for="floatingIPEmail">이메일 주소</label>
            </div>
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn checkmine-btn" value="추가하기">
          </div>
        </div>
      </div>
    </div>
  </form>

  <script>
      
    function checkAccInsert() {

      let floatingICorp = $('#floatingICorp').val();
      let floatingITel = $('#floatingITel').val();
      let floatingIPName = $('#floatingIPName').val()

      if(floatingICorp.length == 0){
            alert("거래처명을 작성해주세요 !");
            return false;
      }

      if(floatingITel.length == 0){
            alert("거래처 전화번호를 작성해주세요 !");
            return false;
      }

      if(floatingIPName.length == 0){
            alert("담당자명을 작성해주세요 !");
            return false;
      }

      return true;

    }
  </script>
</body>
</html>