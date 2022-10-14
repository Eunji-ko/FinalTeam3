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
    }

    #side-content a{
        color: black;
        text-decoration: none;
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
        border: none;
        border-collapse: collapse;
        text-align: center;
    }

    #content-main-bot td{
        border: 1px solid black;
        width: 80px;
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

                    <a href="/checkmine/reservation/myreservation">나의 예약</a>

                    <br><br>

                    <h4>공유물</h4>

                    <br>

                    <a href="/checkmine/reservation/goodsone">빔 프로젝터</a>
                    <br>
                    <a href="">법인차</a>

                    <br><br>

                    <h4>장소</h4>

                    <br>

                    <a href="">회의실</a>
                    <br>
                    <a href="">응접실</a>

                </div>
                
            </div>

            <div id="content">

                <div id="content-top">
                    <h1>빔 프로젝트</h1>
                    <div><button data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button></div>
                </div>
    
                <div id="content-main">
                    
                    <div id="content-main-top">
                        2022-09-30 (금)
                    </div>

                    <div id="content-main-bot">
                        <table>
                            <tr>
                                <td class="time">시간 \ 빔프로젝트번호</td>
                                <td>빔1</td>
                                <td>빔2</td>
                                <td>빔3</td>
                            </tr>
                            <tr>
                                <td class="time">9시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">10시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">11시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">12시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">13시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">14시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">15시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">16시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">17시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="time">18시</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>

                </div>

            </div>

            <!-- Modal -->
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
            </style>

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
                    <div id="goods-name">
                        <div>공유물 이름</div>
                        <div>빔1</div>
                    </div>
                    <div id="date">
                        날짜
                    </div>
                    <div id="time">
                        예약 시간
                    </div>
                    </div>
                    <div class="modal-footer">
                    <button id="reservation">예약</button>
                    <button id="close" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
                </div>
            </div>
			
        </main>
    </div>
</body>
</html>