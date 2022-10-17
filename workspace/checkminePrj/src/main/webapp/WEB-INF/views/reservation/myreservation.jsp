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

    .content{
        width: 70%;
        height: 90;
    }

    #content-top{
        width: 100%;
        height: 10%;
        padding-left: 2%;
    }

    #content-main{
        width: 100%;
        height: 10%;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        text-align: center;
    }

    #content-main button{
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

			<div id="top">

                <h1>예약</h1>
			    <hr>

            </div>

            <div id="side">
                
                <div id="side-content">

                    <a href="/checkmine/reservation/myreservation">나의 예약</a>

                    <h4>공유물</h4>

                    <a href="/checkmine/reservation/goodsone">빔 프로젝트</a>
                    <a href="">법인차</a>

                    <h4>장소</h4>

                    <a href="">회의실</a>
                    <a href="">응접실</a>

                </div>
                
            </div>

            <div class="content">

                <div id="content-top">
                    <h1>나의 예약</h1>
                </div>
    
                <div id="content-main">

                    <div id="name">124호 0407</div>

                    <div id="time">오전 09:00 ~ 오전 10:00</div>

                    <div id="rd-btn">
                        <button id="reservation" data-bs-toggle="modal" data-bs-target="#exampleModal">예약 취소</button>
                    </div>
                
                    <div id="name">빔1</div>

                    <div id="time">오전 09:00 ~ 오전 10:00</div>

                    <div id="rd-btn">
                        <button id="reservation" data-bs-toggle="modal" data-bs-target="#exampleModal">예약 취소</button>
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
            </style>

             <!-- 모달 -->
             <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">예약취소</h1>
                        </div>

                        <div class="modal-body">
                            예약을 정말 취소하시겠습니까?
                        </div>

                        <div class="modal-footer">
                            <button id="reservation">예</button>
                            <button id="close" data-bs-dismiss="modal">아니오</button>
                        </div>
                    </div>
                </div>
             </div>

        </main>
    </div>
</body>
</html>