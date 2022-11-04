<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #table{
        display: grid;
        grid-template-columns: 100px 1fr 100px 2fr 100px 1fr;
        grid-template-rows: 30px 30px 30px 30px 30px 600px;

        margin: 10px auto;
        width:95%;
        height: 90%;
        display: grid;

		border: 1px solid #5D736F;
        border-radius: 10px;
        line-height: 30px;
    }

    .division{
        background-color: #f0f0f0;
        line-height: 30px;
        border-bottom: 1px solid #5D736F;
        
        text-align: center;
        font-weight: 700;
    }

    #title{
        grid-column-start: 2; grid-column-end: 7;
    }

    .title{
        border-radius: 10px 0 0 0 ;
    }

    .content{
        grid-column-start: 1; grid-column-end: 7;
    }

    .reference, .destination{
        grid-column-start: 2; grid-column-end: 7;
    }

    #file-wrap{
        grid-column-start: 2; grid-column-end: 7;
    }

    .value{
        border-bottom: 1px solid #5D736F;
        padding-left: 10px;
    }

    .file{
        border-radius: 0 0 0 10px;
    }

    .file, #file-wrap{
        border-top: 1px solid #5D736F;
        border-bottom: none;
    }
    /*스크롤바 설정*/
    .bot{
        border-bottom: none !important;
        overflow: auto;
    }

    .bot::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    .bot::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    .bot::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

    /*수정-삭제-목록 버튼*/
    .btn-area {
        display: flex;
        justify-content: right;
        margin-right: 40px;
    }

    .btn-area a {
        margin-left: 10px;
        background-color: #5D736F;
        color: white;
        width: 70px;
        height: 40px;
        border-radius: 30px;
        line-height: 40px;
        text-decoration: none;
        text-align: center;
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
			          <a class="nav-link active" href="${root}/task/report/list/1">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>
                
                <div id="table">
                    <div class="division title">제　목</div><div class="value" id="title">${vo.title}</div>
                    <div class="division">작성자</div><div class="value">${vo.sender}</div>
                    <div class="division">부서 / 직위</div><div class="value">${vo.deptNo} / ${vo.posName}</div>
                    <div class="division">작성 일시</div><div class="value">${vo.enrollDate}</div>
                    <div class="division">수　신</div><div class="value destination">${aVo.empNo}</div>
                    <div class="division">참　조</div><div class="value reference">${rVo.empNo}</div>
                    <div class="division content">내용</div>
                    <div class="content value bot">
                        ${vo.content}
                    </div>
                    <div class="division file">첨부 파일</div>
                    <div class="value" id="file-wrap">
	                    <c:forEach items="${fileVo}" var="fv">                    	                    	
	                    	<a href="${root}/task/report/download/${vo.no}/${fv.no}" id="file">${fv.name}</a>
	                    </c:forEach>
                   	</div>
                </div>
                <div class="btn-area">
                    <c:if test="${vo.sender eq loginMember.name}">
                        <a href="${root}/task/report/edit/${fv.no}">수정</a>
                        <a href="${root}/task/report/del/${fv.no}">삭제</a>
                    </c:if>
                    <a href="${root}/task/report/list/1">목록</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>