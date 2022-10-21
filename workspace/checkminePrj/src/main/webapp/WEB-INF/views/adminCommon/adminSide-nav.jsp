<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #profile{
        width: 175px;
        height: 175px;
    }
    #profile > img{
        width: 100%;
        border-radius: 50%;
    }
    #adminName{
        font-size: 20px;
        font-weight: bolder;
        margin: 15px 0;
    }
    #logout{
        font-size: 15px;
        text-decoration: underline;
        margin-bottom: 5rem;
        
    }
</style>
</head>
<body>

	<!-- 사이드 네비게이션 TODO: 경로설정 -->
        <nav class="d-flex flex-column align-items-center">
            <div id="profile"><img src="${root}/resources/img/admin/adminProfile.png" alt="관리자이미지"></div>
            <div id="adminName">${loginAdmin.name} 관리자</div>
            
            <a href="${root}/admin/logout" id="logout">로그아웃</a>
            <a href="${root}/admin/main" id="side-nav-home">HOME</a>
            <a href="${root}/admin/member/list">사원관리</a>
            <a href="${root}/admin/board/list?sort=a&p=1">게시판관리</a>
            <a href="공유물관리">공유물관리</a>
            <a href="${root}/board/list/notice/1">조직도</a>
        </nav>
</body>
</html>