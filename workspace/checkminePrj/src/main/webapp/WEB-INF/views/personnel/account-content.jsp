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
    .acc-btn {
        margin-left: 10px;
        padding: 7px;
        padding-left: 10px;
        padding-right: 10px;
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
    .acc-checkbox {
        accent-color: #5D736F;
    }
</style>
</head>
<body>
    <div id="acc-area">
        <br>
        <c:if test="${fn:contains(loginMember.permission, 'H')}">
            <button type="button" class="btn checkmine-btn acc-btn" data-bs-toggle="modal" data-bs-target="#insertAcc">추가하기</button>
            <button type="button" class="btn checkmine-btn acc-btn" id="acc-del-btn" disabled="disabled" onclick="delAcc();">삭제하기</button>
        </c:if>
        <form action="${rootPath}/personnel/main" method="get" class="align-right search-form" onsubmit="changeAccSearch()" id="accForm">
            <input type="hidden" name="ep" id="accSearchEp" value="">
            <input type="hidden" name="ap" value="1">
            <select name="accSearchType" class="search-type-select align-right">
                <option value="CORPORATE">거래처명</option>
                <option value="PNAME">담당자명</option>
            </select>
            <div class="emp-search">
                <input id="emp-search-text" name="accSearchText" type="text" placeholder="검색">
                <input id="emp-search-submit" type="submit" value=""></input>
            </div>
        </form>
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
                        <c:if test="${fn:contains(loginMember.permission, 'H')}">
                            <th></th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="acc" items="${accList}">
                        <tr class="accModal">
                            <th data-bs-toggle="modal" data-bs-target="#changeAcc" >${acc.no}</th>
                            <td data-bs-toggle="modal" data-bs-target="#changeAcc" >${acc.corporate}</td>
                            <td data-bs-toggle="modal" data-bs-target="#changeAcc" >${acc.pname}</td>
                            <td data-bs-toggle="modal" data-bs-target="#changeAcc" >${acc.tel}</td>
                            <td data-bs-toggle="modal" data-bs-target="#changeAcc" >
                                <c:if test="${empty acc.fax}">
                                    -
                                </c:if>
                                <c:if test="${not empty acc.fax}">
                                    ${acc.fax}
                                </c:if>
                            </td>
                            <td data-bs-toggle="modal" data-bs-target="#changeAcc" >
                                <c:if test="${empty acc.email}">
                                    -
                                </c:if>
                                <c:if test="${not empty acc.email}">
                                    ${acc.email}
                                </c:if>
                            </td>
                            <c:if test="${fn:contains(loginMember.permission, 'H')}">
                                <td>
                                    <input type="checkbox" class="acc-checkbox" name="no" value="${acc.no}">
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br>
        <div id="psn-page-zone">
            <c:if test="${apv.startPage ne 1}">
                <a href="javascript:void(0);" onclick="changeAPage(${apv.startPage -1})">&lt;</a>
            </c:if>
            <c:forEach begin="${apv.startPage}" end="${apv.endPage}" var="i">
                <c:if test="${i ne apv.currentPage}">
                    <a href="javascript:void(0);" onclick="changeAPage(${i})">${i}</a>           
                </c:if>
                <c:if test="${i eq apv.currentPage}">
                    <a class="page-selected">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${apv.endPage ne apv.maxPage}">
                <a href="javascript:void(0);" onclick="changeAPage(${apv.endPage + 1})">&gt;</a>
            </c:if>
        </div>
    </div>

    <script>
        $('.accModal input[type="checkbox"]').click(function(){
            let tmpp = $(this).prop('checked');

            if(tmpp){
                $("#acc-del-btn").prop("disabled", false);
            }else{
                if($(".accModal :checkbox:checked").length == 0){
                    $("#acc-del-btn").prop("disabled", true);
                }
            }
        });
    </script>

    <script>
        function delAcc() {
            if(confirm("체크하신 거래처(들)을 정말 삭제하시겠습니까?")) {
                let checkNo = "";
                $("input:checkbox[name=no]:checked").each(function(i, iVal) {
                    checkNo = checkNo + iVal.value + ",";
                });
                checkNo = checkNo.slice(0, -1);
                location.href="/checkmine/personnel/delAcc?no=" + checkNo;
            }
        }
    </script>

    <script>
        let sch2 = location.search;
        let params2 = new URLSearchParams(sch2);

        function changeAccSearch(){
            let ep2 = params2.get("ep");
            $('#accSearchEp').val(ep2);
            let accFormArea = document.getElementById('accForm');
            if(params2.has("empSearchText")){
                let empSearchType = params2.get("empSearchType");
                let empSearchText = params2.get("empSearchText");

                let newHd3 = document.createElement('input');
                newHd3.setAttribute("type", "hidden");
                newHd3.setAttribute("name", "empSearchType");
                newHd3.setAttribute("value", empSearchType);
                let newHd4 = document.createElement('input');
                newHd4.setAttribute("type", "hidden");
                newHd4.setAttribute("name", "empSearchText");
                newHd4.setAttribute("value", empSearchText);
                accFormArea.appendChild(newHd3);
                accFormArea.appendChild(newHd4);
            } else if(params2.has("rsn")){
                let rsn2 = params2.get("rsn");
                let newHd5 = document.createElement('input');
                newHd5.setAttribute("type", "hidden");
                newHd5.setAttribute("name", "rsn");
                newHd5.setAttribute("value", rsn);
                accFormArea.appendChild(newHd5);
            }
            let newHd6 = document.createElement('input');
            newHd6.setAttribute("type", "hidden");
            newHd6.setAttribute("name", "category");
            newHd6.setAttribute("value", "acc");
            accFormArea.appendChild(newHd6);
        }

        function checkPsn(){
            if(params2.has("category")){
                let category = params2.get("category");
                if(category == 'acc'){
                    $("#list-emp-list").removeClass("active");
                    $("#list-emp-list").attr("aria-selected", "false");
                    $("#list-emp").removeClass("active");
                    $("#list-emp").removeClass("show");
                    $("#list-account-list").addClass("active");
                    $("#list-account-list").attr("aria-selected", "true");
                    $("#list-account").addClass("active");
                    $("#list-account").addClass("show");
                }else if(category == 'emp'){
                    $("#list-account-list").removeClass("active");
                    $("#list-account-list").attr("aria-selected", "false");
                    $("#list-account").removeClass("active");
                    $("#list-account").removeClass("show");
                    $("#list-emp-list").addClass("active");
                    $("#list-emp-list").attr("aria-selected", "true");
                    $("#list-emp").addClass("active");
                    $("#list-emp").addClass("show");
                }
            }

            if(params2.has("rsn")){
                let rsnCheck = params2.get("rsn");

                if(rsnCheck == 'N') {
                    $("#selectResign").val("N").prop("selected", true);
                }else if(rsnCheck == 'Y'){
                    $("#selectResign").val("Y").prop("selected", true);
                }else{
                    $("#selectResign").val("").prop("selected", true);
                }
            }
        }
    </script>

    <%@ include file="/WEB-INF/views/personnel/acc-modal.jsp" %>
    <%@ include file="/WEB-INF/views/personnel/insert-acc-modal.jsp" %>
</body>
</html>