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
                    <h1>응접실</h1>
                    <div><button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button></div>
                </div>
    
                <div id="content-main">
                    
                    <div id="content-main-top">
                        2022-09-30 (금)
                    </div>

                    <div id="content-main-bot">
                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col">시간/응접실</th>
                                <th scope="col">응접실1</th>
                                <th scope="col">응접실2</th>
                                <th scope="col">응접실3</th>
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
                                <option value="응접실1">응접실1</option>
                                <option value="응접실2">응접실2</option>
                                <option value="응접실3">응접실3</option>
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
</body>
</html>