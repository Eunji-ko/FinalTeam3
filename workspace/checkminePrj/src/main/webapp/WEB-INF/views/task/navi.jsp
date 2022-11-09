<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*카테고리*/
    .nav-tabs{
        margin-top: 20px;
        border-bottom: 1px solid #B0D9D1;
    }

    .nav-link {
        border-top: 1px solid lightgray !important;
        border-left: 1px solid lightgray !important;
        border-right: 1px solid lightgray !important;
        color: lightgray;
    }

    #report{
        margin-left: 40px;
    }

    .nav-link:hover{
        color: #B0D9D1;
    }

</style>
</head>
<body>
    <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link" id="report" href="${root}/task/report/list/1">보고</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="order" href="${root}/task/order/list/1">지시</a>
        </li>
    </ul>
</body>
</html>