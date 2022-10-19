<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #emp-area {
        width: 1400px;
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
    }
    .emp-search {
        width: 200px;
        height: 35px;
        border: 1px black solid;
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
<body>
    <br>
    <div id="emp-area">
        <select name="resignYn" class="resign-select">
            <option value="">모두</option>
            <option value="N">재직</option>
            <option value="Y">퇴직</option>
        </select>
        <form class="align-right emp-search" action="" method="post">
            <input id="emp-search-text" type="text" placeholder="검색">
            <input id="emp-search-submit" type="submit" value=""></input>
        </form>
        <select name="searchType" class="search-type-select align-right">
            <option value="name">이름</option>
            <option value="deptName">부서</option>
            <option value="id">아이디</option>
        </select>
        <br><br>
        <div class="out-line">
            <table class="table table-hover psn-emp-table">
                <thead>
                    <tr>
                        <th>사원번호</th>
                        <th>이름</th>
                        <th>부서</th>
                        <th>직위</th>
                        <th>아이디</th>
                        <th>입사일자</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr data-bs-toggle="modal" data-bs-target="#changeEmp">
                        <th>1</th>
                        <td>테스트</td>
                        <td>-</td>
                        <td>사장</td>
                        <td>checkmine01</td>
                        <td>2005.01.01</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>김부장</td>
                        <td>영업부</td>
                        <td>부장</td>
                        <td>checkmine02</td>
                        <td>2022.01.01</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>이차장</td>
                        <td>마케팅부</td>
                        <td>차장</td>
                        <td>checkmine03</td>
                        <td>2022.01.02</td>
                        <td>퇴직</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>강주임</td>
                        <td>회계부</td>
                        <td>주임</td>
                        <td>checkmine04</td>
                        <td>2022.01.03</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>서사원</td>
                        <td>영업부</td>
                        <td>사원</td>
                        <td>checkmine05</td>
                        <td>2022.01.03</td>
                        <td>퇴직</td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>홍길동</td>
                        <td>총무부</td>
                        <td>주임</td>
                        <td>honggildong</td>
                        <td>2022.01.03</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>심원용</td>
                        <td>인사부</td>
                        <td>부장</td>
                        <td>1dragon1234</td>
                        <td>2022.01.04</td>
                        <td>재직</td>
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

    <%@ include file="/WEB-INF/views/personnel/emp-modal.jsp" %>
</body>
</html>