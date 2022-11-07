<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .hr-border {
        position: absolute;
        top: 229px;
        z-index: 0;
        width: 1373px;
        height: 1px;
        background-color: #B0D9D1;
    }
    .left-space {
        margin-left: 20px;
    }
    .list-group-horizontal>.list-group-item:first-child, .list-group-horizontal>.list-group-item:last-child {
        border-radius: 0.5rem 0.5rem 0 0;
    }
    .list-group-item.active {
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        border-color: #B0D9D1;
        background-color: white;
        color: #728D89;
    }
    .top-radius-btn {
        border-color: #8D8D8D;
        border-bottom-color: rgba(255, 255, 255, 0);
        background-color: white;
        color: black;
        border-bottom: 0px;
        font-size: 20px;
        font-weight: 900;
        padding: 15px;
        text-align: center;
        padding-left: 20px;
        padding-right: 20px;
    }
    .btn-zone {
        width: 600px;
    }
    .checkmine-btn {
        background-color: #5D736F;
        color: white;
        width: 240px;
        height: 60px;
        font-size: 25px;
        border-radius: 7px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 3px;
        padding-top: 3px;
    }
    .checkmine-btn:hover {
        background-color: #72918b;
    }
    .kakao-btn {
        background-color: rgb(247, 247, 0);
        color: black;
        width: 240px;
        height: 60px;
        font-size: 25px;
        border-radius: 7px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 3px;
        padding-top: 3px;
    }
    .kakao-btn:hover {
        background-color: rgb(240, 236, 0);
    }
</style>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <br><br>
    <div class="list-group list-group-horizontal left-space btn-zone" id="list-tab" role="tablist">
        <a class="list-group-item active top-radius-btn" id="list-id-list" data-bs-toggle="list" href="#list-id" role="tab" aria-controls="list-id">아이디 찾기</a>
        <a class="list-group-item top-radius-btn" id="list-pwd-list" data-bs-toggle="list" href="#list-pwd" role="tab" aria-controls="list-pwd">비밀번호 찾기</a>
    </div>
    <div class="hr-border"></div>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="list-id" role="tabpanel" aria-labelledby="list-id-list">
            <%@ include file="/WEB-INF/views/member/findId-content.jsp" %>
        </div>
        <div class="tab-pane fade" id="list-pwd" role="tabpanel" aria-labelledby="list-pwd-list">
            <%@ include file="/WEB-INF/views/member/findPwd-content.jsp" %>
        </div>
    </div>
</body>
</html>