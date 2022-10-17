<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크마인 마이페이지</title>
<c:set var="imgPath" value="/checkmine/resources/img/member"/>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			<%@ include file="/WEB-INF/views/member/mypage-content.jsp" %>
        </main>
    </div>
</body>
</html>