<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
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
                
                <!--지시서 목록-->
                <div id="center">
                    <div class="list-header">번호</div>
                    <div class="list-header">중요도</div>
                    <div class="list-header">수신자</div>
                    <div class="list-header">제목</div>
                    <div class="list-header">작성자</div>
                    <div class="list-header">날짜</div>
                    <c:forEach items="${orderList}" var="vo">
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