<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="${rootPath}/personnel/editAcc" method="post" onsubmit="return checkAcc();">
    <div class="modal fade" id="changeAcc" tabindex="-1" aria-labelledby="changeAccLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="changeAccLabel">거래처 정보</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" id="modalANo" name="no">
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="corporate" id="floatingCorp" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingCorp">거래처명 *</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="address" id="floatingCAddress" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingCAddress">거래처 주소</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="tel" class="form-control" name="tel" id="floatingTel" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingTel">거래처 전화번호 *</label>
            </div> 
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="fax" id="floatingFax" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingFax">거래처 팩스번호</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="pname" id="floatingPName" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPName">담당자명 *</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="dept" id="floatingPDept" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPDept">담당자 부서</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="text" class="form-control" name="position" id="floatingPPosition" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPPosition">담당자 직급</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <input type="tel" class="form-control phoneNumber" name="phone" id="floatingPPhone" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPPhone">담당자 전화번호</label>
            </div> 
            <div class="form-floating">
              <input type="email" class="form-control" name="email" id="floatingPEmail" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPEmail">이메일 주소</label>
            </div>
          </div>
          <c:if test="${fn:contains(loginMember.permission, 'H')}">
            <div class="modal-footer">
              <input type="submit" class="btn checkmine-btn" value="변경하기">
            </div>
          </c:if>
        </div>
      </div>
    </div>
  </form>

  <script>
    $('.accModal').on("click", function() {
      let no = $(this).children('th').html();
      $.ajax({
        url: "/checkmine/personnel/accModal",
        type: 'GET',
        data : {no : no},
        success : function(data){
          if(data == null){
            alert("거래처 정보를 조회하는데에 실패하였습니다 !")
          }else{
            $('#modalANo').val(no);
            $('#floatingCorp').val(data.corporate);
            $('#floatingCAddress').val(data.address);
            $('#floatingTel').val(data.tel);
            $('#floatingFax').val(data.fax);
            $('#floatingPName').val(data.pname);
            $('#floatingPDept').val(data.dept);
            $('#floatingPPosition').val(data.position);
            $('#floatingPPhone').val(data.phone);
            $('#floatingPEmail').val(data.email);
          }
        }
      })
    })
  </script>

  <script>
    
    function checkAcc() {

      let floatingCorp = $('#floatingCorp').val();
      let floatingTel = $('#floatingTel').val();
      let floatingPName = $('#floatingPName').val()

      if(floatingCorp.length == 0){
            alert("거래처명을 작성해주세요 !");
            return false;
      }

      if(floatingTel.length == 0){
            alert("거래처 전화번호를 작성해주세요 !");
            return false;
      }

      if(floatingPName.length == 0){
            alert("담당자명을 작성해주세요 !");
            return false;
      }

      return true;

      }
  </script>
</body>
</html>