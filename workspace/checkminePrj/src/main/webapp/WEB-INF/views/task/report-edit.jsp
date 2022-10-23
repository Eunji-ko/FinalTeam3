<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!--폰트어썸 최신 CDN-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<style>
    /*카테고리*/
        .nav-tabs{
        margin-top: 40px;
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
        grid-template-columns: 1fr 2fr 1fr 2fr 1fr 2fr;
        grid-template-rows: 40px 40px 40px 40px 550px;
		border: 1px solid #5D736F;
        border-radius: 10px;
	}
	
	#table>div{
        border-bottom: 1px solid #5D736F;
        text-align: center;
	}

    #title{
        grid-column-start: 2;
        grid-column-end: 7;
    }

    #title > input {
        border: none;
        width: 100%;
        height: 100%;
    }

    #file {
        grid-column-start: 2;
        grid-column-end: 7;
    }

    #subject{
        grid-column-start: 1;
        grid-column-end: 7;
    }

    #text-area{
        grid-column-start: 1;
        grid-column-end: 7;
        border-bottom: none !important;
        border-radius: 0 0 10px 10px;
    }

    textarea{
        width: 100%;
        height: 100%;
        border: none;
        resize: none;
        border-radius: 0 0 10px 10px;
    }

    #submit-area{
        margin-right: 40px;
        text-align: right;
    }

    input[type="submit"]{
        padding: 5px;
        width: 70px;
        border: 1px solid #5D736F;
        background-color: #5D736F;
        border-radius: 30px;
        color: white;
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

    /*파일 첨부 css*/
    input[type=file]::file-selector-button {
        width: 100px;
        margin: 5px;
        height: 30px;
        background: #5D736F;
        border: 1px solid #5D736F;
        color: white;
        border-radius: 10px;
        cursor: pointer;
    }

    /*border-radius*/
    #title-diveision{
        border-radius: 10px 0 0 0 ;
    }

    #title, input[type="text"]{
        border-radius: 0 10px 0 0 ;
    }

    /*스크롤바 설정*/
    #text{
        border-bottom: none !important;
        overflow: auto;
    }

    #text::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    #text::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    #text::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			<div id="wrap">
                <!--카테고리-->
				<ul class="nav nav-tabs">
			        <li class="nav-item">
			          <a class="nav-link active" href="${root}/task/report/list">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>

                <!--본문-->
                <form action="" method="post">
                    <div id="table">
                        <div class="division" id="title-diveision">제　목</div><div id="title"><input type="text" name="title"></div>
                        <div class="division">수신처</div>
                        <div>
                            <select  multiple>
                                <option value="1">부장님</option>
                                <option value="2">대리님</option>
                                <option value="3">사장님</option>
                                <option value="4">이사님</option>
                            </select>
                        </div>
                        <div class="division">참　조</div>
                        <div>
                            <select>
                                <option value="1">부장님</option>
                                <option value="2">대리님</option>
                                <option value="3">사장님</option>
                                <option value="4">이사님</option>
                            </select>
                        </div>
                        <div class="division">중요도</div>
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
                        <div class="division">첨부 파일</div><div id="file"><input type="file" multiple></div>
                        <div class="division" id="subject">내　용</div>
                        <div id="text-area" class="division"><textarea name="content" id="text" cols="30" rows="10"></textarea></div>

                    </div>
                    <div id="submit-area">
                        <input type="submit" value="수정">
                    </div>
            </div>
        </main>
    </div>
</body>
</html>