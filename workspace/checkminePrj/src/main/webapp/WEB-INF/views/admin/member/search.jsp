<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 사원검색</title>
<style>
    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
    #area1{
        height: 65px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }

    #area2{
        height: 65px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }

    #listArea{
        height: 633px;
        margin: 0px auto;
        border: 1px solid lightgray;
    }

    #pageArea {
        height: 50px;
        display: flex;
        justify-content: center;
    }

    #header{
        font-size: 20px;
        font-weight: bolder;
    }

    .btn{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
    }

    #filter{
        width: 110px;
        display: inline-block;
    }

    #option{
        width: 183px;
    }

    input[type="text"]{
        width: 230px;
        display: inline-block;
        border: none;
    }

    #search{
        background:url(${root}/resources/img/admin/search.png);
        background-repeat: no-repeat;
        width:20px;
        height:17px;
        border: none;
    }

    #listArea > table{
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        font-size: 15px;
    }

    #pageArea > a{
        padding: 15px;
        text-decoration: none;
        color: black;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">사원 관리</span>
                <button type="button" class="btn" onclick="location.href='${root}/admin/member/add'">사원등록</button>
            </div>

			<div id="area2">
				<div>
	                <select class="form-select" id="filter" onchange="location.href=this.value">
	                	<option value="">-----</option>
	                    <option value="${root}/admin/member/list?sort=a&p=1">모두</option>
	                    <option value="${root}/admin/member/list?sort=n&p=1">재직</option>
	                    <option value="${root}/admin/member/list?sort=y&p=1">퇴직</option>
	                </select>
	                <div style="display: inline-block; margin:10px">'${keyword}'의 검색결과입니다.</div>
				</div>
                <form action="${root}/admin/member/search" method="get">
                    <select class="form-select" id="option" name="option" required style="display: inline-block;">
                        <option value="name">이름</option>
                        <option value="dept">부서</option>
                        <option value="id">아이디</option>
                    </select>
                    <div style="width: 267px; border: 1px solid lightgray; display: inline-block;" >
                        <input type="text" name="keyword" id="keyword" class="form-control" required>
                        <input type="submit" id="search" value="">
                    </div>
                </form>
            </div>

            <div id="listArea">
                <table class="table table-hover">
                    <thead style="background-color: #C4F2EA;">
                        <tr>
                            <th width="10%">사원번호</th>
                            <th width="20%">이름</th>
                            <th width="15%">부서</th>
                            <th width="15%">직위</th>
                            <th width="10%">아이디</th>
                            <th width="20%">입사일자</th>
                            <th width="10%">상태</th>
                        </tr>
                    </thead>
                    <tbody style="border-top: none;">
                        <c:forEach items="${memberList}" var="m">
                            <tr onclick="location.href='${root}/admin/member/detail/${m.no}'">
                                <td>${m.no}</td>
                                <td>${m.name}</td>
                                <td>${m.deptNo}</td>
                                <td>${m.posNo}</td>
                                <td>${m.id}</td>
                                <td>${m.enrollDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${m.resignYn eq 'Y'}">퇴직</c:when>
                                        <c:when test="${m.resignYn eq 'N'}">재직</c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="pageArea">
                <c:if test="${pv.startPage ne 1}">
                    <a href="${root}/admin/member/list?sort=${sort}&p=${pv.startPage -1}">&lt;</a>            
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                    <c:choose>
                        <c:when test="${pv.currentPage eq i}">
                            <a style="font-weight:900;">${i}</a>  
                        </c:when>
                        <c:otherwise>
                            <a href="${root}/admin/member/list?sort=${sort}&p=${i}">${i}</a>            
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pv.endPage ne pv.maxPage}">
                    <a href="${root}/admin/member/list?sort=${sort}&p=${pv.endPage + 1}">&gt;</a>
                </c:if>
            </div>
        </main>
    </div>
</body>
</html>