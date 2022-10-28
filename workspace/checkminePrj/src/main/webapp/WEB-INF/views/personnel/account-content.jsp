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
</style>
</head>
<body>
    <div id="acc-area">
        <br>
        <button type="button" class="btn checkmine-btn acc-btn" data-bs-toggle="modal" data-bs-target="#insertAcc">추가하기</button>
        <button type="button" class="btn checkmine-btn acc-btn" id="acc-del-btn" disabled="disabled" onclick="delAcc();">삭제하기</button>
        <form class="align-right search-form" action="${rootPath}/personnel/searchAcc" method="post">
            <select name="searchType" class="search-type-select align-right">
                <option value="CORPORATE">거래처명</option>
                <option value="PNAME">담당자명</option>
            </select>
            <div class="emp-search">
                <input id="emp-search-text" name="searchText" type="text" placeholder="검색">
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
                        <th></th>
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
                            <td>
                                <input type="checkbox" name="no" value="${acc.no}">
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

    <%@ include file="/WEB-INF/views/personnel/acc-modal.jsp" %>
    <%@ include file="/WEB-INF/views/personnel/insert-acc-modal.jsp" %>
</body>
</html>