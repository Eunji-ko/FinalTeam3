<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 관리자 홈</title>
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
        margin: 0 auto;
        font-size: 15px;
        text-align: center;
        line-height: 30px;
        
    }
    .summaryItem > img{
        width: 40px;
        height: 40px;
    }

    .area{
        width: 450px;
        height: 490px;
        margin: 0 auto;
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
        margin : 15px 20px;
        margin-bottom: 30px;
        display: inline-block;
    }
    .list{
        font-size: 13px;
        margin: 15px 20px;
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
    }

    #currentTime{
        text-align: center;
        line-height: 100px;
        height: 150px;
        border: none;
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
                    <div id="memberChange">0건</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/user-icon-b.png">
                    <div>총 사원수</div>
                    <div id="memberTotal">0명</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/board-icon.png">
                    <div>등록된 게시물수</div>
                    <div id="boardTotal">0건</div>
                </div>
                <div class="summaryItem">
                    <img src="${root}/resources/img/admin/time-icon.png">
                    <div>오늘 예약건</div>
                    <div id="bookTotal">0건</div>
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
                    <div class="header">예약 현황</div><a href="" id="more">더보기</a>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>

                    
                </div>


            </div>
            <div class="area">
                <div id="boardArea">
                    <div class="header">게시판 현황</div><a href="" id="more">더보기</a>
                    <div class="list"><a href="">님이 등록되었습니다.asasdasdasdasdasfㅁㄻㄴㄻㄴㄹㄴㅁㄻㄴㄻㄴㄹ </a><span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>
                    <div class="list"><span>000 님이 등록되었습니다.</span>  <span id="date">2022.10.12 09:14</span></div>

                    

                </div>


            </div>
            
            <div class="area">
                <div id="currentTime" style="font-size: 20px;">
                    현재 시간 <b style="font-size: 30px;" id="clock"></b>
                </div>
                <div id="calender">

                    
                </div>
            </div>

        </main>
    </div>

    <script>
        // 현재 시간 실시간으로 보여주기
        var Target = document.getElementById("clock");
        function clock() {
            var time = new Date().toTimeString().split(" ")[0];
            Target.innerHTML = time;
        }

        clock();
        setInterval(clock, 1000); // 1초마다 실행
    </script>
</body>
</html>