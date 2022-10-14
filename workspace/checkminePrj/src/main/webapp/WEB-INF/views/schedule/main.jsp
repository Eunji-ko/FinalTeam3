<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${root}/resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
<script src='${root}/resources/fullcalendar-5.11.3/lib/main.js'></script>
<style>
    #calendar{
        width: 100%;
        height: 100%;
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
            });
            calendar.render();
            });
    </script>
</body>
</html>