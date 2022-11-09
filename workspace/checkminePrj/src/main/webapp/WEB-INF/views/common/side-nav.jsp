<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<!-- 사이드 네비게이션 TODO: 경로설정 -->
        <nav class="d-flex flex-column align-items-center">
            <a href="${rootPath}/member/main" id="side-nav-home">HOME</a>
            <a href="${rootPath}/commute/mycommute/1">근태관리</a>
            <a href="${rootPath}/approval">전자결재</a>
            <a href="${rootPath}/task/report/list/1">업무</a>
            <a href="${rootPath}/personnel/main?ep=1&ap=1">인사관리</a>
            <a href="${rootPath}/reservation/mygoodsreservation/1">예약</a>
            <a href="${rootPath}/board/list/notice">게시판</a>
            <a href="${rootPath}/schedule">일정</a>
        </nav>
</body>
</html>