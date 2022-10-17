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
          <input type="text" class="form-control" required>
          <button type="button" id="search-account" class="btn">찾기</button>
        </div>
        <div id="account-info-div">
          <div id="account-info1">주소</div>
          <input type="text" id="addr" disabled>
          <div id="account-info3">거래처 전화번호</div>
          <input type="text" id="tel" disabled>
          <div id="account-info5">팩스번호</div>
          <input type="text" id="fax" disabled>
          <div id="account-info7">담당자</div>
          <input type="text" id="charger" disabled>
          <div id="account-info9">부서</div>
          <input type="text" id="department" disabled>
          <div id="account-info11">직급</div>
          <input type="text" id="position" disabled>
          <div id="account-info13">담당자 전화번호</div>
          <input type="text" id="phone" disabled>
          <div id="account-info15">메일주소</div>
          <input type="text" id="mail" disabled>
        </div>      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn" data-bs-dismiss="modal" id="modal-okay-btn">확인</button>
      </div>

    </div>
  </div>
</div>