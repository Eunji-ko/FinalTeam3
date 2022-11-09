<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
      #account-info-div{
        display: grid;
        grid-template-columns: 1fr 2fr 1fr 2fr;
        grid-template-rows: repeat(4, 1fr);
      }
      #account-info-div input{
        border: 0px;
        color: #5d736f;
      }
      #search-account, #modal-okay-btn{
        color: white;
		    background-color: #5d736f;
      }
      .select-account{
        width: 100%;
        border: none;
        cursor: pointer;
      }
    </style>
    
<!-- The Modal -->
<div class="modal fade" id="proposal-modal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">거래처</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id="account-name" class="input-group mb-3">
          <span class="input-group-text">거래처명</span>
          <input type="text" id="corporate" class="form-control" name="corporate">
          <button type="button" id="search-account" class="btn" onclick="selectAccount();">찾기</button>
        </div>
        <div id="account-info-div">
          <div id="account-info1">주소</div>
          <input type="text" name="address" id="addr" readonly>
          <div id="account-info3">거래처 전화번호</div>
          <input type="text" name="tel" id="tel" readonly>
          <div id="account-info5">팩스번호</div>
          <input type="text" name="fax" id="fax" readonly>
          <div id="account-info7">담당자</div>
          <input type="text" name="pname" id="charger" readonly>
          <div id="account-info9">부서</div>
          <input type="text" name="dept" id="department" readonly>
          <div id="account-info11">직급</div>
          <input type="text" name="position" id="position" readonly>
          <div id="account-info13">담당자 전화번호</div>
          <input type="text" name="phone" id="phone" readonly>
          <div id="account-info15">메일주소</div>
          <input type="text" name="email" id="mail" readonly>
        </div>  
        <hr>
        <input type="text" class="select-account" readonly>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn" data-bs-dismiss="modal" id="modal-okay-btn" onclick="modalOkay()">확인</button>
      </div>

    </div>
  </div>
</div>

<script>
  function selectAccount(){
    var corporate = $('#corporate').val();
    $.ajax({
  				url : "${rootPath}/approval/account",
  				type : "POST",
  				data : {'corporate' : corporate},
  				dataType : 'json',
  				success : function(data){
            var list = JSON.parse(data.list);
            if(list.length == 0){
                //거래처 없음
                alert('해당 거래처가 존재하지 않습니다.');
  					}else if(list.length > 1){
                //거래처 존재, 동명회사 있음
                alert('거래처를 선택해주세요.');
                //선택인풋 늘리는 반복문
                for(var i=0; i<list.length; i++){
                    $($('.select-account')[i]).val(list[i].no + "|" + list[i].corporate + "|" + list[i].address + "|" + list[i].pname);
                    var oriInput = document.getElementsByClassName('select-account')[i];
                    $(oriInput).css('display','block');
                    var newInput = oriInput.cloneNode(true);
                    oriInput.after(newInput);
                }
                //클릭시 발동하는 함수 설정
                $('.select-account').on('click', selectName);
                //함수 리턴값으로 값채우기
                $('.select-account').click(function(e){
                  $('#corporate').val(list[e.result].corporate);
                  $('#addr').val(list[e.result].address);
                  $('#tel').val(list[e.result].tel);
                  $('#fax').val(list[e.result].fax);
                  $('#charger').val(list[e.result].panme);
                  $('#department').val(list[e.result].dept);
                  $('#position').val(list[e.result].position);
                  $('#phone').val(list[e.result].phone);
                  $('#mail').val(list[e.result].email);
                  $('.select-account').hide();
                  $('#account-no').val(list[e.result].no);
                });
                $($('.select-account')[0]).hide();
  					}else{
              //거래처 존재 동명회사 없음
              $('#corporate').val(list[0].corporate);
              $('#addr').val(list[0].address);
              $('#tel').val(list[0].tel);
              $('#fax').val(list[0].fax);
              $('#charger').val(list[0].pnam0);
              $('#department').val(list[0].dept);
              $('#position').val(list[0].position);
              $('#phone').val(list[0].phone);
              $('#mail').val(list[0].email);
              $('#account-no').val(list[0].no);
            }
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
    });
  }

  //선택한 회사 번호(not 일련번호) 뽑아내기
  function selectName(){
    var selected = this.value;
    var accNo = selected.split("|")[0]-1;
    return accNo;
  }

  //모달 확인버튼 누르면 부모창에 거래처명 나옴
  function modalOkay(){
    $('#account-name-div').html($('#corporate').val());
  }
</script>