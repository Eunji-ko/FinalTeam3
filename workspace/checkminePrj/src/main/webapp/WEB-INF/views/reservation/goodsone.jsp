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
        width: 20%;
        height: 90%;
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
        width: 80%;
        height: 90;
        padding-left: 2%;
    }

    #content-top{
        width: 100%;
        height: 10%;
    }

    #content-main{
        width: 100%;
        height: 90%;
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
                </div>
    
                <div id="content-main">
                    
                </div>

            </div>
			
        </main>
    </div>
</body>
</html>