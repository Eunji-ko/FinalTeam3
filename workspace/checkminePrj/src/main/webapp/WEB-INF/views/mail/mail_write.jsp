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
    #container{
        width: 1249px;
        min-height: 691px;
        border: 1px solid #8d8d8d;
        border-radius: 20px;
        padding: 18px 45px 12px 37px;
    }
    .info{
        border-bottom: 1px solid #8d8d8d;
        padding-bottom: 7px;
        padding-top: 7px;
    }
    .info>span:nth-child(1){
        display: inline-block;
        width: 64px;
    }
    .info>span:nth-child(2){
        display: inline-block;
        width: 10px;
    }
    .info>input{
        border:none;
        width: 1083px;
        outline: none;
    }

    #receiver{
        border-bottom: 1px solid #8d8d8d;
        padding-bottom: 7px;
        padding-top: 7px;
    }
    #receiver>span:nth-child(1){
        display: inline-block;
        width: 64px;
    }
    #receiver>span:nth-child(2){
        display: inline-block;
        width: 10px;
    }
    #receiver>input[type="text"]{
        border:none;
        width: 970px;
        outline: none;
    }
    #receiver>button{
        display: inline-flex;
        align-items:center;
        justify-content: center;
        background-color: #d9d9d9;
        width: 102px;
        height: 17px;
        border: none;
        border-radius: 5px;
        font-size: 12px;
    }

    #content{
        padding-top: 7px;
    }
    #content>span:nth-child(1){
        display: inline-block;
        width: 64px;
    }
    #content>span:nth-child(2){
        display: inline-block;
        width: 10px;
    }


</style>
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr_modal.css">

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

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
                    <div style="margin-left: 12px; margin-bottom: 3px; font-size: 30px;">메일 쓰기</div>
                    <form id="container" method="get" action="보내는경로">
                        <div class="info">
                            <span>제목</span>
                            <span>:</span> 
                            <input type="text" name="title">
                        </div>
                        <div id="receiver">
                            <span>받는사람</span>
                            <span>:</span> 
                            <input type="text">
                            <button type="button" id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">주소록에 추가</button>
                        </div>
                        <div class="info">
                            <span>참조인</span>
                            <span>:</span> 
                            <input type="text" name="refer">
                        </div>
                        
                        <textarea name="" id="editor"></textarea>

                    </form>
                </div>
            </div>
        </main>
    </div>
   <!-- 주소록 추가 모달 -->
   <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
</body>

<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

<!-- Initialize Quill editor -->
<script>
  var quill = new Quill('#editor', {
    theme: 'snow'
  });
</script>
</html>