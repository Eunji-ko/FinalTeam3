<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>CheckMine - 메일</title>
<!-- 주소록 모달 -->
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr.css">
<!-- 주소록 추가 모달 -->
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr_modal.css">
<style>
    #address-zone {
        width: 1400px;
        margin: 0 auto;
    }
    #addr-add {
        position: relative;
        margin-top: 10px;
        margin-left: 430px;
    }
</style>
<c:set var="imgPath" value="/checkmine/resources/img/mail"/>
</head>
<body>

    <div id="address-zone">
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
        <hr>
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
        <!-- 주소록 추가 모달 -->
        <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
    </div>
</body>
</html>