<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${root}/resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
	<script src='${root}/resources/fullcalendar-5.11.3/lib/main.js'></script>
</head>
<style>

    a{
        text-decoration: none;
        color: black;
    }
    .shadow{
        display: grid;
        grid-template-rows: 1fr 4fr;
        grid-template-columns: repeat(3, 1fr);
    }

    #summary{
        width: 738px;
        height: 181px;
        background-color: #B0D9D1;
        border-radius: 30px;
        display: grid;
        grid-template-rows: 1fr 4fr;
        grid-template-columns: repeat(6, 1fr);
        margin: 60px auto;
        grid-column: span 3;
    }
    #summaryHeader{
        font-size: 20px;
        font-weight: bolder;
        grid-column: span 6;
        margin : 10px 60px;
    }
    .summaryItem{
        margin: auto;
        font-size: 15px;
        text-align: center;
        line-height: 30px;
        
        
    }
    .summaryItem > img{
        width: 40px;
        height: 40px;
    }

    .area{
        width: 490px;
        height: 490px;
        margin: 0 8px;
        display: flex;
        flex-direction: column;
    }

    .area > div{
        border: 1px solid lightgray;
        height: 100%;
        margin: 10px;
    }

    .header{
        font-size: 20px;
        font-weight: bolder;
        grid-column: span 6;
        margin : 15px 13px;
        margin-bottom: 30px;
        display: inline-block;
    }
    .list{
        font-size: 13px;
        margin: 18px 20px;
        width: 90%;
        border-bottom: 1px solid lightgray;
       
    }
    .list > span, .list a{
        display: inline-block;
        width: 250px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    #date{
        color: gray;
        width: 130px;
        text-align: end;
        float: right;
        font-size: smaller;
    }

    #more{
        float: right;
        margin: 16px 15px;
        color: gray;
        font-size: 13px;
    }

    #currentTime{
        text-align: center;
        line-height: 100px;
        height: 150px;
        border: none;
    }
    #calendar-area{
        border: none;
    }

    #calendar{
        width: 350px;
        height: 345px;
        margin: 0 auto;
    }
   
    .modal-content{
        width: 700px;
        height: 500px;
        padding: 20px;
    }
    .list-header{
        text-align: left;
    }

    .book-list {
        margin: 0 auto;
        width: 500px;
    }

    .book-list *{
        width: 250px;
        text-align: center;
    }

</style>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
			<div id="summary">
                <div id="summaryHeader">요약</div>
                <div class="summaryItem" style="grid-column: 2;">
                    <img src="${root}/resources/img/admin/user-icon.png">
                    <div>사원정보 변동</div>
                    <div id="memberChange">${summary.MEMBERCHANGE}건</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/user-icon-b.png">
                    <div>총 사원수</div>
                    <div id="memberTotal">${summary.MEMBERTOTAL}명</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/board-icon.png">
                    <div>등록된 게시물수</div>
                    <div id="boardTotal">${summary.BOARD}건</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/time-icon.png">
                    <div>오늘 예약건</div>
                    <div id="bookTotal">${summary.BOOK}건</div>
                </div>
            </div>
            <div class="area">
                <div id="memberChangeArea">
                    <div class="header">사원정보 변동</div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                </div>
    
                <div id="bookArea">
                    <div class="header">예약 현황</div><a href="" id="more" data-bs-toggle="modal" data-bs-target="#myModal">더보기</a>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>

                    
                </div>


            </div>
            <div class="area">
                <div id="boardArea">
                    <div class="header">게시판 현황</div><a href="" id="more">더보기</a>
                    <c:forEach items="${boardList}" var="b" end="8">
                    	<div class="list"><a href="">${b.title}</a><span id="date">${b.enrollDate}</span></div>
                    
                    </c:forEach>
                  

                </div>


            </div>
            
            <div class="area">
                <div id="currentTime" style="font-size: 20px;">
                    현재 시간 <b style="font-size: 30px;" id="clock"></b>
                </div>
                <div id="calendar-area">
                    <div id="calendar"></div>
                    
                </div>
            </div>

            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">예약 현황</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                    <div class="list-header">[회의실A]000님의 예약 내역입니다.</div><hr>
                    <table class="book-list">
                        <tr>
                            <th>예약자</th>
                            <td>000 사원</td>
                        </tr>
                        <tr>
                            <th>예약일자</th>
                            <td>2022.10.12 21:42</td>
                        </tr>
                        <tr>
                            <th>종료일자</th>
                            <td>2022.10.12 21:42</td>
                        </tr>

                    </table>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn" style="background-color: #5D736F; color: white;" data-bs-dismiss="modal">닫기</button>
            </div>
            
      </div>
    </div>
  </div>
                
            
            
            
        </main>
    </div>

    <script>
        // 현재 시간 표시
        var Target = document.getElementById("clock");
        function clock() {
            var time = new Date().toTimeString().split(" ")[0];
            Target.innerHTML = time;
        }

        clock();
        setInterval(clock, 1000); // 1초마다 실행하여 실시간으로 보여주기

       
        //풀캘린더 라이브러리 적용
        document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
        });
        calendar.render();
        });


    </script>
</body>
</html>