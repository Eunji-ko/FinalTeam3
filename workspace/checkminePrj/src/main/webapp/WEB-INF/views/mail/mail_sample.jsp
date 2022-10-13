<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckMine - 메일</title>
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_basic.css">

<style type="text/css">
   
</style>

<c:set var="imgPath" value="/checkmine/resources/img/mail"/>

</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="container-header" class="d-flex align-items-center">
                <span style="font-size: 30px;">메일</span>
                <div>
                    <img src="${imgPath}/mail_search.png">
                    <input type="text" placeholder="메일검색">
                </div>
            </div>

            <hr style="height: 2px;">

            <div class="d-flex" style="padding-top: 8px;">
                <div id="container-nav">
                    <div>
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
                        <li><div class="container-nav-selected"><a href="">받은편지함</a><span>21</span></div></li>
                        <li><div><a href="">보낸편지함</a><span>21</span></div></li>
                        <li><div><a href="">중요편지함</a><span>21</span></div></li>
                        <li><div><a href="">임시보관함</a><span>21</span></div></li>
                        <li><div><a href="">휴지통</a></div></li>
                        <li><div><a href="">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px;">받은편지함</div>
                    <!-- 여기서 작업 -->
                </div>
            </div>
        </main>
    </div>
</body>
</html>