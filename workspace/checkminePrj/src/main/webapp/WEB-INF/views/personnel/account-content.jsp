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
                    <tr data-bs-toggle="modal" data-bs-target="#changeAcc">
                        <th>1</th>
                        <td>(주)거래처1</td>
                        <td>일번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade1@naver.com</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>(주)거래처2</td>
                        <td>이번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade2@naver.com</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>(주)거래처3</td>
                        <td>삼번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade3@naver.com</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>(주)거래처4</td>
                        <td>사번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade4@naver.com</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>(주)거래처5</td>
                        <td>오번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade5@naver.com</td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>(주)거래처6</td>
                        <td>육번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade6@naver.com</td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>(주)거래처7</td>
                        <td>칠번거</td>
                        <td>031-123-1234</td>
                        <td>0505-1234-1234</td>
                        <td>trade7@naver.com</td>
                    </tr>
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