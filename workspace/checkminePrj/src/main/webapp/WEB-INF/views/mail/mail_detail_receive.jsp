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
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_detail.css">
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr_modal.css">

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
                    <div onclick="location.href='/checkmine/mail/write'">
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
						<li><div class="container-nav-selected"><a href="/checkmine/mail/receive?p=1">받은편지함</a><span>${notReadCountReceive}</span></div></li>
                        <li><div><a href="/checkmine/mail/ref?p=1">참조편지함</a><span>${notReadCountRef }</span></div></li>
                        <li><div><a href="/checkmine/mail/send?p=1">보낸편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/imp?p=1">중요편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/save?p=1">임시보관함</a></div></li>
                        <li><div><a href="/checkmine/mail/bin?p=1">휴지통</a></div></li>
                        <li><div><a href="/checkmine/mail/addr?p=1">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px;">받은편지함</div>
                    <div id="detail-container">
                        <div class="d-flex">
                            <a href=""><img src="${imgPath}/mail_d_arrow_pre.png"></a>
                            <a href=""><img src="${imgPath}/trash_icon.png"></a>
                            <a href=""><img src="${imgPath}/mail_d_star_blank.png"></a>
                            <a href=""><img src="${imgPath}/mail_d_reply.png"></a>
                        </div>

                        <div id="title">${mailVo.title}</div>

                        <div class="d-flax">
                            <span>보낸이 : ${mailVo.senderEmail}</span> 
                            <button  id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">주소록에 추가</button>
                            <span id="time">${mailVo.sendDate}</span>
                        </div>

                        <div id="content">${mailVo.content}</div>

                        <!-- 다운로드 처리 -->
                        <div>
                            <button id="down">전부 다운로드</button> :
                            <div id="downloadList">
	                            <c:forEach items="${mailVo.mailAttVo}" var="fileName">
		                            <a href="${fileName.path}/${fileName.name}" download>${fileName.realName}</a>&nbsp;&nbsp;
	                            </c:forEach>
                            </div>
                        </div>
						
                        <div class="d-flex justify-content-end">
                            <button id="reply-btn">
                                <img src="${imgPath}/mail_d_reply.png">
                                답장
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <!-- 주소록 추가 모달 -->
    <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
</body>
</html>