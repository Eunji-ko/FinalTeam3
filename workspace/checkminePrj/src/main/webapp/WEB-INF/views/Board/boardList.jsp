<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시판</title>
<style>


    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
  
   
    #listArea{
        height: 596px;
        margin: 20px auto;
        border: 1px solid lightgray;
    }
    #pageArea {
        height: 30px;
        display: flex;
        justify-content: center;
    }
    .nav-tabs{
        margin-top: 20px;
    }

    #btn{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
        margin-left: 15px;
    }
    input[type="text"]{
        width: 230px;
        display: inline-block;
        border: none;
    }
    #search{
        background:url(${rootPath}/resources/img/admin/search.png);
        background-repeat: no-repeat;
        width:25px;
        height:23px;
        border: none;
    }
    #searchArea{
        display: flex;
        justify-content: right;
    }
    #listArea > table{
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        
    }

    #pageArea > a{
        padding: 15px;
        text-decoration: none;
        color: black;
    }

    .nav-tabs .nav-link.active {
        color: #B0D9D1;
    }

    .nav-tabs .nav-link {
        color: black;
    }

    table{
        table-layout: fixed;
    }
    td, .title{
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .board-item{
        border-radius: 20px;
        margin: 10px;
        width: 250px;
        height: 270px;
        border: 1px solid lightgray;
        display: inline-block;
        margin-left: 50px;
        font-size: 13px;
    }
    .thumbnail{
        width: 230px;
        height: 210px;
        margin: 10px auto;
    }

    .thumbnail img{
        width: 100%;
        height: 100%;
        border-radius: 20px;
    }
    .info{
        display: flex;
        justify-content: space-around;
    }
    .title, .writer{
        display: inline-block;
    }
    .title{
        width: 150px;
        margin-right: 10px;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
                <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#notice">공지사항</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#community">커뮤니티</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#gallery">갤러리</a>
                </li>
            </ul>
            

            <div class="tab-content">
                <!-- 공지사항 -->
                <div id="notice" class="container tab-pane active"><br>
                    <div id="searchArea">
                        <div style="width: 267px; border: 1px solid lightgray; " >
                        <form action="">
                            <input type="text" name="keyword" id="keyword" class="form-control" placeholder="공지사항 검색" required>
                            <input type="submit" id="search" value="">
                        </form>
                        </div> 
                        <button type="button" class="btn" id="btn">글 작성</button> 
                    </div>
                    <div id="listArea">
                        <table class="table table-hover">
                            <thead style="background-color: #C4F2EA;">
                                <tr>
                                    <th width="10%">번호</th>
                                    <th width="40%">제목</th>
                                    <th width="20%">작성자</th>
                                    <th width="20%">작성일</th>
                                    <th width="10%">조회수</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: none;">
                                <tr onclick="location.href='#'">
                                    <td>1</td>
                                    <td>게시물sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss 제목</td>
                                    <td>테스트</td>
                                    <td>2022.10.13</td>
                                    <td>10</td>
                                </tr>
        
                            </tbody>
                            
                        </table>
                    </div>






                <div id="pageArea">
                    <a href="#">&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&gt;</a>
                </div>
                </div>
                <!--커뮤니티-->
                <div id="community" class="container tab-pane fade"><br>
                    <div id="searchArea">
                        <div style="width: 267px; border: 1px solid lightgray; " >
                        <form action="">
                            <input type="text" name="keyword" id="keyword" class="form-control" placeholder="커뮤니티 검색" required>
                            <input type="submit" id="search" value="">
                        </form>
                        </div> 
                        <button type="button" class="btn" id="btn">글 작성</button> 
                    </div>
                    <div id="listArea">
                        <table class="table table-hover">
                            <thead style="background-color: #C4F2EA;">
                                <tr>
                                    <th width="10%">번호</th>
                                    <th width="40%">제목</th>
                                    <th width="20%">작성자</th>
                                    <th width="20%">작성일</th>
                                    <th width="10%">조회수</th>
                                </tr>
                            </thead>
                            <tbody style="border-top: none;">
                                <tr onclick="location.href='#'">
                                    <td>1</td>
                                    <td>게시물sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss 제목</td>
                                    <td>테스트</td>
                                    <td>2022.10.13</td>
                                    <td>10</td>
                                </tr>
        
                            </tbody>
                            
                        </table>
                    </div>






                <div id="pageArea">
                    <a href="#">&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&gt;</a>
                </div>
                </div>
                <!--갤러리-->
                <div id="gallery" class="container tab-pane fade"><br>
                    <div id="searchArea">
                        <div style="width: 267px; border: 1px solid lightgray; " >
                        <form action="">
                            <input type="text" name="keyword" id="keyword" class="form-control" placeholder="갤러리 검색" required>
                            <input type="submit" id="search" value="">
                        </form>
                        </div> 
                        <button type="button" class="btn" id="btn">글 작성</button> 
                    </div>
                    <div id="listArea">
                        <div class="board-item" style="cursor: pointer;" onclick="location.href='#';">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                        <div class="board-item">
                            <div class="thumbnail"><img src="${rootPath}/resources/img/abc.PNG" alt=""></div>
                            <div class="info"><div class="title">wpaaaaaaaaa</div><div class="writer">작성자</div></div>
                        </div>
                    </div>






                <div id="pageArea">
                    <a href="#">&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&gt;</a>
                </div>
            </div>
               
            </div>
                
            </div>
            </div>
               
                
            
			
            
        </main>
    </div>
</body>
<script>
    //선택 항목 삭제하는 AJAX



</script>
</html>