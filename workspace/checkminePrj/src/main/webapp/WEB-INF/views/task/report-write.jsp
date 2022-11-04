<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--tagify-->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />


<!DOCTYPE html>
<c:set value="${pageContext.request.contextPath}" var="root"></c:set>
<html>
<head>
<script defer src="${root}/resources/js/tagify-att.js"></script>
<script defer src="${root}/resources/js/tagify-ratt.js"></script>
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
    
    /*활성화 카테고리 색상 변경*/
    .active	{
    	margin-left: 40px;
    	border-top: 1px solid #B0D9D1 !important;
    	border-left: 1px solid #B0D9D1 !important;
    	border-right: 1px solid #B0D9D1 !important;
    	color: #B0D9D1 !important;
    }

    #report{
        border: 3px solid #B0D9D1;
        border-bottom: none;
        margin-left: 20px;

        color: #B0D9D1;
        font-weight: bold;
    }

    /*작성 부분*/
	#table{
        margin: 10px auto;
        width:95%;
        height: 90%;
        display: grid;
        grid-template-columns: 100px;
        grid-template-rows: 40px 40px 40px 40px 40px 550px 40px 40px;
		border: 1px solid #5D736F;
        border-radius: 10px;
	}
	
	#table>div{
        border-bottom: 1px solid #5D736F;
        text-align: center;
	}

    #subject{grid-column-start: 1; grid-column-end: 3;}
    #text-area{grid-column-start: 1; grid-column-end: 3;}
    #title > input {
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

    #order {
        border-radius: 10px 0 0 0 ;
    }

    #select, #select > select{
        border-radius: 0 10px 0 0;
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
        border-radius: 0 0 10px 0;
        border-bottom: none !important;
    }


    /*border-radius*/
    #title-diveision{
        border-radius: 10px 0 0 0 ;
    }

    #title, input[type="text"]{
        border-radius: 0 10px 0 0 ;
    }

/*스크롤바 설정*/
#text, #show-files{
        overflow: auto;
    }

    #text::-webkit-scrollbar, #show-files::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    #text::-webkit-scrollbar-thumb, #show-files::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    #text::-webkit-scrollbar-track, #show-files::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

    /*tagify*/
    .tag{
        width: 100%;
        height: 100%;
    }

    .tag:focus{
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
			          <a class="nav-link active" href="${root}/task/report/list/1">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>

                <form action="" method="post" enctype="multipart/form-data" onsubmit="return check();">
                    <div id="table">
                        <div class="division" id="order">지시서</div>
                        <div id="select">
                            <select name="taskNo">
                                <c:forEach items="${taskList}" var="task">
                                    <option value="${task.no}">${task.no} | ${task.orderer} | ${task.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="division" id="title-diveision">제　목</div><div id="title"><input type="text" name="title"></div>
                        <div class="division">수　신</div>
                        <div class="destination">
                            <input type="text" class="tag" name="attNoA" placeholder="수신받을 직원의 이름을 적으세요.">
                        </div>
                        <div class="division">참　조</div>
                        <div class="reference">
                            <input type="text" class="tag" name="attNoR" placeholder="참조할 직원의 이름을 적으세요.">
                        </div>
                        <div class="division" id="subject">내　용</div>
                        <div id="text-area" class="division">
                            <textarea name="content" id="text" cols="30" rows="10"></textarea>
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
        }
    </script>


</body>
</html>