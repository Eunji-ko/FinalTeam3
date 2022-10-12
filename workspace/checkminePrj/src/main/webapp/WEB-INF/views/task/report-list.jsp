<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무</title>
<style>

    #category-wrap{
        margin-top: 40px;
        border-bottom: 2px solid #B0D9D1;
        height: 40px;
        display: flex;
    }

    .category{
        text-decoration: none;
        
        text-align: center;
        font-size: large;
        color: black;

        width: 70px;
        border: 3px solid black;
        padding: 3px;
        border-radius: 8px 8px 0px 0px;
    }

    #report{
        border: 3px solid #B0D9D1;
        border-bottom: none;
        margin-left: 20px;

        color: #B0D9D1;
        font-weight: bold;
    }

    #search{
        text-align: right;
        margin: 20px;
    }

    input[type="text"] {
        border: 1px solid gray;
        border-radius: 50px;
        text-align: center;
        height: 35px;
    }

    #center{
        border: 1px dashed #B0D9D1;
        width: 95%;
        height: 90%;
        margin: auto;

        display: grid;
        grid-template-columns: 1fr 1fr 1fr 3fr 1fr 1fr;
        grid-template-rows: repeat(16, 40px);
    }
    
    #center > div{
        text-align: center;
    }

    .list-header{
        border-top: 3px solid #5D736F;
        border-bottom: 3px solid #5D736F;
        font-weight: bolder;
        font-size: large;
        line-height: 30px;
    }

    .list{
        border-bottom: 1px solid gray;
        line-height: 35px;
        font-size: large;
    }

    .list:hover{ /*한줄 통째로 처리되게...*/
        background-color: lightgray;
    }

    #page-area{
        margin-top: 20px;
        text-align: center;
    }

    #page-area > a {
        font-size: large;
        text-decoration: none;
        color: black;
        height: 10px;
        padding: 5px 10px 5px 10px;
        border-radius: 10px;
    }

    #page-area > a:hover {
        background-color: #B0D9D1;
        color: white;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">

            <div id="wrap">

                <!--카테고리-->
                <div id="category-wrap">
                    <a class="category" id="report">보고</a>
                    <a class="category">지시</a>
                </div>
                
                <!--검색 기능-->
                <div id="search">
                    <form action="">
                        <input type="text" placeholder="보고서 검색">
                    </form>
                </div>
                
                <!--보고서 목록-->
                <div id="center">
                    <div class="list-header">보고서 번호</div>
                    <div class="list-header">중요도</div>
                    <div class="list-header">받은이</div>
                    <div class="list-header">제목</div>
                    <div class="list-header">작성자</div>
                    <div class="list-header">날짜</div>
    
                    <div class="list">111</div>
                    <div class="list">긴급</div>
                    <div class="list">과장님</div>
                    <div class="list">테스트 진행 현황</div>
                    <div class="list">테스트 사원</div>
                    <div class="list">2022-10-12</div>

                </div>
                
                <!--페이징-->
                <div id="page-area">
                    <a href=""><<</a>
                    <a href=""><</a>
                    <a href="">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">></a>
                    <a href="">>></a>
                </div>
            </div>
        
        </main>
    </div>
</body>
</html>