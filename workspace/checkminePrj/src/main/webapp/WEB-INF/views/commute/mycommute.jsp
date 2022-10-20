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
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="main">

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="/checkmine/commute/mycommute">나의 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/checkmine/commute/commute">전체 근태기록</a>
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

                      <div id="name">테스트 사원</div>

                    </div>

                    <div id="commute-bot">

                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">일자</th>
                                <th scope="col">출근시각</th>
                                <th scope="col">퇴근시각</th>
                                <th scope="col">총 근무시간</th>
                                <th scope="col">상태</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>2022.10.18</td>
                                <td>09:00</td>
                                <td>17:00</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                              <tr>
                                <td>2022.10.19</td>
                                <td>09:00</td>
                                <td>17:00</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                              <tr>
                                <td>2022.10.20</td>
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