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
<!-- 주소록 모달 -->
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr.css">
<!-- 주소록 추가 모달 -->
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

            <div id="wrapper" class="d-flex" style="padding-top: 8px;">
                <div id="container-nav">
                    <div onclick="location.href='/checkmine/mail/write'">
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
                        <li><div><a href="">받은편지함</a><span>21</span></div></li>
                        <li><div><a href="">보낸편지함</a><span>21</span></div></li>
                        <li><div><a href="">중요편지함</a><span>21</span></div></li>
                        <li><div><a href="">임시보관함</a><span>21</span></div></li>
                        <li><div><a href="">휴지통</a></div></li>
                        <li><div class="container-nav-selected"><a href="/checkmine/mail/addr">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px; font-size: 30px;">주소록</div>
                    <div id="addr-box-wrap">

                        <!-- 사내 -->
                        <div class="addr-box">
                            <div class="category">사내</div>

                            <!-- 여기부터 리스트 받아오기 -->
                            <div class="list">
                                <input type="checkbox">
                                <span class="name">박찬규</span>
                                <span class="addr">chanrb0966@gmail.com</span>
                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
                            </div>
                            <!-- 여기까지 -->

                            <div class="footer-menu">
                                <input type="checkbox">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
                                <span>1 page</span>
                                <a class="pre-arrow" href=""><img src="${imgPath}/mail_arrow_pre.png"></a>
                                <a href=""><img src="${imgPath}/mail_arrow_next.png"></a>
                            </div>
                        </div>

                        <!-- 거래처 -->
                        <div class="addr-box">
                            <div class="category">거래처</div>

                            <!-- 여기부터 리스트 받아오기 -->
                            <div class="list">
                                <input type="checkbox">
                                <span class="name">박찬규</span>
                                <span class="addr">chanrb0966@gmail.com</span>
                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
                            </div>
                            <!-- 여기까지 -->

                            <div class="footer-menu">
                                <input type="checkbox">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
                                <span>1 page</span>
                                <a class="pre-arrow" href=""><img src="${imgPath}/mail_arrow_pre.png"></a>
                                <a href=""><img src="${imgPath}/mail_arrow_next.png"></a>
                            </div>
                        </div>

                        <!-- 외부 -->
                        <div class="addr-box">
                            <div class="category">외부</div>

                            <!-- 여기부터 리스트 받아오기 -->
                            <div class="list">
                                <input type="checkbox">
                                <span class="name">박찬규</span>
                                <span class="addr">chanrb0966@gmail.com</span>
                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
                            </div>
                            <!-- 여기까지 -->

                            <div class="footer-menu">
                                <input type="checkbox">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
                                <span>1 page</span>
                                <a class="pre-arrow" href=""><img src="${imgPath}/mail_arrow_pre.png"></a>
                                <a href=""><img src="${imgPath}/mail_arrow_next.png"></a>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div id="addr-search">
                            <img src="${imgPath}/mail_search.png">
                            <input type="text" placeholder="주소록 검색">
                        </div>

                        <div id="addr-search-result">
                            <!-- 결과 리스트 가져오기 -->
                            <div class="result">
                                <span>박찬규</span>
                                <span>chanrb0966@gmail.com</span>
                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
                            </div>
                        </div>
                    </div>

                    <button id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">추가</button>
                    
                </div>
            </div>
        </main>
    </div>
    <!-- 주소록 추가 모달 -->
    <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
</body>
</html>