<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="add-addr-modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                
                <!-- 주소록 추가 요청 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel">주소록 추가하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" id="addr-modal-form">
                    <div class="modal-body">
                        <div class="d-flex">
                            <span>이름</span><input type="text" name="name">
                        </div>
                        <div class="d-flex">
                            <span>이메일 주소</span><input type="text" name="addr">
                        </div>
                        <div class="d-flex">
                            <span>구분</span> 사내 <input type="radio" name="type"> 거래처 <input type="radio"  name="type"> 외부 <input type="radio"  name="type">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button>추가</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>