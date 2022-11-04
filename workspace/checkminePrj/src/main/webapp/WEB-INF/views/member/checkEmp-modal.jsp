<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="checkEmpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="checkEmpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="checkEmpModalLabel">사원정보 인증</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="form-group email-form">
                <label for="email">이메일</label>
                <div class="input-group">
               <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="아이디" >
               <select class="form-control" name="userEmail2" id="userEmail2" >
               <option>@naver.com</option>
               <option>@daum.net</option>
               <option>@gmail.com</option>
               <option>@hanmail.com</option>
               </select>
            </div>   
           <div class="input-group-addon" style="margin-bottom: 10px; margin-top: 5px;">
               <button type="button" class="btn btn-success" id="mail-Check-Btn">본인인증</button>
           </div>
               <div class="mail-check-box">
           <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
           </div>
               <span id="mail-check-warn"></span>
           </div>
           <div>
              <span id="findId"></span>
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" id="idSubmitBtn">인증</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    $('#mail-Check-Btn').click(function() {
		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '/checkmine/mailCheck?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				checkInput.attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil

    // 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
    const emailInId = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	    $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
      $.ajax({
        type : 'get',
        url : '/checkmine/member/findId?email='+emailInId,
        dataType: "html",
        success : function (data) {
          if(data == 'x'){
            $('#findId').html('>> 해당 이메일 정보를 가진 사원 계정을 찾을 수 없습니다 !');
          }else{
            $('#findId').html('>> 아이디 : ' + data);
          }
			  }			
		  }); // end ajax
      $('#idSubmitBtn').attr("disabled", true);
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
      $('#idSubmitBtn').attr("disabled", false);
		}
	});
  </script>