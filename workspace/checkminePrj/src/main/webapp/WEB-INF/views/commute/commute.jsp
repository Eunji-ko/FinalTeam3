<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .shadow{
       padding: 20px;
       display: flex;
       flex-direction: row;
       flex-wrap: wrap;
       justify-content: flex-start;
    }

    .nav-link{
        color: black;
    }
    
    #main{
        width: 100%;
    }

    #commute{
        width: 100%;
        height: 80%;
        margin-top: 5%;
    }

    #commute-top{
      width: 100%;
      height: 20%;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      text-align: center;
    }

    .table{
        text-align: center;
    }

    #page-btn{
      text-align: center;
    }

    #btn1{
      margin-left: 90%;
    }

    #btn2{
      margin-right: 100%;
    }

    #search>button{
        background: #5D736F;
        border-radius: 10px;
        color: white;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="main">

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="/checkmine/commute/mycommute">나의 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="/checkmine/commute/commute">전체 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/checkmine/commute/leave">연차내역</a>
                    </li>
                </ul>

                <div id="commute">

                    <div id="commute-top">

                      <div id="btn1">
                        <button type="button" class="btn btn-sm">&lt;</button>
                      </div>

                      <div id="date">2020-10</div>

                      <div id="btn2">
                        <button type="button" class="btn btn-sm"> &gt;</button>
                      </div>

                      <div></div>

                      <div></div>

                      <div id="search">
                        <select>
                            <option value="">부서전체</option>
                            <option value="없음">없음</option>
                            <option value="인사부">인사부</option>
                            <option value="총무부">총무부</option>
                            <option value="회계부">회계부</option>
                            <option value="영업부">영업부</option>
                            <option value="마케팅부">마케팅부</option>
                        </select>

                        <select>
                            <option value="">직급전체</option>
                            <option value="없음">사원</option>
                            <option value="인사부">주임</option>
                            <option value="총무부">대리</option>
                            <option value="회계부">과장</option>
                            <option value="영업부">차장</option>
                            <option value="마케팅부">부장</option>
                            <option value="마케팅부">사장</option>
                        </select>

                        <button type="button" class="btn btn-sm">조회하기</button>
                      </div>

                    </div>

                    <div id="commute-bot">

                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">이름</th>
                                <th scope="col">부서</th>
                                <th scope="col">직급</th>
                                <th scope="col">일자</th>
                                <th scope="col">출근시각</th>
                                <th scope="col">퇴근시각</th>
                                <th scope="col">총 근무시간</th>
                                <th scope="col">상태</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>김과장</td>
                                <td>인사부</td>
                                <td>과장</td>
                                <td>2022.10.18</td>
                                <td>09:00</td>
                                <td>17:00</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                              <tr>
                                <td>박차장</td>
                                <td>인사부</td>
                                <td>차장</td>
                                <td>2022.10.18</td>
                                <td>09:00</td>
                                <td>17:00</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                              <tr>
                                <td>정대리</td>
                                <td>인사부</td>
                                <td>대리</td>
                                <td>2022.10.18</td>
                                <td>09:00</td>
                                <td>17:00</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                            </tbody>
                          </table>

                          <div id="page-btn">

                            <a class="btn btn-sm" href="">1</a>
                            <a class="btn btn-sm" href="">2</a>
                            <a class="btn btn-sm" href="">3</a>

                          </div>

                    </div>

                </div>

            </div>

        </main>
    </div>
</body>
</html>