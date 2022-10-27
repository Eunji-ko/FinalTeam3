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
    .list-group-horizontal>.list-group-item:first-child, .list-group-horizontal>.list-group-item:last-child {
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
        padding-left: 12px;
        padding-right: 12px;
    }
    .btn-zone {
        width: 150px;
    }
    .checkmine-btn {
        background-color: #5D736F;
        color: white;
        border-radius: 7px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 3px;
        padding-top: 3px;
    }
    .checkmine-btn:hover {
        background-color: #72918b;
    }
</style>
</head>
<body onload="checkPsn()">
    <br><br>
    <div class="list-group list-group-horizontal left-space btn-zone" id="list-tab" role="tablist">
        <a class="list-group-item active top-radius-btn" id="list-emp-list" data-bs-toggle="list" href="#list-emp" role="tab" aria-controls="list-emp">사원</a>
        <a class="list-group-item top-radius-btn" id="list-account-list" data-bs-toggle="list" href="#list-account" role="tab" aria-controls="list-account">거래처</a>
    </div>
    <div class="hr-border"></div>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="list-emp" role="tabpanel" aria-labelledby="list-emp-list">
            <%@ include file="/WEB-INF/views/personnel/emp-content.jsp" %>
        </div>
        <div class="tab-pane fade" id="list-account" role="tabpanel" aria-labelledby="list-account-list">
            <%@ include file="/WEB-INF/views/personnel/account-content.jsp" %>
        </div>
    </div>

    <script>
        function checkPsn(){
            let psnLink = location.href;
            let accCheck = psnLink.slice(-3);
            console.log(accCheck);

            if(accCheck == 'Acc'){
                $("#list-emp-list").removeClass("active");
                $("#list-emp-list").attr("aria-selected", "false");
                $("#list-emp").removeClass("active");
                $("#list-emp").removeClass("show");
                $("#list-account-list").addClass("active");
                $("#list-account-list").attr("aria-selected", "true");
                $("#list-account").addClass("active");
                $("#list-account").addClass("show");
            }

            let rsnCheck = psnLink.slice(-1);
            console.log(rsnCheck);

            if(rsnCheck == 'N') {
                $("#selectResign").val("N").prop("selected", true);
            }else if(rsnCheck == 'Y'){
                $("#selectResign").val("Y").prop("selected", true);
            }else{
                $("#selectResign").val("").prop("selected", true);
            }
        }
    </script>
</body>
</html>