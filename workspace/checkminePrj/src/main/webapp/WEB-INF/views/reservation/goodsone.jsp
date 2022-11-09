<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
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
        margin-top: 15px;
    }

    #side-myreservation{
        display: grid;
        grid-template-columns: repeat(1, 1fr);
    }

    #side-myreservation::after{
        content: "";
        width: 60%;
        border-bottom: 1px solid #5D736F;
        height: 0px;
        margin-left: 30px;
        margin-top: 30px;
    }

    #side-goods{
        display: grid;
        grid-template-columns: repeat(1, 1fr);
    }

    #side-goods::after{
        content: "";
        width: 60%;
        border-bottom: 1px solid #5D736F;
        height: 0px;
        margin-left: 30px;
        margin-top: 30px;
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
        padding: 10px;
    }

    .table{
        text-align: center;
    }

    #page-btn{
      text-align: center;
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

                    <div id="side-myreservation">
                        <h4>나의 예약</h4>

                        <a href="/checkmine/reservation/mygoodsreservation/1">공유물 예약</a>
                        <a href="/checkmine/reservation/myplacereservation/1">장소 예약</a>
                    </div>

                    <div id="side-goods">
                        <h4>공유물</h4>

                        <a href="/checkmine/reservation/goodsone/1">빔 프로젝트</a>
                        <a href="/checkmine/reservation/goodstwo/1">법인차</a>
                    </div>

                   <div id="side-place">
                        <h4>장소</h4>

                        <a href="/checkmine/reservation/placeone/1">회의실</a>
                        <a href="/checkmine/reservation/placetwo/1">응접실</a>
                   </div>
                    
                </div>
                
            </div>

            <div id="content">

                <div id="content-top">
                    <h1>빔 프로젝트</h1>
                    <div><button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button></div>
                </div>
    
                <div id="content-main">
                    
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">이름</th>
                            <th scope="col">부서</th>
                            <th scope="col">비품명</th>
                            <th scope="col">빌린시간</th>
                            <th scope="col">반납시간</th>
                            <th scope="col">예약한 일자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rsvList}" var="l">
                          <tr>
                            <td>${l.ENo}</td>
                            <td>${l.deptName}</td>
                            <td>${l.name}</td>
                            <td>${l.borrow}</td>
                            <td>${l.rsvEnd}</td>
                            <td>${l.rsvDate}</td>
                          </tr>
                         </c:forEach>
                        </tbody>
                      </table>

                      <div id="page-btn">

                        <c:if test="${pv.startPage ne 1}">
                            <button onclick="location.href='${rootPath}/reservation/goodsone/${pv.startPage - 1}'" type="button" class="btn btn-sm">&lt;</button>
                        </c:if>

                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                            <a class="btn btn-sm" href="${rootPath}/reservation/goodsone/${i}">${i}</a>
                        </c:forEach>
                        
                        <c:if test="${pv.endPage ne pv.maxPage}">
                            <button onclick="location.href='${rootPath}/reservation/goodsone/${pv.endPage + 1}'" type="button" class="btn btn-sm">&gt;</button>
                        </c:if>

                      </div>

                </div>

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
                            <div>${loginMember.name} 님</div>
                        </div>

                        <div id="type">
                            <div>종류</div>
                            <select id="name" name="name" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option>--선택--</option>
                                <c:forEach items="${voBimList}" var="vo">
                                <option value="${vo.no}">${vo.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div id="date">
                            <div>날짜</div>
                            <div><input  type="date" id="dateSelect"></div>
                        </div>

                        <div>예약시간</div>
                        <div id="time">
                            <select id="rsv-begin" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option>대여시간</option>
                                <option value="09:00">9시</option>
                                <option value="10:00">10시</option>
                                <option value="11:00">11시</option>
                                <option value="12:00">12시</option>
                                <option value="13:00">13시</option>
                                <option value="14:00">14시</option>
                                <option value="15:00">15시</option>
                                <option value="16:00">16시</option>
                            </select>
                            <div>~</div>
                            <select id="rsv-end" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option>반납시간</option>
                                <option value="10:00">10시</option>
                                <option value="11:00">11시</option>
                                <option value="12:00">12시</option>
                                <option value="13:00">13시</option>
                                <option value="14:00">14시</option>
                                <option value="15:00">15시</option>
                                <option value="16:00">16시</option>
                                <option value="17:00">17시</option>
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

    <script>
        //ajax
        let goodsNo;
        $('#name').on('change', function () {
            goodsNo = $('#name option:selected').val();
            console.log(goodsNo);
        })

        let borrow;
        $('#rsv-begin').on('change', function () {
            borrow = $('#rsv-begin option:selected').val();
            console.log(borrow);
        })

        let rsvEnd;
        $('#rsv-end').on('change', function () {
            rsvEnd = $('#rsv-end option:selected').val();
            console.log(rsvEnd);
        })   
        
        let rsvDate;
        $('#dateSelect').on('change', function () {
            rsvDate = $('#dateSelect').val();
            console.log(rsvDate)
        })

        $('#reservation').on('click', function (){
            $.ajax({
                url  :  '${rootPath}/reservation/rsvbtnb',
                method : 'post',
                data : JSON.stringify({goodsNo : goodsNo,
                                    borrow : borrow,
                                    rsvEnd : rsvEnd,
                                    rsvDate : rsvDate}),
                dataType : 'text',
                contentType : 'application/json',
                success : function(data){
                    console.log(data + '성공');
                    location.reload();
                }
            })
        })

    </script>


</body>
</html>