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

    #top{
        width: 100%;
        height: 10%;
    }

    #side{
        width: 170px;
        height: 740px;
        background-color: #C4F2EA;
        border-radius: 10px;
    }

    #side-content{
        text-align : center;
        padding : 100px 0;
        display: flex;
        flex-direction: column;
    }

    #side-content a{
        color: black;
        text-decoration: none;
    }

    #side-content *{
        margin-top: 30px;
    }

    #side-goods{
        display: grid;
        grid-template-columns: repeat(1, 1fr);
    }

    #side-place{
        display: grid;
        grid-template-columns: repeat(1, 1fr);
    }

    #content{
        display: flex;
        flex-wrap: wrap;
        width: 85%;
        height: 88%;
        padding-left: 2%;
    }

    #content-top{
        width: 100%;
        height: 10%;
        display: flex;
        justify-content: space-between;
    }

    #content-top button{
        background: #5D736F;
        border-radius: 10px;
        color: white;
    }

    #content-main{
        width: 100%;
        height: 90%;
        border: 1px solid black;
        border-radius: 10px;
        display: block;
        padding: 10px;
    }

    #content-main-top{
        width: 100%;
        height: 5%;
        text-align: center;
    }

    #content-main-bot{
        width: 100%;
        height: 95%;
    }

    #content-main-bot>table{
        width: 100%;
        height: 100%;
    }

    #time-bar{
        width: 80px;
        height: 190px;
        background-color: #5D736F;
        border-radius: 10px;
        position: absolute;
        margin-top: 160px;
        margin-left: 390px;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
			<div id="top">

                <h1>예약</h1>
			    <hr>

            </div>

            <div id="side">
                
                <div id="side-content">

                    <h4><a href="/checkmine/reservation/myreservation">나의 예약</a></h4>

                    <div id="side-goods">
                        <h4>공유물</h4>

                        <a href="/checkmine/reservation/goodsone">빔 프로젝트</a>
                        <a href="/checkmine/reservation/goodstwo">법인차</a>
                    </div>

                   <div id="side-place">
                        <h4>장소</h4>

                        <a href="/checkmine/reservation/placeone">회의실</a>
                        <a href="/checkmine/reservation/placetwo">응접실</a>
                   </div>
                    
                </div>
                
            </div>

            <div id="content">

                <div id="content-top">
                    <h1>회의실</h1>
                    <div><button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button></div>
                </div>
    
                <div id="content-main">
                    
                    <div id="content-main-top">
                        
                        <div>
                            <button type="button" class="btn btn-sm" onClick="prevCalendar();">&lt;</button>
                        </div>

                        <div id="calYear">YYYY</div>

                        <div>-</div>
                        
                        <div id="calMonth">MM</div>

                        <div>
                            <button type="button" class="btn btn-sm" onClick="nextCalendar();">&gt;</button>
                        </div>

                    </div>

                    <div id="content-main-bot">
                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">시간/회의실</th>
                                <th scope="col">회의실1</th>
                                <th scope="col">회의실2</th>
                                <th scope="col">회의실3</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">9시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">10시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">11시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">12시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">13시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">14시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">15시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">16시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                              <tr>
                                <th scope="row">17시</th>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                            </tbody>
                          </table>
                    </div>

                </div>

                <div id="time-bar">뿡빵사원</div>

            </div>

<!-- Modal 스타일 -->
<style>
    #exampleModal #reservation{
        background: #5D736F;
        border-radius: 10px;
        color: white;
    }

    #exampleModal #close{
        background: white;
        border-radius: 10px;
        color: #5D736F;
    }

    #rsv-name{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
    
    #type{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }

    #date{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }

    #time{
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        text-align : center;
    }
</style>

            <!-- 모달 -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">예약하기</h1>
                    </div>

                    <div class="modal-body">
                        <div id="rsv-name">
                            <div>예약자</div>
                            <div>뿡빵 사원</div>
                        </div>

                        <div id="type">
                            <div>종류</div>
                            <select name="name" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option value="회의실1">회의실1</option>
                                <option value="회의실2">회의실2</option>
                                <option value="회의실3">회의실3</option>
                            </select>
                        </div>

                        <div id="date">
                            <div>날짜</div>
                            <div>22-10-13</div>
                        </div>

                        <div>예약시간</div>
                        <div id="time">
                            <select name="rsv-begin" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option>대여시간</option>
                                <option value="9시">9시</option>
                                <option value="10시">10시</option>
                                <option value="11시">11시</option>
                                <option value="12시">12시</option>
                                <option value="13시">13시</option>
                                <option value="14시">14시</option>
                                <option value="15시">15시</option>
                                <option value="16시">16시</option>
                            </select>
                            <div>~</div>
                            <select name="rsv-end" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option>반납시간</option>
                                <option value="10시">10시</option>
                                <option value="11시">11시</option>
                                <option value="12시">12시</option>
                                <option value="13시">13시</option>
                                <option value="14시">14시</option>
                                <option value="15시">15시</option>
                                <option value="16시">16시</option>
                                <option value="17시">17시</option>
                            </select>
                        </div>
                        
                    </div>

                    <div class="modal-footer">
                        <button id="reservation" class="btn btn-light btn-sm">예약</button>
                        <button id="close" class="btn btn-light btn-sm" data-bs-dismiss="modal">취소</button>
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
         * @brief   날짜 선택
         * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
         */
        function calendarChoiceDay(column) {
  
            // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
            if(document.getElementsByClassName("choiceDay")[0]) {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
            }
  
            // @param 선택일 체크 표시
            column.style.backgroundColor = "#FF9999";
  
  
            // @param 선택일 클래스명 변경
            column.classList.add("choiceDay");
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