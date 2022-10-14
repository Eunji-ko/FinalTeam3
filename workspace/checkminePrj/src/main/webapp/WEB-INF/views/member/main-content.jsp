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
        overflow: hidden;
    }
    #profile-img > img {
        width: 100%;
        height: 100%;
        object-fit: cover;
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
        width: 290px;
        height: 220px;
        margin-top: 210px;
        border-radius: 20px;
        background-color: white;
        align-items: center;
    }
    #attend-content * {
        margin: 0 auto;
    }
    #current-day {
        padding-top: 10px;
        text-align: center;
    }
    #current-time {
        padding-left: 30px;
        padding-top: 10px;
    }
    #current-time * {
        float: left;
    }
    #time-text {
        padding-top: 8px;
        font-size: 18px;
        padding-right: 10px;
    }
    .current-clock {
        width: 155px;
        height: 40px;
        color: rgb(61, 61, 61);
        font-size: 25px;
        text-align: center;
    }
    #time-zone {
        width: 170px;
        height: 40px;
    }
    #begin-zone *, #end-zone * {
        float: left;
        height: 30px;
    }
    #begin-zone * {
        padding-top: 10px;
    }
    #end-zone * {
        padding-top: 15px;
    }
    #begin-text, #end-text {
        font-size: 15px;
        padding-right: 15px;
        padding-left: 10px;
    }

    /* 출근 및 퇴근하면 확인하고 버튼 비활성화 시키기 */
    #attend-btn:hover {
        background-color: #b4ddd5;
        font-weight: 600;
    }
    #attend-btn {
        cursor: pointer;
        margin-left: 17px;
        margin-top: 24px;
        padding-top: 6px;
        float: left;
        width: 120px;
        height: 35px;
        background-color: #B0D9D1;
        border-radius: 17px;
        font-size: 14px;
        text-align: center;
        box-shadow: 1px 2px 2px rgb(170, 170, 170);
        font-weight: 500;
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
    
</style>
</head>
<body onload="printClock()">
    <br>
    <div id="main-area">
        <div id="mem-content">
            <div id="profile-img">
                <img src="${imgPath}/none-profile.jpg">
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
                <div id="current-time">
                    <div id="time-text">
                        현재시간
                    </div>
                    <div id="clock" class="current-clock">
    
                    </div>
                </div>
                <div id="time-zone">
                    <div id="begin-zone">
                        <div id="begin-text">
                            출근시간
                        </div>
                        <div id="begin-time">
                            08:20:05
                        </div>
                    </div>
                    <div id="end-zone">
                        <div id="end-text">
                            퇴근시간
                        </div>
                        <div id="end-time">
                            18:07:23
                        </div>
                    </div>
                </div>
                <div id="attend-btn-zone">
                    <div id="attend-btn" onclick="location.href='${rootPath}/근태/출근';">출근 확인</div>
                    <div id="attend-btn" onclick="location.href='${rootPath}/근태/퇴근';">퇴근 확인</div>
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
            var day = document.getElementById("current-day");
            var currentDate = new Date();                                     // 현재시간
            var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
            var amPm = 'AM'; // 초기값 AM
            var currentHours = addZeros(currentDate.getHours(),2); 
            var currentMinute = addZeros(currentDate.getMinutes() ,2);
            var currentSeconds =  addZeros(currentDate.getSeconds(),2);
            var currentYear = currentDate.getFullYear();
            var currentMonth = addZeros(currentDate.getMonth() + 1,2);
            var currentToday = addZeros(currentDate.getDate(),2);
            var currentDay = currentDate.getDay();
            var weeks = ['일', '월', '화', '수', '목', '금', '토'];
            var currentWeek = weeks[currentDay];

            if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
                amPm = 'PM';
                currentHours = addZeros(currentHours - 12,2);
            }

            clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:25px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
            day.innerHTML = currentYear+"년 "+currentMonth+"월 "+currentToday+"일 ("+currentWeek+")";

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