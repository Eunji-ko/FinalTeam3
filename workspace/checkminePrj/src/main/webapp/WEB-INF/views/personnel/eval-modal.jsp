<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="evalModalToggle" aria-hidden="true" aria-labelledby="evalModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="evalModalToggleLabel">사원평가</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <label for="empEvalText" class="form-label" style="color: lightseagreen;">'가는 말이 고와야 오는 말도 곱다.'</label>
                <textarea class="form-control" id="empEvalText" rows="3"></textarea>
            </div>
        </div>
        <div class="modal-footer" style="justify-content: space-between;">
          <button class="btn checkmine-btn" data-bs-target="#changeEmp" data-bs-toggle="modal">사원정보로</button>
          <button class="btn checkmine-btn" id="submitEvalBtn" data-bs-dismiss="modal">제출하기</button>
        </div>
      </div>
    </div>
</div>

<script>
    $('#submitEvalBtn').on("click", function(){
        const evalee2 = $('#modalENo').val();
        const evaleeName2 = $('#modalName').val();
        const evalor2 = '${loginMember.no}';

         let evalContent = $('#empEvalText').val();
         console.log(evalContent);
         if(evalContent.length > 0) {
            $.ajax({
              url: '/checkmine/personnel/evalEmp',
              type: 'POST',
              data : {
                evalee : evalee2,
                evalor : evalor2,
                content : evalContent
              },
              success : function(x){
                console.log('evalEmp 성공!');
                swal(evaleeName2+'님의 사원평가를 등록하였습니다 !', '','success');
              }
            });
         }
     });
</script>
