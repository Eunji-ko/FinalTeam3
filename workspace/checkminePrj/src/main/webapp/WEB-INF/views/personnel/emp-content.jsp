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
        <select name="resignYn" class="resign-select" onchange="selectResign()" id="selectResign">
            <option value="">모두</option>
            <option value="N">재직</option>
            <option value="Y">퇴직</option>
        </select>
        <form class="align-right search-form" action="${rootPath}/personnel/searchEmp" method="post">
            <select name="searchType" class="search-type-select align-right">
                <option value="E.NAME">이름</option>
                <option value="D.NAME">부서</option>
                <option value="E.ID">아이디</option>
            </select>
            <div class="emp-search">
                <input id="emp-search-text" type="text" name="searchText" placeholder="검색">
                <input id="emp-search-submit" type="submit" value=""></input>
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
            <!-- <a href="">&lt;</a> -->
            <a href="" class="page-selected">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">&gt;</a>
        </div>
        <div id="createZone">
            <div class="page-area" id="pageArea">

            </div>
        </div>
    </div>

    <script>
        function selectResign(){
            let selectRsn = document.getElementById("selectResign");
            let rsn = selectRsn.options[selectRsn.selectedIndex].value;
            if(rsn == ""){
                location.href="${rootPath}/personnel/main";
            }else{
                location.href="${rootPath}/personnel/selectRsn/"+rsn;
            }
        }
    </script>

    <script>
        function checkRsn(){
            let psnLink = location.href;
            let rsnCheck = psnLink.slice(-1);
            console.log(rsnCheck);

            if(rsnCheck == 'N') {
                $("#selectResign").val("N").prop("selected", true);
            }else if(rsnCheck == 'Y'){
                $("#selectResign").val("Y").prop("selected", true);
            }else{
                $("#selectResign").val("").prop("selected", true);
            }
        }
    </script>

<script>
	
    $(document).on("click", ".click-event", function(){
            
        $('#pageArea').remove();
        let createArea = document.getElementById('createZone');
        let newPage = document.createElement('div');
        newPage.setAttribute("class", "page-area");
        newPage.setAttribute("id", "pageArea");
        createArea.appendChild(newPage);
        
        $('#empList').remove();
        let createArea2 = document.getElementById('createTable');
        let newTBody = document.createElement('tbody');
        newTBody.setAttribute("id", "empList");
        createArea2.appendChild(newTBody);
                
                
        let numPage = $(this).val();
        $.ajax({
            url : "/checkmine/personnel/empList/" + numPage,
            method : "GET",
            success : function(x){
                console.log("페이지 "+ numPage +"의 이벤트 출력 성공 !");
                
                let map = JSON.parse(x);
                let pv = JSON.parse(map.pv);
                let list = JSON.parse(map.list);
                
                let listArea = document.getElementById('empList');
                
                for(let i in list){
                           let newTr = document.createElement('tr');
                           newTr.setAttribute("data-bs-toggle", "modal");
                           newTr.setAttribute("data-bs-target", "#changeEmp");
                           newTr.setAttribute("class", "empModal");
                           listArea.appendChild(newTr);
                           
                           let newNo = document.createElement('th');
                           newNo.setAttribute("class", "empNo");
                           let newName = document.createElement('td');
                           let newDept = document.createElement('td');
                           let newPos = document.createElement('td');
                           let newId = document.createElement('td');
                           let newEnroll = document.createElement('td');
                           let newResign = document.createElement('td');
                           newNo.innerHTML = list[i].no;
                           newName.innerHTML = list[i].name;
                           newDept.innerHTML = list[i].deptNo;
                           newPos.innerHTML = list[i].posNo;
                           newId.innerHTML = list[i].id;
                           newEnroll = list[i].enrollDate.substring(0, 10);
                           if(list[i].resignYn = 'N'){
                            newResign = '재직';
                           }else if(list[i].resignYn = 'Y'){
                            newResign = '퇴직';
                           }else{
                            newResign = '?';
                           }
                           
                        newTr.appendChild(newNo);
                        newTr.appendChild(newName); 
                        newTr.appendChild(newDept);
                        newTr.appendChild(newPos);
                        newTr.appendChild(newId);
                        newTr.appendChild(newEnroll);
                        newTr.appendChild(newResign);
                     }

                       let pageArea = document.getElementById('pageArea');
                       
                       console.log(epv.currentPage);
                       
                       if(epv.currentPage != 1) {
                        let newA = document.createElement('a');
                        newA.setAttribute("class", "click-event");
                        newA.setAttribute("href", "javascript:;");
                        newA.value = epv.startPage-1;
                        newA.innerHTML = "&lt;";
                        pageArea.appendChild(newA);
                       }
                       
                       for(let i = epv.startPage; i <= epv.endPage; ++i){
                           if(i == epv.currentPage){
                                    let newA2 = document.createElement('a');
                                    newA2.setAttribute("class", "page-selected");
                                    newA2.setAttribute("href", "javascript:;");
                                    newA2.value = i;
                                    newA2.innerHTML = i;
                                    pageArea.appendChild(newA2);
                           }else{
                                    let newA3 = document.createElement('a');
                                    newA3.setAttribute("class", "click-event");
                                    newA3.setAttribute("href", "javascript:;");
                                    newA3.value = i;
                                    newA3.innerHTML = i;
                                    pageArea.appendChild(newA3);
                           }
                       }
                       
                       if(epv.currentPage != epv.maxPage) {
                           let currentPlus = epv.endPage + 1;
                                let newA4 = document.createElement('a');
                                newA4.setAttribute("class", "click-event");
                                newA4.value = currentPlus;
                                newA4.innerHTML = "&gt;";
                                pageArea.appendChild(newA4);
                       }
                
            },
            error : function(request, status, error){
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    });
    
</script>

    <%@ include file="/WEB-INF/views/personnel/emp-modal.jsp" %>
</body>
</html>