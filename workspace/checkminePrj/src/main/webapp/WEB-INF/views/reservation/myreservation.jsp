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
        grid-template-rows: 1fr 4fr;
    }

    #content-top{
        width: 100%;
        height: 20%;
        padding-left: 30px;
        grid-column: 1/span 2;
        margin-bottom: 0%;
    }

    #content-goods{
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        text-align: center;
        border-right: 1px solid gray;
    }

    #content-goods>h3{
        grid-column: 1/span 3;
    }

    #content-goods button{
        background: #5D736F;
        border-radius: 10px;
        color: white;
    }

    #content-place{
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
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

    .modal a{
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

            <div class="content">

                <div id="content-top">
                    <br><br>
                    <h1>나의 예약</h1>
                </div>
    
                <div id="content-goods">
                    <h3>공유물</h3>
					<c:forEach items="${voListGoods}" var="vo">
                    <div id="goods-name" value="${vo.no}">${vo.name}</div>

                    <div id="time">${vo.borrow} ~ ${vo.rsvEnd}</div>

                    <div id="rd-btn">
                        <button id="goods-reservation" class="btn btn-light btn-sm">예약 취소</a>
                    </div>
                    </c:forEach>
                </div>

                <div id="content-place">
                    <h3>장소</h3>
					<c:forEach items="${voListPlace}" var="vo">
                    <div id="place-name" value="${vo.no}">${vo.name}</div>

                    <div id="time">${vo.rsvBegin} ~ ${vo.rsvEnd}</div>

                    <div id="rd-btn">
                        <button id="place-reservation" class="btn btn-light btn-sm">예약 취소</button>
                    </div>
					</c:forEach>                    
                </div>

            </div>

        </main>
    </div>

    <script>
       /* $('#goods-reservation').on('click', function deleteBoard(seq){
            
            swal({
                title : '취소',
                text : '예약을 취소하시겠습니까?',
                icon : 'info',
                closeOnClickOutside : false,
                button : {
                    cancle : {
                        text : '아니오',
                        value : false,
                    },
                    confirm : {
                        text : '예',
                        value : true
                    }
                }
            }).then((result) => {
                if(result){
                    swal('예약이 취소 되었습니다!', '', 'success', {
                    closeOnClickOutside : false,
                    closeOnEsc : false,
                    button : {
                        confirm : {
                            text : '확인',
                            value : true,
                        }
                    }
                }).then((result) => {
                    if(result){
                        $.ajax({
                            url  :  '${rootPath}/reservation/goodsDelbtn',
                            method : 'post',
                            data : JSON.stringify({no : $('#name').attr('value')}),
                            dataType : 'text',
                            contentType : 'application/json',
                            success : function(){
                                console.log('성공');
                                location.reload();
                            }
                        })
                    }
                })
                }else{
                    swal('다시 선택해 주세요!', '', 'warning', {
                        closeOnClickOutside : false,
                        closeOnEsc : false,
                        button : {
                            confirm : {
                                text : '확인',
                                value : true
                            }
                        }
                    })
                }
            })
            
            
        }) */

        $('#goods-reservation').on('click', function deleteBoard(seq){
            $.ajax({
                url  :  '${rootPath}/reservation/goodsDelbtn',
                method : 'post',
                data : JSON.stringify({no : $('#goods-name').attr('value')}),
                dataType : 'text',
                contentType : 'application/json',
                success : function(){
                    console.log('성공');
                    location.reload();
                }
            })
        })

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