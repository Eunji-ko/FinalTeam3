<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="findIdPwd" tabindex="-1" aria-labelledby="findIdPwdLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="findIdPwdLabel">아이디/비밀번호 찾기</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-4">
                      <div class="list-group list-group-horizontal" id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-findId-list" data-bs-toggle="list" href="#list-findId" role="tab" aria-controls="list-findId">아이디 찾기</a>
                        <a class="list-group-item list-group-item-action" id="list-findPwd-list" data-bs-toggle="list" href="#list-findPwd" role="tab" aria-controls="list-findPwd">비밀번호 찾기</a>
                      </div>
                    </div>
                    <div class="col-8">
                      <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="list-findId" role="tabpanel" aria-labelledby="list-findId-list">

                        </div>
                        <div class="tab-pane fade" id="list-findPwd" role="tabpanel" aria-labelledby="list-findPwd-list">

                        </div>
                      </div>
                    </div>
                  </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>