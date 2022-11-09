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
  <form action="${rootPath}/personnel/editEmp" method="post">
    <div class="modal fade" id="changeEmp" tabindex="-1" aria-labelledby="changeEmpLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="changeEmpLabel">사원 정보</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div id="emp-img">
              <img src="${imgPath}/none-profile.png" id="empModalImg">
            </div>
            <input type="hidden" id="modalENo" name="no">
            <input type="text" class="form-control" id="modalName" name="name" disabled  style="margin-bottom: 10px;">
            <div class="form-floating" style="margin-bottom: 10px;">
              <select class="form-select" id="floatingDept" name="deptNo" aria-label="Floating label select example" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
                <option value="1" selected>-</option>
                <option value="2">인사부</option>
                <option value="3">총무부</option>
                <option value="4">회계부</option>
                <option value="5">영업부</option>
                <option value="6">마케팅부</option>
              </select>
              <label for="floatingDept">부서</label>
            </div>
            <div class="form-floating" style="margin-bottom: 10px;">
              <select class="form-select" id="floatingPosi" name="posNo" aria-label="Floating label select example" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
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
              <input type="email" class="form-control" name="email" id="floatingEmail" value="test@checkmine.com" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingEmail">이메일 주소</label>
            </div>
            <div class="form-floating">
              <input type="tel" class="form-control phoneNumber" name="phone" id="floatingPhone" value="010-1234-1234" <c:if test="${!fn:contains(loginMember.permission, 'H')}">disabled</c:if>>
              <label for="floatingPhone">휴대폰 번호</label>
            </div> 
          </div>
          
            <div class="modal-footer">
              <button type="button" class="btn checkmine-btn" id="empEvalBtn" data-bs-target="#evalModalToggle" data-bs-toggle="modal">사원평가</button>
              <c:if test="${fn:contains(loginMember.permission, 'H')}">
                <input type="submit" class="btn checkmine-btn" value="변경하기">
              </c:if>
            </div>
        </div>
      </div>
    </div>
  </form>


	<script>
		
    $('.empModal').on("click", function() {
      let no = $(this).children('th').html();
      $.ajax({
        url: "/checkmine/personnel/empModal",
        type: 'GET',
        data : {no : no},
        success : function(data){
          if(data == null){
            alert("사원 정보를 조회하는데에 실패하였습니다 !")
          }else{
            $('#modalENo').val(no);
            if(data.photoName != null){
              $('#empModalImg').attr('src', '${rootPath}/resources/upload/profile/' + data.photoName);
            }
            $('#modalName').val(data.name);
            $('#floatingDept').val(data.deptNo).prop("selected", true);
            $('#floatingPosi').val(data.posNo).prop("selected", true);
            $('#floatingEmail').val(data.email);
            $('#floatingPhone').val(data.phone);
          }
        }
      })
    })

	</script>

  <script>
    const phone = document.querySelector('input[name=phone]');

    $(document).on("keyup", ".phoneNumber", function() { 
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });

  </script>
    
  <script>
    $('#empEvalBtn').on("click", function(){
      const evalee = $('#modalENo').val();
      const evaleeName = $('#modalName').val();
      const evalor = '${loginMember.no}';

      $('#evalModalToggleLabel').text('\''+evaleeName+'\' 님 사원평가');

      $.ajax({
        url: '/checkmine/personnel/checkEval',
        type: 'POST',
        data : {
          evalee : evalee,
          evalor : evalor
        },
        success : function(data){
          if(data != null) {
            $('#empEvalText').html(data.content);
          }
        }
      });
    });
  </script>
</body>
</html>