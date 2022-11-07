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
        width: 1519px;
        height: 1px;
        background-color: #B0D9D1;
    }
    .left-space {
        margin-left: 20px;
    }
    .list-group-horizontal>.list-group-item:nth-child(n) {
        border-radius: 0.25rem 0.25rem 0 0;
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
        font-weight: bold;
        padding: 8px;
        text-align: center;
        padding-left: 20px;
        padding-right: 20px;
    }
    .btn-zone {
        width: 500px;
    }
    td {
        overflow:hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    #list-address > * {
        padding-left: 120px;
    }
</style>
</head>
<body>
    <br><br>
    <div class="list-group list-group-horizontal left-space btn-zone" id="list-tab" role="tablist">
        <a class="list-group-item active top-radius-btn" id="list-personal-list" data-bs-toggle="list" href="#list-personal" role="tab" aria-controls="list-personal">개인정보</a>
        <a class="list-group-item top-radius-btn" id="list-address-list" data-bs-toggle="list" href="#list-address" role="tab" aria-controls="list-address">주소록</a>
        <a class="list-group-item top-radius-btn" id="list-board-list" data-bs-toggle="list" href="#list-board" role="tab" aria-controls="list-board">게시물</a>
    </div>
    <div class="hr-border"></div>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="list-personal" role="tabpanel" aria-labelledby="list-personal-list">
            <%@ include file="/WEB-INF/views/member/personal-content.jsp" %>
        </div>
        <div class="tab-pane fade" id="list-address" role="tabpanel" aria-labelledby="list-address-list">
            <%@ include file="/WEB-INF/views/member/address-content.jsp" %>
        </div>
        <div class="tab-pane fade" id="list-board" role="tabpanel" aria-labelledby="list-board-list">
            <%@ include file="/WEB-INF/views/member/board-content.jsp" %>
        </div>
    </div>
</body>
</html>