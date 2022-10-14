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
    #addr-box-wrap{
        width: 1248px;
        display: flex;
        justify-content: space-between;
        padding-left: 10px;
    }

    /* 각각의 주소 박스 */
    .addr-box{
        position: relative;
        width: 380px;
        height: 480px;
        border: 1px solid #c2c2c2;
        margin-top: 20px;
        margin-bottom: 10px;
        padding: 20px;
    }
    .addr-box>.category{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 30px;
    }
    .addr-box>.list{
        display: flex;
        align-items: center;
        border-bottom: 1px solid #c2c2c2;
        padding: 7px 2px 7px 2px;
        font-size: 13px;
    }
    .addr-box>.list>input[type="checkbox"]{
        width: 17px;
        height: 17px;
        margin-right: 10px;
    }
    .addr-box>.list>.name{
        width: 52px;
    }
    .addr-box>.list>.addr{
        width: 190px;
    }
    .addr-box>.list>.delete{
        margin-right: 17px;
    }
    .addr-box>.footer-menu{
        width: 340px;
        display: flex;
        align-items: center;
        position: absolute;
        bottom: 15px;
    }
    .addr-box>.footer-menu input{
        width: 17px;
        height: 17px;
        margin-right: 10px;
    }
    .addr-box>.footer-menu span{
        display: inline-block;
        margin-left: 180px;
    }
    .addr-box>.footer-menu .pre-arrow{
        margin: 0px 10px 0px 10px;
    }

    /* 주소록 검색창 */
    #addr-search{
        width: 510px;
        height: 33px;
        border: 1px solid #cdcdcd;
        border-radius: 18px;
        display: flex;
        align-items: center;
        padding: 3px 10px 0px 10px;
        margin: 0px 0px 10px 10px;
    }
    #addr-search>input{
        margin-left: 7px;
        flex-grow: 1;
        border: none;
        outline: none;
    }

    /* 주소록 결과 */
    #addr-search-result{
        width: 509px;
        height: 140px;
        border: 1px solid #cdcdcd;
        margin-left: 10px;
        padding: 7px;
        overflow-y: scroll;
        font-size: 13px;
    }
    #addr-search-result::-webkit-scrollbar {
        width: 14px;  /* 스크롤바의 너비 */
    }
    #addr-search-result::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #5d786f; /* 스크롤바의 색상 */
        border-radius: 10px;
    }
    #addr-search-result::-webkit-scrollbar-track {
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 10px;
        background: #d9d9d9;  /*스크롤바 뒷 배경 색상*/
    }

    /* 주소록 검색 결과 리스트 */
    #addr-search-result>.result{
        border-bottom: 1px solid #cdcdcd;
        display: flex;
        align-items: center;
        padding-bottom: 3px;
    }
    #addr-search-result>.result>span:nth-child(1){
        display: inline-block;
        width: 80px;
    }
    #addr-search-result>.result>span:nth-child(2){
        display: inline-block;
        width: 300px;
    }
    #addr-search-result>.result>.delete{
        margin-right: 20px;
    }

    /* 주소록 추가 버튼 */
    #wrapper{
        position: relative;
    }
    
    #addr-add{
        width: 100px;
        height: 37px;
        border: none;
        background-color: #B0D9D1;
        border-radius: 5px;
        position: absolute;
        bottom: 0px;
        right: 12px;
    }

    #add-addr-modal-content{
        width: 553px;
        height: 280px;
        justify-content: center;
    }
    #modal-body-m{
        width: 506px;
        height: px;
    }
    
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

            <div id="wrapper" class="d-flex" style="padding-top: 8px;">
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
    <div class="modal fade" id="add-addr-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content"  id="add-addr-modal-content" >
                <div id="modal-body-m" style="border: black;"> sdfsdf</div>
            </div>
        </div>
    </div>
</body>
</html>