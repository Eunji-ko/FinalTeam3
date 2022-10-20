<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #approval-list-div{
        height: 100%;
        width: 100%;
    }
    #approval-list-wrapper{
        width: 100%;
        height: 95%;
        padding: 30px;
        display: grid;
        grid-template-columns: 1fr 2fr 6fr 2fr;
        grid-template-rows: repeat(16, 1fr);
    }
    .list-title{
        background-color:#91b3ac;
        color: white;
        padding-top: 15px;
        padding-left: 10px;
        border-bottom: 2px solid black;
    }
    .list-content{
        padding-top: 15px;
        padding-left: 10px;
        border-bottom: 1px solid black;
    }
    .list-content>a{
        text-decoration: none;
        color: black;
    }
    #page-area{
            width: 30%;
            height: 50px;
            padding-top: 5px;
            margin: auto;
            display: block;
        }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
            <div id="approval-list-div">
                <div id="approval-list-wrapper">
                    <div class="list-title">문서번호</div>
                    <div class="list-title">문서종류</div>
                    <div class="list-title">제목</div>
                    <div class="list-title">작성자</div>
    
                    <div class="list-content">1</div>
                    <div class="list-content">기안서</div>
                    <div class="list-content"><a href="">기안서제목</a></div>
                    <div class="list-content">김사원</div>
                </div>

                <div id="page-area">
    
                    <c:if test="${pv.startPage ne 1}">
                    <a href="${rootPath}/approval/list/${pv.startPage - 1}" class="btn btn-sm mint-btn">이전</a>
                    </c:if>
                    
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                        <a href="${rootPath}/approval/list/${i}" class="btn btn-sm">${i}</a>
                    </c:forEach>
                    
                    <c:if test="${pv.endPage ne pv.maxPage}">
                    <a href="${rootPath}/approval/list/${pv.endPage + 1}" class="btn btn-sm mint-btn">다음</a>
                    </c:if>
                </div>
            </div>
        </main>
    </div>
</body>
</html>