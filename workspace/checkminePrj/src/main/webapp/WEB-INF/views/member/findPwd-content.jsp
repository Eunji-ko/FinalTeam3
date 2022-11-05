<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="id-pwd-page">
        <button type="button" class="checkmine-btn" data-bs-toggle="modal" data-bs-target="#findPwdModal">비밀번호 찾기</button>
    </div>

    <%@ include file="/WEB-INF/views/member/findPwd-modal.jsp" %>
</body>
</html>