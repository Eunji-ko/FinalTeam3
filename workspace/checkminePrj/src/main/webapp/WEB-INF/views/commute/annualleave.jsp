<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리</title>
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

    #leave{
        border: 1px solid black;
        width: 100%;
        height: 20%;
        margin-top: 5%;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        text-align: center;
    }

    #leave-list{
        width: 100%;
        height: 90%;
        margin-top: 5%;
    }

    #leave-list-top{
      width: 100%;
      height: 20%;
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      text-align: center;
    }

    #leave-list-bot{
      width: 100%;
      height: 80%;
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
                      <a class="nav-link" href="/checkmine/commute/mycommute/1">나의 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/checkmine/commute/commute/1">전체 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="/checkmine/commute/annualleave">연차내역</a>
                    </li>
                </ul>

                <div id="leave">

                    <div id="total-leave">총 연차</div>

                    <div id="use-leave">사용한 연차</div>

                    <div id="remain-leave">남은 연차</div>

                    <div>5</div>

                    <div>${x}</div>
                    
                    <div>5</div>

                </div>

                <div id="leave-list">
                    
                      <div id="name">${loginMember.name} 님</div>

                    <div id="leave-list-bot">

                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">연차시작일</th>
                                <th scope="col">연차종료일</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${voList}" var="vo">
                            	<tr>
                                <td>${vo.begin}</td>
                                <td>${vo.end}</td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>

                    </div>

                  </div>

                </div>

            </div>

        </main>
    </div>

</body>
</html>