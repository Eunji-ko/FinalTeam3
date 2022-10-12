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
    }
    .emp-search {
        width: 200px;
        height: 35px;
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
        <input type="text" class="align-right emp-search">
        <select name="searchType" class="search-type-select align-right">
            <option value="name">이름</option>
            <option value="deptName">부서</option>
            <option value="id">아이디</option>
        </select>
        <br><br>
        <table class="table table-hover">
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
                <tr>
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
            </tbody>
        </table>
    </div>
</body>
</html>