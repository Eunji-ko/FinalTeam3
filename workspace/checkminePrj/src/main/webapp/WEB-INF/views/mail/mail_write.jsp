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

<!-- tagify -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<!-- tinymce -->
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

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
        margin: 0;
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

    /* 파일 업로드 레이아웃 */
    #file-upload-box{
        display: flex;
    }
        /* 파일업로드 버튼 */
    #file-upload{
        position: absolute;
        z-index: -1;
    }
    label[for="file-upload"]{
        width: 68px;
        height: 22px;
        background-color: #cdcdcd;
        border: none;
        border-radius: 3px;
        padding-left: 3px;
    }
    label[for="file-upload"]:active{
        background-color: #8d8d8d;
    }
        /* 파일 미리보기 */
    #file-preview{
        width: 500px;
        height: 100px;
        background-color: #c9c9c9;
        border: none;
        border-radius: 10px;
        padding: 10px;
        margin: 10px;
        overflow-y: scroll;
    }
    #file-preview::-webkit-scrollbar {
        width: 14px;  /* 스크롤바의 너비 */
    }
    #file-preview::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #5d786f; /* 스크롤바의 색상 */
        border-radius: 10px;
    }
    #file-preview::-webkit-scrollbar-track {
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 10px;
        background: #d9d9d9;  /*스크롤바 뒷 배경 색상*/
    }

    #file-upload-box>#grow{
        flex-grow: 1;
    }

    #send-submit-button{
        width: 83px;
        height: 32px;
        border: none;
        border-radius: 10px;
        background-color: #c4f2ea;
        align-self: flex-end;
        margin: 0 0 20px 10px
    }
    #send-submit-button:active{
        background-color: #B0D9D1;
    }

    .t-in{
        font-size: 14px;
        --tag-pad: 0.1em 0.1em;
        min-width: 970px;
        border: none;
    }
   
</style>
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
                    <form id="container" method="post">
                        <div class="info">
                            <span>제목</span>
                            <span>:</span> 
                            <input type="text" name="title">
                        </div>
                        <div id="receiver">
                            <span>받는사람</span>
                            <span>:</span> 
                            <input type="text" name="receiver" class="t-in">
                            <button type="button" id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">주소록에 추가</button>
                        </div>
                        <div class="info">
                            <span>참조인</span>
                            <span>:</span> 
                            <input type="text" name="refer" class="t-in">
                        </div>

                        <textarea id="mytextarea" name="content"></textarea>
                        
                        <div id="file-upload-box">
                            <div>
                                <div class="info" style="border: none;">
                                    <span>파일첨부</span>
                                    <span>:</span>
                                </div>
                                <label for="file-upload">파일선택</label>
                            </div>
                            <div id="file-preview">
                                <input type="file" name="file" id="file-upload" multiple>

                            </div>
                            <div id="grow"></div>
                            <input type="submit" value="임시저장" id="send-submit-button" onclick="sendMail('save');">
                            <input type="submit" value="메일전송" id="send-submit-button" onclick="sendMail('send');">
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
   <!-- 주소록 추가 모달 -->
   <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
</body>

<script>
    // Tagify 설정
    const receiverInput = document.querySelector("input[name='receiver']");
    const referInput = document.querySelector("input[name='refer']");

    new Tagify(receiverInput,{
        pattern: /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    });
    new Tagify(referInput,{
        pattern: /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    });

    //tinymce 설정
    tinymce.init({
        selector: '#mytextarea',
        plugins: [
            'a11ychecker','advlist','advcode','advtable','autolink','checklist','export',
            'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks',
            'powerpaste','fullscreen','formatpainter','insertdatetime','table','help','wordcount'
        ],
        toolbar: 
            'undo redo | formatpainter casechange blocks | bold italic backcolor | ' +
            'alignleft aligncenter alignright alignjustify | ' +
            'bullist numlist checklist outdent indent | removeformat | a11ycheck code table help',
        height: 600,
        resize: false
    });

    //파일 업로드시
    const input = document.querySelector('#file-upload');
    const preview = document.querySelector('#file-preview');
    input.addEventListener("change",function(){
        const preNods = document.querySelectorAll('#file-preview div');

        for(var i=0;i<preNods.length;i++){
            preview.removeChild(preNods[i]);
        }

        const uploadFiles = input.files;

        for(var i = 0;i<uploadFiles.length;i++){
            let preItem = document.createElement('div');
            preItem.innerText = uploadFiles[i].name;

            preview.appendChild(preItem);
        }

    });

    // submit시 TODO:유효성 검사
    function sendMail(str){
        if(str == 'send'){
            document.querySelector('#container').setAttribute('action','send');
        }else if(str == 'save'){
            document.querySelector('#container').setAttribute('action','save');
        }else{}
    }


</script>

</html>