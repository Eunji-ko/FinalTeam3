<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #main-area {
        width: 1450px;
        margin: 0 auto;
    }
    #mem-content {
        width: 330px;
        height: 800px;
        border-radius: 25px;
        padding: 20px;
        padding-top: 50px;
        float: left;
        background-color: #C4F2EA;
    }
    #profile-img {
        margin: 0 auto;
        width: 180px;
        height: 180px;
        border-radius: 100px;
        background-color: white;
        margin-bottom: 15px;
    }
    #profile-tag {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
    }
    #myp-log {
        margin-top: 35px;
        text-align: center;
    }
    #myp-log > a {
        color: black;
        margin-left: 25px;
        margin-right: 25px;
    }
    #duty-content {
        margin-top: 50px;
        align-items: center;
    }
    #duty-content > div {
        text-align: center;
        float: left;
        margin-left: 27px;
        margin-right: 27px;
        cursor: pointer;
    }
    #duty-content > div * {
        margin-bottom: 7px;
    }
    #attend-content {
        width: 280px;
        height: 220px;
        margin-top: 210px;
        border-radius: 20px;
        background-color: white;
    }
    #main-content {
        width: 1070px;
        height: 750px;
        float: right;
        vertical-align: middle;
    }
    #main-content1f {
        width: 100%;
        height: 350px;
        display: grid;
        grid-template-columns: 650px 350px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content2f {
        width: 100%;
        height: 350px;
        display: grid;
        grid-template-columns: 550px 450px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content1f > div, #main-content2f > div {
        border: 1px solid #C2C2C2;
    }
    .current-clock {
        border: 1px solid black;
        width: 160px;
        height: 40px;
        color: #666;
        font-size: 25px;
        text-align: center;
    }
</style>
</head>
<body onload="printClock()">
    <br>
    <div id="main-area">
        <div id="mem-content">
            <div id="profile-img">
            </div>
            <div id="profile-tag">
                테스트 사원
            </div>
            <div id="myp-log">
                <a href="${rootPath}/member/mypage">마이페이지</a>
                <a href="${rootPath}/member/logout">로그아웃</a>
            </div>
            <div id="duty-content">
                <div onclick="location.href='${rootPath}/mail';">
                    <img src="${imgPath}/mail_icon.png">
                    <div>메일</div>
                    <div>6개</div>
                </div>
                <div onclick="location.href='${rootPath}/approval';">
                    <img src="${imgPath}/approval_icon.png">
                    <div>결재</div>
                    <div>2건</div>
                </div>
                <div onclick="location.href='${rootPath}/reservation/myreservation';">
                    <img src="${imgPath}/reservation_icon.png">
                    <div>예약</div>
                    <div>1건</div>
                </div>
            </div>
            <div id="attend-content">
                <div id="current-day">

                </div>
                <div id="clock" class="current-clock">

                </div>
                <div id="begin-time">

                </div>
                <div id="end-time">

                </div>
                <div id="attend-btn-zone">

                </div>
            </div>
        </div>
        <br>
        <div id="main-content">
            <div id="main-content1f">
                <div></div>
                <div></div>
            </div>
            <br><br>
            <div id="main-content2f">
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    <br>
    <script>
        function printClock() {
    
            var clock = document.getElementById("clock");            // 출력할 장소 선택
            var currentDate = new Date();                                     // 현재시간
            var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
            var amPm = 'AM'; // 초기값 AM
            var currentHours = addZeros(currentDate.getHours(),2); 
            var currentMinute = addZeros(currentDate.getMinutes() ,2);
            var currentSeconds =  addZeros(currentDate.getSeconds(),2);

            if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
                amPm = 'PM';
                currentHours = addZeros(currentHours - 12,2);
            }

            clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:25px;'>"+ amPm+"</span>"; //날짜를 출력해 줌

            setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
            }

            function addZeros(num, digit) { // 자릿수 맞춰주기
            var zero = '';
            num = num.toString();
            if (num.length < digit) {
                for (i = 0; i < digit - num.length; i++) {
                zero += '0';
                }
            }
            return zero + num;
        }
    </script>
</body>
</html>