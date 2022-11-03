<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시판</title>
<style>


    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
  
   
    #listArea{
        height: 633px;
        margin: 15px auto;
        border: 1px solid lightgray;
    }
    #pageArea {
        height: 50px;
        display: flex;
        justify-content: center;
    }
    .nav-tabs{
        margin-top: 20px;
    }

    #btn{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
        margin-left: 15px;
        border: none;

    }
    input[type="text"]{
        width: 230px;
        display: inline-block;
        border: none;
    }
    #search{
        background:url(${rootPath}/resources/img/admin/search.png);
        background-repeat: no-repeat;
        width:20px;
        height:17px;
        border: none;
        
    }
    #searchArea{
        display: flex;
        justify-content: space-between;
        height: 42px;
    }
    #listArea > table{
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        font-size: 15px;
    }
    #filter{
        width: 110px;
    }

    #pageArea > a{
        padding: 15px;
        text-decoration: none;
        color: black;
    }

    .nav-tabs .nav-link.active {
        color: #B0D9D1;
    }

    .nav-tabs .nav-link {
        color: black;
    }

    table{
        table-layout: fixed;
    }
    td, .title{
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
   
    .info{
        display: flex;
        justify-content: space-around;
    }
    .title, .writer{
        display: inline-block;
    }
    .title{
        width: 150px;
        margin-right: 10px;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
                <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                <a class="nav-link" href="${rootPath}/board/list/notice">공지사항</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="${rootPath}/board/list/community">커뮤니티</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="${rootPath}/board/list/gallery">갤러리</a>
                </li>
            </ul>
            

            <div class="tab-content">
                <!-- 검색 페이지 -->
                <div id="notice"><br>
                    <div id="searchArea">
                        <div style="display: inline-block; margin:10px">'${keyword}'의 검색결과입니다.</div>
                        <div style="display: flex;">
                        <form action="${rootPath}/board/search" method="get">
                            <div style="width: 267px; border: 1px solid lightgray; display: inline-block;" >
                                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="통합 검색" required>
                                <input type="submit" id="search" value="">
                            </div>
                        </form>
                        <button id="btn" onclick="location.href='${rootPath}/board/write'">글 작성</button>
                        </div>
                    </div>
                    <div id="listArea">
                        <table class="table table-hover">
                            <thead style="background-color: #C4F2EA;">
                                <tr>
                                    <th width="10%">번호</th>
                                    <th width="40%">제목</th>
                                    <th width="15%">작성자</th>
                                    <th width="15%">작성일</th>
                                    <th width="10%">추천수</th>
                                    <th width="10%">조회수</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: none;">
                                <c:forEach items="${boardList}" var="b">
                                <tr onclick="location.href='${rootPath}/board/detail/${b.no}'">
                                    <td>${b.no}</td>
                                    <td>${b.title}</td>
                                    <td>${b.writer}</td>
                                    <td>${b.enrollDate}</td>
                                    <td>${b.recommendCnt}</td>
                                    <td>${b.hit}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            
                        </table>
                    </div>






                    <div id="pageArea">
                        <c:if test="${pv.startPage ne 1}">
                            <a href="${rootPath}/board/search?keyword=${keyword}&p=${pv.startPage -1}">&lt;</a>            
                        </c:if>
                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                            <c:choose>
                                <c:when test="${pv.currentPage eq i}">
                                    <a style="font-weight:900;">${i}</a>  
                                </c:when>
                                <c:otherwise>
                                    <a href="${rootPath}/board/search?keyword=${keyword}&p=${i}">${i}</a>            
                                
                                </c:otherwise>
                            
                            </c:choose>
                            
                        </c:forEach>
                          <c:if test="${pv.endPage ne pv.maxPage}">
                            <a href="${rootPath}/board/search?keyword=${keyword}&p=${pv.endPage + 1}">&gt;</a>
                          </c:if>
                        </div>
                </div>
               
            </div>
               
            </div>
                
            </div>
            </div>
               
                
            
			
            
        </main>
    </div>
</body>
<script>
  



</script>
</html>