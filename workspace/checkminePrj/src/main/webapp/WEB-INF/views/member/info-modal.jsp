<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<body>
  <form action="${rootPath}/member/changeInfo" method="post" onsubmit="return checkInfo();">
    <div class="modal fade" id="changeInfo" tabindex="-1" aria-labelledby="changeInfoLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color: #c6f0e7;">
            <h1 class="modal-title fs-5" id="changeInfoLabel">개인정보 변경</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="no" value="${loginMember.no}">
            <input type="email" class="form-control" name="email" value="${loginMember.email}">
            <br>
            <input type="tel" class="form-control phoneNumber" name="phone" value="${loginMember.phone}">
            <br>
            <button type="button" class="btn checkmine-btn btn-icon-split" onclick="openHomeSearch()" style="margin-bottom: 20px;">우편번호 검색</button>
            <input type="text" class="form-control" name="address" placeholder="주소" style="margin-bottom: 10px;" value="${loginMember.address}" readonly>
            <input type="text" class="form-control" name="addressDetail" placeholder="상세주소" style="margin-bottom: 10px;" value="${loginMember.addressDetail}">
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn checkmine-btn" value="변경하기">
          </div>
        </div>
      </div>
    </div>
  </form>

  <script>
  //다음 우편번호 검색
	function openHomeSearch(){
		new daum.Postcode({
			oncomplete:function(data){
  // 				alert("data" + JSON.stringify(data));
				// $('[name=postno]').val(data.zonecode);
				$('[name=address]').val(data.address);
				$('[name=addressDetail]').val(data.buildingName);
			}
		}).open();
	}
  </script>

  <script>
    const phone = document.querySelector('input[name=phone]');

    function checkInfo() {

      if(phone.value.length != 13 || phone.value.substr(0,4) != '010-' || phone.value.substr(8,1) != '-'){
            alert("휴대폰 번호는 '010-XXXX-XXXX'의 형태로 입력해주세요!");
            return false;
        }
  
        return true;

    }

    $(document).on("keyup", ".phoneNumber", function() { 
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });

  </script>
</body>
</html>