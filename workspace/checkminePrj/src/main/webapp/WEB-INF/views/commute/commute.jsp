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
      grid-template-columns: repeat(5, 1fr);
      text-align: center;
    }

    .table{
        text-align: center;
    }

    #page-btn{
      text-align: center;
    }

    #search-btn>button{
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
                      <a class="nav-link" href="/checkmine/commute/mycommute/1">나의 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="/checkmine/commute/commute/1">전체 근태기록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/checkmine/commute/leave">연차내역</a>
                    </li>
                </ul>

                <div id="commute">

                    <div id="commute-top">

                      <div>
                        <button type="button" class="btn btn-sm" onClick="prevCalendar();">&lt;</button>
                      </div>

                      <div id="calYear">YYYY</div>

                      <div>-</div>
                      
                      <div id="calMonth">MM</div>

                      <div>
                        <button type="button" class="btn btn-sm" onClick="nextCalendar();">&gt;</button>
                      </div>

                      <div></div>

                      <div></div>

                      <div></div>

                      <div id="search">
                        <select>
                            <option value="">부서전체</option>
                            <option value="-">없음</option>
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

                      </div>

                      <div id="search-btn">
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
                            <c:forEach items="${voList}" var="vo">
                              <tr>
                                <td>${vo.empNo}</td>
                                <td>${vo.deptName}</td>
                                <td>${vo.posName}</td>
                                <td>${vo.workDate}</td>
                                <td>${vo.arrived}</td>
                                <td>${vo.leave}</td>
                                <td>08:00</td>
                                <td>정상출근</td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>

                          <div id="page-btn">

							<c:if test="${pv.startPage ne 1}">
                            	<button onclick="location.href='${rootPath}/commute/commute/${pv.startPage - 1}'" type="button" class="btn btn-sm">&lt;</button>
							</c:if>

							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                            	<a class="btn btn-sm" href="${rootPath}/commute/commute/${i}">${i}</a>
							</c:forEach>
                            
							<c:if test="${pv.endPage ne pv.maxPage}">
                            	<button onclick="location.href='${rootPath}/commute/commute/${pv.endPage + 1}'" type="button" class="btn btn-sm">&gt;</button>
							</c:if>                            

                          </div>

                    </div>

                </div>

            </div>

        </main>
    </div>

    <!-- 날짜 스크립트 -->
    <script>

      document.addEventListener("DOMContentLoaded", function() {
              buildCalendar();
      });

      var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
      var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

      /**
       * @brief   이전달 버튼 클릭
       */
      function prevCalendar() {
          this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
          buildCalendar();    // @param 전월 캘린더 출력 요청
      }

      /**
       * @brief   다음달 버튼 클릭
       */
      function nextCalendar() {
          this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
          buildCalendar();    // @param 명월 캘린더 출력 요청
      }

      /**
       * @brief   캘린더 오픈
       * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
       */
      function buildCalendar() {

          let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
          let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

          let tbCalendar = document.querySelector(".scriptCalendar > tbody");

          document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
          document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월
            
      }

      /**
       * @brief   숫자 두자릿수( 00 ) 변경
       * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
       * @param   num     앞에 0을 붙일 숫자 값
       * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
       */
      function autoLeftPad(num, digit) {
          if(String(num).length < digit) {
              num = new Array(digit - String(num).length + 1).join("0") + num;
          }
          return num;
      }

    </script>

</body>
</html>