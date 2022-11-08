<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${pageContext.request.contextPath}" var="root"></c:set>
<!--폰트어썸 최신 CDN-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--tagify-->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<script defer src="${root}/resources/js/writeAtt.js?v=<%=System.currentTimeMillis() %>"></script>
<script defer src="${root}/resources/js/writeRatt.js?ver=1.0?v=<%=System.currentTimeMillis() %>"></script>

<!DOCTYPE html>
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
    
    /*활성화 카테고리 색상 변경*/
    .active	{
    	border-top: 1px solid #B0D9D1 !important;
    	border-left: 1px solid #B0D9D1 !important;
    	border-right: 1px solid #B0D9D1 !important;
        border-bottom: 1px solid white !important;
    	color: #728D89 !important;
    }

    #order{
        border: 3px solid #B0D9D1;

        color: #728D89;
        font-weight: bold;
    }

    /*작성 부분*/
	#table{
        margin: 10px auto;
        width:95%;
        height: 90%;
        display: grid;
        grid-template-columns: 1fr 300px 1fr 400px 1fr 400px;
        grid-template-rows: 40px 40px 40px 40px 40px 550px 40px 40px ;
		border: 1px solid #5D736F;
        border-radius: 10px;
	}
	
	#table>div{
        border-bottom: 1px solid #5D736F;
        text-align: center;
	}

    div.title{grid-column-start: 2; grid-column-end: 7;}
    .importance{grid-row-start: 4; grid-row-end: 5;
        grid-column-start: 1; grid-column-end: 2;}
    #radio-area{grid-row-start: 4; grid-row-end: 5;
        grid-column-start: 2; grid-column-end: 3;}
    .destination{grid-column-start: 2; grid-column-end: 7;}
    .reference{grid-column-start: 2; grid-column-end: 7;}
    .attachments{grid-row-start: 8; grid-row-end: 10;}
    .file {grid-column-start: 2; grid-column-end: 7;}
    #subject{grid-column-start: 1; grid-column-end: 7;}
    #text-area{
        grid-column-start: 1;
        grid-column-end: 7;
    }
    .start-date{grid-column-start: 3; grid-column-end: 4;}
    .end-date{grid-column-start: 5; grid-column-end: 6;}


    .title input {
        border: none;
        width: 100%;
        height: 100%;
    }

    textarea{
        width: 100%;
        height: 100%;
        border: none;
        resize: none;
    }

    #submit-area{
        margin-right: 40px;
        text-align: right;
    }

    input[type="submit"]{
        padding: 5px;
        margin-top: 10px;
        margin-bottom: 20px;
        width: 70px;
        border: 1px solid lightgray;
        background-color: #B0D9D1;
        border-radius: 10px;
        color: white;
    }

    input[type="submit"]:hover{
        background-color: #5D736F;
    }

	/*구분 css*/
    .division {
        font-weight: 700;
        background-color: #f0f0f0;
        line-height: 40px;
    }

    select, input[type="file"]{
        width: 100%;
        height: 100%;
    }

    /*중요도*/
    #radio-area{
        width: 100%;
        line-height: 40px;
        display: flex;
        justify-content: space-evenly;
    }

    /*radio 꾸미기*/
    /*input 숨기기*/
    input[type="radio"] {
        display: none
    }

    /*input 바로 다음 label 설정*/
    input[type="radio"] + label {
        cursor: pointer;
    }

    /*innput 바로 다음 label:before에 체크하기 전 css 설정*/
    input[type="radio"] + label:before{
        content: "";
        margin: 4px;
        display: inline-block;
        width: 17px;
        height: 17px;
        line-height: 17px;
        border: 1px solid #cbcbcb;
        border-radius: 4px;
        vertical-align: middle;/*체크 전과 체크 후 높이 차이 때문에 설정*/
    }

    /*checked된 input 바로 다음의 label:before 에 체크 후 CSS 설정*/  
    input[type="radio"]:checked + label:before{
        content:"\f00c";/*폰트어썸 유니코드*/
        font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
        font-weight:900;/*폰트어썸 설정*/
        color:#fff;
        background-color:#5D736F;
        border-color:#5D736F;
        font-size:13px;
        text-align:center;
    }

    /*날짜*/
    .date-control{
        height: 100%;
        border: none;
        text-align: center;
        padding-right: 50px;
    }

    .date-control:hover{cursor: pointer;}

    /*파일 첨부 css*/
    input[type=file]::file-selector-button {
        width: 100px;
        height: 30px;
        margin: 5px;
        background: #B0D9D1;
        border: 1px solid lightgray;
        color: white;
        border-radius: 10px;
        line-height: 30px;
        display: right;
        padding: 0px;
    }

    input[type=file]{cursor: pointer;}
    input[type=file]::file-selector-button:hover{background: #5D736F;}

    .attachments{
        grid-row-start: 7;
        grid-row-end: 9;
        line-height: 40px;
        line-height: 80px;
        border-radius: 0 0 0 10px;
        border-bottom: none !important;
    }

    #show-files{
        grid-column-start: 2;
        grid-column-end: 7;
        border-radius: 0 0 10px 0;
        border-bottom: none !important;
    }

    /*border-radius*/
    #title-diveision{
        border-radius: 10px 0 0 0 ;
    }

    .title{
        border-radius: 0 10px 0 0 ;
    }

    /*스크롤바 설정*/
    #content, #show-files{
        overflow: auto;
    }

    #content::-webkit-scrollbar, #show-files::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    #content::-webkit-scrollbar-thumb, #show-files::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    #content::-webkit-scrollbar-track, #show-files::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

    /*tagify*/
    .tag{
        width: 100%;
        height: 100%;
    }

    .tagify__input{
        padding: 4px;
        text-align: left;
    }

    .tagify__tag {
        margin: 3px 2px 3px 3px !important;
    }

    .tags-look .tagify__dropdown__item{
        display: inline-block;
        border-radius: 3px;
        padding: .3em .5em;
        border: 1px solid #CCC;
        background: #F3F3F3;
        margin: .2em;
        font-size: .85em;
        color: black;
        transition: 0s;
    }

    .tagify__dropdown .destination-tags{
        border: 1px dashed #5D736F;
    }
    .tags-look .tagify__dropdown__item--active{
        color: black;
    }

    .tags-look .tagify__dropdown__item:hover{
        background: #D3E2E2;
        border-color: #B0D9D1;
    }
</style>
</head>
<body>

	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">

            <!--작성 칸-->
            <div id="wrap">

                <!--카테고리-->
				<ul class="nav nav-tabs">
			        <li class="nav-item">
			          <a class="nav-link" id="report" href="${root}/task/report/list/1">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" id="order" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>

                <form action="" method="post" enctype="multipart/form-data" onsubmit="return check();">
                    <div id="table">
                        <div class="division" id="title-diveision">제　목</div><div class="title"><input class="title" id="title" type="text" name="title"></div>
                        <div class="division">수　신</div>
                        <div class="destination">
                            <input class="tag"  id="att" name='attNoA' placeholder="수신받을 직원의 이름을 적으세요.">
                        </div>
                        <div class="division">참　조</div>
                        <div class="reference">
                            <input class="tag" id="ratt" name='attNoR' placeholder="참조할 직원의 이름을 적으세요.">
                        </div>
                        <div class="division importance">중요도</div>
                        <div id="radio-area">
                            <div>
                                <input type="radio" name="importance" id="nomal" value="N" checked/><label for="nomal"><span>보통</span></label>
                            </div>
                            <div>
                                <input type="radio" name="importance" id="import" value="I"/><label for="import"><span>중요</span></label>
                            </div>
                            <div>
                                <input type="radio" name="importance" id="emergency" value="E"/><label for="emergency"><span>긴급</span></label>
                            </div>
                        </div>
                        <div class="division start-date">시작일</div>
                        <div id="start-wrap"><input type="date" class="date-control" id="order_start_date" name="startDate"><input type="time" name="startTime"></div>
                        <div class="division end-date">마감일</div>
                        <div id="end-wrap"><input type="date" class="date-control" id="order_end_date" name="endDate"><input type="time" name="endTime"></div>
                        <div class="division" id="subject">내　용</div>
                        <div id="text-area" class="division">
                            <textarea name="content" id="content" cols="30" rows="10"></textarea>
                        </div>
                        <div class="division attachments">첨부 파일</div>
                        <div class="file"><input type="file" id="upload-file" name="files" multiple></div>
                        <div id="show-files"></div>
                    </div>
                    <div id="submit-area">
                        <input type="submit" value="작성">
                    </div>
                </form>
            </div>
        </main>
    </div>
    
    <!--빈칸 방지-->
    <script>
        document.getElementsByClassName('date-control').value = new Date().toISOString().substring(0, 10);

        const title = document.querySelector('#title');
        const content = document.querySelector('#content');
        const att = document.querySelector('#att');
        const startDate = document.querySelector('#order_start_date');
        const endDate = document.querySelector('#order_end_date');

        function check(){
            //제목
            if(title.value.length == 0){
                alert("제목을 작성해주세요.");
                return false;
            }

            //본문
            if(content.value.length == 0){
                alert("내용을 작성해주세요.");
                return false;
            }

            //수신
            if(att.value.length == 0){
                alert("수신인을 지정해주세요.");
                return false;
            }
            
            //시작일
            if(startDate.value.length == 0){
                alert("시작일을 지정해주세요.");
                return false;
            }
            
            //마감일
            if(endDate.value.length == 0){
                alert("마감일을 지정해주세요.");
                return false;
            }

            //시작일보다 마감일이 빠를 때
            if(startDate.value > endDate.value){
                alert("마감일을 다시 지정해주세요.");
                return false;
            }
        }
    </script>

    <!--파일 목록 출력-->
    <script>
        window.onload = function(){
            target = document.getElementById('upload-file');
            target.addEventListener('change', function(){
                fileList="";
                for(i=0; i<target.files.length;i++){
                    fileList += target.files[i].name + '<br>';
                }
                target2 = document.getElementById('show-files');
                target2.innerHTML = fileList;
            })
        }
    </script>

</body>
</html>

