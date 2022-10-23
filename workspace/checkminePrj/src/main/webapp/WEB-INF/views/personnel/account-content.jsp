<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #acc-area {
        width: 1450px;
        margin: 0 auto;
    }
    .psn-acc-table {
        outline: 1px;
        margin-bottom: 0;
    }
    .psn-acc-table>thead>tr, .psn-acc-table>tbody>tr {
        text-align: center;
    }
    .psn-acc-table>tbody>tr :hover {
        cursor: pointer;
    }
</style>
</head>
<body>
    <div id="acc-area">
        <br>
        <form class="align-right emp-search" action="" method="post">
            <input id="emp-search-text" type="text" placeholder="검색">
            <input id="emp-search-submit" type="submit" value=""></input>
        </form>
        <select name="searchType" class="search-type-select align-right">
            <option value="name">거래처명</option>
            <option value="deptName">담당자명</option>
        </select>
        <br><br>
        <div class="out-line">
            <table class="table table-hover psn-acc-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>거래처명</th>
                        <th>담당자명</th>
                        <th>TEL</th>
                        <th>FAX</th>
                        <th>메일주소</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="acc" items="${accList}">
                        <tr data-bs-toggle="modal" data-bs-target="#changeAcc">
                            <th>${acc.no}</th>
                            <td>${acc.corporate}</td>
                            <td>${acc.pname}</td>
                            <td>${acc.tel}</td>
                            <td>
                                <c:if test="${empty acc.fax}">
                                    -
                                </c:if>
                                <c:if test="${not empty acc.fax}">
                                    ${acc.fax}
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${empty acc.email}">
                                    -
                                </c:if>
                                <c:if test="${not empty acc.email}">
                                    ${acc.email}
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br><br>
        <div id="psn-page-zone">
            <!-- <a href="">&lt;</a> -->
            <a href="" class="page-selected">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">&gt;</a>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/personnel/acc-modal.jsp" %>
</body>
</html>