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
                        <li><div><a href="/checkmine/mail/receive?p=1">받은편지함</a><span>${notReadCountReceive}</span></div></li>
                        <li><div><a href="/checkmine/mail/ref?p=1">참조편지함</a><span>${notReadCountRef }</span></div></li>
                        <li><div><a href="/checkmine/mail/send?p=1">보낸편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/imp?p=1">중요편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/save?p=1">임시보관함</a></div></li>
                        <li><div><a href="/checkmine/mail/bin?p=1">휴지통</a></div></li>
                        <li><div class="container-nav-selected"><a href="/checkmine/mail/addr?p=1">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px; font-size: 30px;">주소록</div>
                    <div id="addr-box-wrap">

                        <!-- 사내 ========================================================================== -->
                        
                        <div class="addr-box" id="inner-box">
                            <div class="category">사내</div>

                            <!-- 여기부터 리스트 받아오기 -->
                            <div class="list-wrap">
	                            <c:forEach items="${AddrListInner }" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" value="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
                            </div>
                            <!-- 여기까지 -->

                            <div id="inner-footer" class="footer-menu">
                                <input type="checkbox" onclick="selectAll(this, '#inner-box');">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
                            </div>
                        </div>

                        <!-- 거래처 ==========================================================================  -->
                        
                        <div class="addr-box" id="acc-box">
                            <div class="category">거래처</div>

							<div class="list-wrap">
                            <!-- 여기부터 리스트 받아오기 -->
	                            <c:forEach items="${AddrListAcc}" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" id="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
							</div>
                            <!-- 여기까지 -->

                            <div id="acc-footer" class="footer-menu">
                                <input type="checkbox" onclick="selectAll(this, '#acc-box');">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
                            </div>
                        </div>

                        <!-- 외부 ==========================================================================  -->
                        
                        <div class="addr-box" id="outer-box">
                            <div class="category">외부</div>
							
							<div class="list-wrap">
	                            <!-- 여기부터 리스트 받아오기 -->
	                            <c:forEach items="${AddrListOuter}" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" id="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="주소록에서_삭제"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="이_주소로_메일_쓰기"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
							</div>
                            <!-- 여기까지 -->

                            <div id="outer-footer" class="footer-menu">
                                <input type="checkbox" onclick="selectAll(this, '#outer-box');">
                                <a href=""><img src="${imgPath}/trash_icon.png"></a>
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
    
    <script type="text/javascript">
		// 전체선택 전체 해재
	    function selectAll(selectAll, targetId)  {
	        const checkboxes = document.querySelectorAll(targetId +' input[type="checkbox"]');
	        
	        checkboxes.forEach((checkbox) => {
	            checkbox.checked = selectAll.checked;
	        })
		}
		
		
    </script>
</body>
</html>