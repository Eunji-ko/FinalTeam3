<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="findPwdModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="findPwdModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="findPwdModalLabel">비밀번호 찾기</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="form-floating" style="margin-bottom: 10px;">
                <input type="text" class="form-control" name="id" id="floatingId" value="">
                <label for="floatingId">아이디</label>
            </div> 
            <div class="form-floating" style="margin-bottom: 10px;">
                <select class="form-select" id="floatingDept" name="deptNo" aria-label="Floating label select example">
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
                <select class="form-select" id="floatingPosi" name="posNo" aria-label="Floating label select example">
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
            <div class="form-floating">
                <input type="tel" class="form-control phoneNumber" name="phone" id="floatingPhone" value="">
                <label for="floatingPhone">휴대폰 번호</label>
            </div> 
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" id="findPwdBtn">인증</button>
        </div>
        </div>
    </div>
</div>

<script>
    const phone = document.querySelector('input[name=phone]');

    $(document).on("keyup", ".phoneNumber", function() { 
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });

</script>

<script>
    $('#findPwdBtn').click(function(){
        const userId = $('#floatingId').val();
        const userDept = $('#floatingDept').val();
        const userPos = $('#floatingPosi').val();
        const userPhone = $('#floatingPhone').val();

        if(userId && userDept && userPos && userPhone) {
            $.ajax({
                type : 'post',
                url : '/checkmine/member/findPwd',
                data : {
                    "id" : userId,
                    "deptNo" : userDept,
                    "posNo" : userPos,
                    "phone" : userPhone
                },
                success : function (data) {
                    if(data == 'x'){
                        alert('해당 사원 정보를 찾을 수 없습니다 !');
                    }else{
                        $.ajax({
                            type : 'get',
                            url : '/checkmine/sendPwd?email='+data,
                            success : function (x) {
                                alert('등록된 메일로 임시 비밀번호가 전송되었습니다 !');
                                location.href = '/checkmine/member/changePwdById?id=' + userId + '&pwd=' + x;
                            }
                        })
                    }
                }
            })
        }
    })
</script>