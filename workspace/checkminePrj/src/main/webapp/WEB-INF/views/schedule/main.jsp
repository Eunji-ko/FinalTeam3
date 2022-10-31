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

    [aria-label="일요일"], .fc-day-sun>div>a{
        color: firebrick !important;
    }

    [aria-label="토요일"], .fc-day-sat>div>a, .fc-day-number.fc-sat.fc-past {
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

    /*팝오버&모달 배경 설정*/
    .fc-popover-header, .modal-header{ 
        background-color: #b0d9d1 !important;
    }

    .fc-popover-body{
        background-color: white;
    }

    .modal-footer>.fc-button, .close{
        color: white;
        background-color: #b0d9d1;
        border: 1px solid lightgray;
    }

    .modal-footer>.fc-button:hover, .close:hover{
        background-color: #326A60;
    }

    .modal-footer>.fc-button:focus, .close:focus{
        outline: 5px solid lightgray;
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

    <!-- 특정 인물만 버튼 보이게 설정,input name 수정 -->
    <!-- 일정 추가용 modal -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="btn close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정명</label>
                        <input type="text" class="form-control" id="name" name="name">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="content" name="content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn fc-button fc-button-primary" id="addSchedule" >추가</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
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
                footerToolbar:{
                    right: 'addEventButton'
                }, 
                displayEventTime: false, //시간 표시x

                customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "일정 추가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기

                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                                var content = $("#calendar_content").val();
                                var start_date = $("#calendar_start_date").val();
                                var end_date = $("#calendar_end_date").val();
                                
                                //내용 입력 여부 확인
                                if(content == null || content == ""){
                                    alert("내용을 입력하세요.");
                                }else if(start_date == "" || end_date ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else{ // 정상적인 입력 시
                                    var obj = {
                                        "title" : content,
                                        "start" : start_date,
                                        "end" : end_date
                                    }//전송할 객체 생성
                                    console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                }
                            });
                        }
                    }
                },
                navLinks: true, //날짜 선택시 day 캘린더로 링크
                selectable: true, //달력 일자 드래그 설정
                dayMaxEvents: true, //이벤트 오버되면 높이 제한
                eventLimit:true,
                editable:true,//draggable 작동

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
                    content: '보이나용?',
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

	<!-- 일정 추가 스크립트 -->
	<script>
		$(function () {
			$("#addSchedule").click(){
                var name = $('#name').val();
                var content = $('#content').val();
                var startDate = $('#startDate').val();
                var endDate = $('#endDate').val();

                var insert = $.ajax({
                    url:"/schedule",
                    method:"POST",
                    data:{name, content, startDate, endDate},
                    dataType:"json"
                })
            }
		})
	</script>
</body>
</html>