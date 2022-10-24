<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% //테스트용 멤버
	com.kh.checkmine.member.vo.MemberVo vo = new com.kh.checkmine.member.vo.MemberVo();
	vo.setNo("10");
	vo.setName("박정규");
	vo.setPosNo("6");
	vo.setDeptNo("2");
	session.setAttribute("loginMember", vo);
%>

<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>업무</title>
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

    #report{
    	margin-left: 40px;
    }
    
    /*활성화 카테고리 색상 변경*/
    .active	{
    	border-top: 1px solid #B0D9D1 !important;
    	border-left: 1px solid #B0D9D1 !important;
    	border-right: 1px solid #B0D9D1 !important;
        border-bottom: 1px solid white !important;
    	color: #B0D9D1 !important;
    }

    #order{
        border: 3px solid #B0D9D1;

        color: #B0D9D1;
        font-weight: bold;
    }

    /*검색 기능+작성 버튼*/
    #search-write-box {
        margin-left: 20px;
        margin-right: 20px;
        display: flex;
        justify-content: space-between;
    }

    /*검색 기능*/
    #search{
        margin: 20px;
        border: 1px solid gray;
        border-radius: 50px;
    }
    
    /*검색 이미지*/
    form > div > img{
        margin-left: 10px;
        margin-bottom: 4px;
    }

    /*작성 버튼*/
    #write-box {
        margin: 25px;
    }

    #write{
        padding: 10px;
        border: 1px solid #5D736F;
        background-color: #5D736F;
        border-radius: 30px;
        color: white;
        text-decoration: none;
    }

    input[type="text"] {
        padding: 10px;
        border: none;
        height: 35px;
        border-radius: 50px;
    }

    #center{
        width: 95%;
        height: 90%;
        margin: auto;

        display: grid;
        grid-template-columns: 100PX 100PX 250px 700px 100px 200px;
        grid-template-rows: repeat(16, 40px);
    }
    
    #center > div{
        text-align: center;
    }

    .list-header{
        background-color: #B0D9D1;
        font-weight: bolder;
        font-size: large;
        line-height: 40px;
        border-right: 1px solid white;
    }

    .list{
        border-bottom: 1px solid lightgray;
        line-height: 35px;
        font-size: large;
    }

    #title>a {
        text-decoration: none;
        color: black;
    }

    #title:hover{ 
        text-decoration: underline;
    }


    /*페이징*/
    #page-area{
        margin-top: 20px;
        text-align: center;
    }

    #page-area > a {
        font-size: large;
        text-decoration: none;
        color: black;
        height: 10px;
        padding: 5px 10px 5px 10px;
        border-radius: 10px;
    }

    #page-area > a:hover {
        background-color: #B0D9D1;
        color: white;
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
			          <a class="nav-link" id="report" href="${root}/task/report/list">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" id="order" href="${root}/task/order/list/1">지시</a>
			        </li>
			      </ul>

                <!--검색 기능-->
                <div id="search-write-box">
                    <form action="" id="search">
                        <div>
                            <img src="${root}\resources\img\personnel\search_icon.png" alt="검색 아이콘" width="20px">
                            <input type="text" placeholder="지시서 검색">
                        </div>
                    </form>
                    <c:if test="${not empty loginMember}">
                    	<div id="write-box"><a href="${root}/task/order/write" id="write">지시서 작성</a></div>
                    </c:if>
                </div>
                
                <!--보고서 목록-->
                <div id="center">
                    <div class="list-header">번호</div>
                    <div class="list-header">중요도</div>
                    <div class="list-header">수신자</div>
                    <div class="list-header">제목</div>
                    <div class="list-header">작성자</div>
                    <div class="list-header">날짜</div>
                    <c:forEach items="${voList}" var="vo">
 	                   <c:if test="${vo.orderer eq loginMember.name or vo.attName eq loginMember.name}">
		                    <div class="list">${vo.no}</div>
		                    <div class="list">
		                    	<c:if test="${vo.importance eq 'N'}"> <span>보통</span></c:if>
		                    	<c:if test="${vo.importance eq 'E'}"> <span>중요</span></c:if>
		                    	<c:if test="${vo.importance eq 'I'}"> <span>긴급</span></c:if>
		                    </div>
		                    <div class="list">
		                    		${vo.attName}
		                    </div>
		                    <div class="list" id="title"><a href="${root}/task/order/detail/${vo.no}">${vo.title}</a></div>
		                    <div class="list">${vo.orderer}</div>
		                    <div class="list">${vo.enrollDate}</div>
	                    </c:if>
                    </c:forEach>

                </div>
                
                <!--페이징-->
                <div id="page-area">
                	<c:if test="${pv.startPage ne 1}">                	
	                    <a href="${root}/task/order/list/${pv.startPage-1}"><</a>
                	</c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                    	<a href="${root}/task/order/list/${i}">${i}</a>
                    </c:forEach>
                    <c:if test="${pv.endPage ne pv.maxPage}">
                    	<a href="${root}/task/order/list/${pv.endPage + 1}">></a>
                    </c:if>
                </div>
            </div>
        
        </main>
    </div>
</body>
</html>