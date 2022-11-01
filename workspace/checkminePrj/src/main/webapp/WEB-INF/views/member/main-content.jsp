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
    /*예원이*/
    #begin-zone, #end-zone{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #time-zone{
        display: grid;
        grid-template-rows: 1fr 1fr;
        width: 170px;
        height: 30px;
    }
    #attend-btn-zone{
        width: 200px;
        height: 40px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        margin: 0px;
        margin-top: 30px;
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
        grid-template-columns: 600px 400px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content2f {
        width: 100%;
        height: 350px;
        display: grid;
        grid-template-columns: 530px 470px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content1f > div, #main-content2f > div {
        border: 1px solid #C2C2C2;
    }
    #right-box {
        width: 100%;
        height: 100%;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 20px;
        padding-right: 20px;
    }
    #right-box > a {
        text-decoration-line: none;
        color: black;
    }
    #right-box > h4 {
        margin-bottom: 40px;
    }
    #right-box-content {
        width: 100%;
        height: 40px;
        padding-left: 10px;
        padding-right: 10px;
    }
    
    .right-box-title {
        color: black;
        text-decoration-line: none;
        font-size: 15px;
    }
    .right-box-name {
        font-size: 12px;
    }
    .right-box-date {
        font-size: 11px;
        color: #C2C2C2;
    }
    .right-box-dept {
        font-size: 14px;
    }
    .right-box-urg {
        font-size: 14px;
        color: red;
    }
    #calendar {
    	margin: 3px;
    }
    .fc-daygrid-day-number, .fc-col-header-cell-cushion  {
    	color: black;
    	text-decoration-line: none;
    }
    .fc-daygrid-day-number:hover, .fc-col-header-cell-cushion:hover {
    	cursor: pointer;
    }
</style>
<link href='${rootPath}/resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
<script src='${rootPath}/resources/fullcalendar-5.11.3/lib/main.js'></script>
</head>
<body onload="printClock()">
    <br>
    <div id="main-area">
        <div id="mem-content">
            <div id="profile-img">
                <c:if test="${not empty loginMember.photoName}">
                    <img src="${rootPath}/resources/upload/profile/${loginMember.photoName}">
                </c:if>
                <c:if test="${empty loginMember.photoName}">
                    <img src="${imgPath}/none-profile.png">
                </c:if>
            </div>
            <div id="profile-tag">
                ${loginMember.name} ${loginMember.posNo}
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
                <div onclick="location.href='${rootPath}/approval/list';">
                    <img src="${imgPath}/approval_icon.png">
                    <div>결재</div>
                    <div>${approvalCnt}건</div>
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
                            ${cvo.arrived}
                        </div>
                    </div>
                    <div id="end-zone">
                        <div id="end-text">
                            퇴근시간
                        </div>
                        <div id="end-time">
                            ${cvo.leave}
                        </div>
                    </div>
                </div>
                <div id="attend-btn-zone">
                    <form action="${rootPath}/commute/arrived" method="post">
                        <input id="attend-btn" type="submit" value="출근 확인">
                    </form>

                    <form action="${rootPath}/commute/leave" method="post">
                        <input id="attend-btn" type="submit" value="퇴근 확인">
                    </form>
                     
                </div>
            </div>
        </div>
        <br>
        <div id="main-content">
            <div id="main-content1f">
                <div>
                    <div id="right-box">
                        <a href="${rootPath}/mail"><h4>메일함</h4></a>
                        <div id="right-box-content">
                            <table class="table">
                                <tr>
                                    <td><a href="" class="right-box-title">[회신요청] 9월 채용 실적 조사 - 설문하고...</a></td>
                                    <td><div class="right-box-name">김이름</div></td>
                                    <td><div class="right-box-date">2022.09.27 11:20</div></td>
                                </tr>
                                <tr>
                                    <td><a href="" class="right-box-title">[회신요청] 9월 채용 실적 조사 - 설문하고...</a></td>
                                    <td><div class="right-box-name">김이름</div></td>
                                    <td><div class="right-box-date">2022.09.27 11:20</div></td>
                                </tr>
                                <tr>
                                    <td><a href="" class="right-box-title">[회신요청] 9월 채용 실적 조사 - 설문하고...</a></td>
                                    <td><div class="right-box-name">김이름</div></td>
                                    <td><div class="right-box-date">2022.09.27 11:20</div></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
                	<div id="calendar"></div>
                </div>
            </div>
            <br><br>
            <div id="main-content2f">
                <div>
                    <div id="right-box">
                        <a href="${rootPath}/approval/list"><h4>전자결재</h4></a>
                        <div id="right-box-content">
                            <table class="table">
                            	<c:forEach items="${approvalList}" var="list">
                                <tr>
                                    <td><div class="right-box-dept">${list.type}</div></td>
                                    <td><a href="${rootPath}/approval/${list.no}" class="right-box-title">${list.title}</a></td>
                                    <td><div class="right-box-name">${list.writerNo}</div></td>
                                    <td><div class="right-box-date">${list.date.substring(0,16)}</div></td>
                                </tr>
                            	</c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="right-box">
                        <a href="${rootPath}/task/report/list"><h4>업무</h4></a>
                        <div id="right-box-content">
                            <table class="table">
                                <tr>
                                    <td><div class="right-box-urg">긴급</div></td>
                                    <td><a href="" class="right-box-title">figma 레이아웃 및 디자인 ...</a></td>
                                    <td><div class="right-box-name">지시자</div></td>
                                    <td><div class="right-box-date">2022.09.27 11:20</div></td>
                                </tr>
                                <tr>
                                    <td><div class="right-box-urg"></div></td>
                                    <td><a href="" class="right-box-title">erd 다이어그램 수정 및 참조 ...</a></td>
                                    <td><div class="right-box-name">지시자</div></td>
                                    <td><div class="right-box-date">2022.09.27 11:20</div></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
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
    
    <script>
	  //풀캘린더 라이브러리 적용
	    document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'dayGridMonth',
	    });
	    calendar.render();
	    });
    </script>

</body>
</html>