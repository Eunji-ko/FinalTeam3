<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #emp-area {
        width: 1400px;
        height: 800px;
        margin: 0 auto;
    }
    .resign-select {
        width: 90px;
        height: 35px;
        padding-left: 8px;
        font-weight: bold;
        color: #767676;
        outline: none;
    }
    .align-right {
        float: right;
    }
    .search-type-select {
        width: 140px;
        height: 35px;
        padding-left: 10px;
        font-weight: bold;
        color: #767676;
        margin-right: 20px;
        outline: none;
        float: left;
    }
    .emp-search {
        width: 200px;
        height: 35px;
        border: 1px black solid;
        float: left;
    }
    .emp-search input{
        vertical-align: top;
        margin: 0px;
        height: 100%;
        box-sizing: border-box;
        background-color: transparent;
        outline: none;
    }
    #emp-search-text {
        border: none;
        width: 165px;
        padding-left: 10px;
    }
    #emp-search-submit {
        width: 20px;
        height: 20px;
        background-color: rgba(255, 255, 255, 0);
        background-image: url("${imgPath}/search_icon.png");
        margin-top: 5px;
        border: none;
    }
    .psn-emp-table {
        outline: 1px;
        margin-bottom: 0;
    }
    .psn-emp-table>thead>tr, .psn-emp-table>tbody>tr {
        text-align: center;
    }
    .psn-emp-table>tbody>tr :hover {
        cursor: pointer;
    }
    .out-line {
        border: 1px solid #C2C2C2;
    }
    #psn-page-zone {
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-evenly;
    }
    #psn-page-zone > a {
        text-decoration: none;
        color: black;
        font-size: 18px;
    }
    .page-selected {
        font-weight: bold;
    }
    .search-img {
        display: block;
        margin: 0;
    }
</style>
</head>
<body onload="checkRsn()">
    <br>
    <div id="emp-area">
        <select name="resignYn" class="resign-select" onchange="changeRsn(this.value)" id="selectResign">
            <option value="">모두</option>
            <option value="N">재직</option>
            <option value="Y">퇴직</option>
        </select>
        <form class="align-right search-form" onsubmit="changeEmpSearch()" id="empForm">
            <input type="hidden" name="ep" value="1">
            <input type="hidden" name="ap" id="empSearchAp" value="">
            <select name="empSearchType" class="search-type-select align-right">
                <option value="E.NAME">이름</option>
                <option value="D.NAME">부서</option>
                <option value="E.ID">아이디</option>
            </select>
            <div class="emp-search">
                <input id="emp-search-text" type="text" name="empSearchText" placeholder="검색">
                <input id="emp-search-submit" type="submit" value="">
            </div>
        </form>
        <br><br>
        <div class="out-line">
            <table class="table table-hover psn-emp-table" id="createTable">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>부서</th>
                        <th>직위</th>
                        <th>아이디</th>
                        <th>입사일자</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody id="empList">
                    <c:forEach var="emp" items="${memList}">
                        <tr data-bs-toggle="modal" data-bs-target="#changeEmp" class="empModal">
                            <th class="empNo">${emp.no}</th>
                            <td>${emp.name}</td>
                            <td>${emp.deptNo}</td>
                            <td>${emp.posNo}</td>
                            <td>${emp.id}</td>
                            <td>${fn:substring(emp.enrollDate,0,10)}</td>
                            <td>
                                <c:if test="${emp.resignYn eq 'N'}">
                                    재직
                                </c:if>
                                <c:if test="${emp.resignYn eq 'Y'}">
                                    퇴직
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </div>
        <br><br>
        <div id="psn-page-zone">
            <c:if test="${epv.startPage ne 1}">
                <a href="javascript:void(0);" onclick="changeEPage(${epv.startPage -1})">&lt;</a>
            </c:if>
            <c:forEach begin="${epv.startPage}" end="${epv.endPage}" var="i">
                <c:if test="${i ne epv.currentPage}">
                    <a href="javascript:void(0);" onclick="changeEPage(${i})">${i}</a>           
                </c:if>
                <c:if test="${i eq epv.currentPage}">
                    <a class="page-selected">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${epv.endPage ne epv.maxPage}">
                <a href="javascript:void(0);" onclick="changeEPage(${epv.endPage + 1})">&gt;</a>
            </c:if>
        </div>
    </div>

    <script>
        let sch = location.search;
        let params = new URLSearchParams(sch);

        function changeEPage(ePage){
            params.set('ep', ePage);
            url = params.toString();
            params.set("category", "emp");
            location.href="${rootPath}/personnel/main?"+ url;
        }

        function changeAPage(aPage){
            params.set('ap', aPage);
            url = params.toString();
            params.set("category", "acc");
            location.href="${rootPath}/personnel/main?"+ url;
        }

        function changeRsn(resign){
            let ap = params.get("ap");
            params.set('ep', 1);
            params.set('ap', ap);
            params.set("category", "emp");
            if(params.has("empSearchType")){
                params.delete("empSearchType");
                params.delete("empSearchText");
            }
            if(resign == ""){
                if(params.has("rsn")){
                    params.delete("rsn");
                    url = params.toString();
                    location.href="${rootPath}/personnel/main?"+ url;
                }
            } else if(!params.has("rsn")){
                url = params.toString();
                location.href="${rootPath}/personnel/main?"+ url +"&rsn=" + resign;
            } else{
                params.set('rsn', resign);
                url = params.toString();
                location.href="${rootPath}/personnel/main?"+ url;
            }
        }

        function changeEmpSearch(){
            let ap = params.get("ap");
            params.set("category", "emp");
            $('#empSearchAp').val(ap);
            if(params.has("accSearchText")){
                let accSearchType = params.get("accSearchType");
                let accSearchText = params.get("accSearchText");
                let empFormArea = document.getElementById('empForm');

                let newHd = document.createElement('input');
                newHd.setAttribute("type", "hidden");
                newHd.setAttribute("name", "accSearchType");
                newHd.setAttribute("value", accSearchType);
                let newHd2 = document.createElement('input');
                newHd2.setAttribute("type", "hidden");
                newHd2.setAttribute("name", "accSearchText");
                newHd2.setAttribute("value", accSearchText);
                empFormArea.appendChild(newHd);
                empFormArea.appendChild(newHd2);
            }
        }
    </script>

    <%@ include file="/WEB-INF/views/personnel/emp-modal.jsp" %>
</body>
</html>