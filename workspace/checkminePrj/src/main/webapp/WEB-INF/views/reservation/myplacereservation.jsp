<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

    .content{
        width: 70%;
        height: 90;
        display: grid;
        grid-template-rows: 1fr 6fr 1fr;
    }

    #content-top{
        width: 100%;
        height: 20%;
        padding-left: 30px;
        margin-bottom: 0%;
    }

    #content-place{
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        text-align: center;
    }

    #content-place>h3{
        grid-column: 1/span 3;
    }

    #content-place button{
        background: #5D736F;
        border-radius: 10px;
        color: white;
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

            <div class="content">

                <div id="content-top">
                    <h1>장소 예약</h1>
                </div>
    
                <div id="content-place">
					<c:forEach items="${voListPlace}" var="vo">
                    <div id="date">${vo.rsvDate}</div>
                    
                    <div id="place-name" value="${vo.no}">${vo.name}</div>

                    <div id="time">${vo.rsvBegin} ~ ${vo.rsvEnd}</div>

                    <div id="rd-btn">
                        <button id="place-reservation" class="btn btn-light btn-sm">예약 취소</button>
                    </div>
					</c:forEach>                    
                </div>

                <div id="page-btn">

                    <c:if test="${pv.startPage ne 1}">
                        <button onclick="location.href='${rootPath}/reservation/myplacereservation/${pv.startPage - 1}'" type="button" class="btn btn-sm">&lt;</button>
                    </c:if>

                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                        <a class="btn btn-sm" href="${rootPath}/reservation/myplacereservation/${i}">${i}</a>
                    </c:forEach>
                    
                    <c:if test="${pv.endPage ne pv.maxPage}">
                        <button onclick="location.href='${rootPath}/reservation/myplacereservation/${pv.endPage + 1}'" type="button" class="btn btn-sm">&gt;</button>
                    </c:if>

                </div>

            </div>

        </main>
    </div>

    <script>

        $('#place-reservation').on('click', function(){
            $.ajax({
                url  :  '${rootPath}/reservation/placeDelbtn',
                method : 'post',
                data : JSON.stringify({no : $('#place-name').attr('value')}),
                dataType : 'text',
                contentType : 'application/json',
                success : function(){
                    console.log('성공');
                    location.reload();
                }
            })
        })

    </script>

</body>
</html>