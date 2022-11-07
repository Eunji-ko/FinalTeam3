<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <c:set var="findId" value="${sessionScope.findId}"/>
  <c:remove var="findId" scope="session"/>

  <c:if test="${not empty findId}">
    <script>
      swal('${findId}', '','success');
    </script>
  </c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .id-pwd-page{
        margin-left: 300px;
        margin-top: 100px;
        width: 750px;
        height: 500px;
        display: flex;
        align-items: center;
        justify-items: center;
    }
    .id-pwd-page *{
        margin: 0 auto;;
    }

    .a-clear {
      text-decoration: none;
      text-align: center;
      padding-top: 10px;
    }

    .a-clear:hover{
      color: white;
    }
</style>
</head>
<body>
	<div class="id-pwd-page">
    <button type="button" class="checkmine-btn" data-bs-toggle="modal" data-bs-target="#checkEmpModal">사원정보 인증</button>
    <br>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=9f5225ef543fafc73d86a09fb5c33da9&redirect_uri=http://localhost:8888/checkmine/member/kakaoLogin&response_type=code" class="kakao-btn a-clear">
      카카오 인증
    </a>
  </div>

<%@ include file="/WEB-INF/views/member/checkEmp-modal.jsp" %>

</body>
</html>