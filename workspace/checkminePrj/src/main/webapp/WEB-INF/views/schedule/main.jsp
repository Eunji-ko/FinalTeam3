<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<link href='${root}/resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
<script src='${root}/resources/fullcalendar-5.11.3/lib/main.js'></script>
<script src="${root}/resources/fullcalendar-5.11.3/lib/locales/ko.js"></script>
<style>
    #calendar{ /*캘린더 설정*/
        width: 1100px;
        height: 850px;
        margin: auto;
        margin-top: 10px;
        padding: 10px;
    }

    thead > tr{ /*요일 배경*/
        background-color: lightgray;
    }

    .fc-col-header-cell-cushion:hover{ /*요일 호버 색 안바뀌게*/
        color: black !important;
    }
 
    /*글자 색 설정*/
    a{ 
        color: black;
        text-decoration: none;
    }

    a:hover{
        color: #b0d9d1;
        text-decoration: none !important;
    }

    [aria-label="일요일"], .fc-day-sun>div>a {
        color: firebrick !important;
    }

    [aria-label="토요일"], .fc-day-sat>div>a {
        color: dodgerblue !important;
    }

    a.fc-event:hover{ /*이벤트 호버시 색 변경*/
        background-color:#5D736F;
    }

    a.fc-event{ /*이벤트 설정*/
        background-color: #91b3ac;
        border: 1px solid white;
        border-radius: 20px;
        text-align: center;
        color: white;
    }

    .fc-day-today{ /*오늘 날짜 백그라운드*/
        background-color: #b0d9d14d !important;
    }

    .fc-highlight{ /*날짜칸 클릭시*/
        background-color: #5d736f86 !important;
    }

    /*팝오버 배경 설정*/
    .fc-popover-header{ 
        background-color: #b0d9d1 !important;
    }

    .fc-popover-body{
        background-color: white;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			<div id="calendar"></div>
        </main>
    </div>

    <script>
        //풀캘린더 라이브러리 적용
            document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'ko', // 한국어 설정
                headerToolbar: {
                    left: 'prevYear prev today next nextYear',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
            navLinks: true, //날짜 선택시 day 캘린더로 링크
            selectable: true, //달력 일자 드래그 설정
            dayMaxEvents: true, //이벤트 오버되면 높이 제한
            eventLimit:true,

            //구글 캘린더 - 공휴일 연동
            googleCalendarApiKey : "AIzaSyAE-9fkmGRA-7ctlIj5SemknsE-SI5glxY", //api id
            eventSources :[
                {
                    googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com', //캘린더 id
                    color: 'firebrick',
                    textColor: 'white',
                }
            ],

            events: [{
                title: 'test01',
                start: '2022-10-17 12:00:00',
                end: '2022-10-17 18:00:00'
            },
            {
                title: 'test02',
                start: '2022-10-17',
                end: '2022-10-20'
            },
            {
                title: 'test03',
                start: '2022-10-17',
                end: '2022-10-21'
            },
            {
                title: 'test04',
                start: '2022-10-17',
                end: '2022-10-23'
            },
            {
                title: 'test05',
                start: '2022-10-17',
                end: '2022-10-25'
            },
            {
                title: 'test06',
                start: '2022-10-17 09:00',
                end: '2022-10-17 13:30'
            },
            {
                title: 'test07',
                start: '2022-10-17 09:00',
                end: '2022-10-17 13:30'
            },
            {
                title: 'test08',
                start: '2022-10-17 09:00',
                end: '2022-10-17 13:30'
            }]
            });
            calendar.render();
            });
    </script>
</body>
</html>