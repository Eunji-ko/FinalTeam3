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
  <div class="modal fade" id="changeInfo" tabindex="-1" aria-labelledby="changeInfoLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="changeInfoLabel">비밀번호 변경</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="email" class="form-control" name="email" value="test@checkmine.com">
          <br>
          <input type="tel" class="form-control" name="phone" value="010-1234-1234">
          <br>
          <button type="button" class="btn checkmine-btn btn-icon-split" onclick="openHomeSearch()" style="margin-bottom: 10px;">우편번호검색</button>
          <br>
          <input type="text" class="form-control" name="postno" placeholder="우편번호" style="margin-bottom: 10px;" readonly>
          <hr>
          <input type="text" class="form-control" name="addr" placeholder="주소" style="margin-bottom: 10px;" readonly>
          <input type="text" class="form-control" name="detAddr" placeholder="상세주소" style="margin-bottom: 10px;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn checkmine-btn">신청하기</button>
        </div>
      </div>
    </div>
  </div>

  <script>
  //다음 우편번호 검색
	function openHomeSearch(){
		new daum.Postcode({
			oncomplete:function(data){
  // 				alert("data" + JSON.stringify(data));
				$('[name=postno]').val(data.zonecode);
				$('[name=addr]').val(data.address);
				$('[name=detAddr]').val(data.buildingName);
			}
		}).open();
	}
  </script>
</body>
</html>