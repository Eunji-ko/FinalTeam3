<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시판관리</title>
<style>


    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
    #area1{
        height: 65px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }
    #area2{
        height: 65px;
        display: flex;
        justify-content:space-between;
        align-items: center;
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
    #header{
        font-size: 20px;
        font-weight: bolder;
    }

    .btn{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
    }

    #filter{
        width: 110px;
    }
    #option{
        width: 183px;
    }

    input[type="text"]{
        width: 230px;
        display: inline-block;
        border: none;
    }
    #search{
        background:url(${root}/resources/img/admin/search.png);
        background-repeat: no-repeat;
        width:20px;
        height:17px;
        border: none;
        
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
    table{
        table-layout: fixed;
    }
    td{
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">게시판 관리</span>
                <div>
                    <button type="button" class="btn">공지 등록</button>
                    <button type="button" class="btn" style="width: 110px;" onclick="deleteList()">선택 삭제</button>
                </div>
                
            </div>
			<div id="area2">
                <select class="form-select" id="filter" name="filter">
                    <option value="a" onclick="filter()">모두</option>
                    <option value="n" onclick="filter()">공지사항</option>
                    <option value="c" onclick="filter()">커뮤니티</option>
                    <option value="g" onclick="filter()">갤러리</option>
                </select>
                <form action="" method="get">
                    <select class="form-select" id="option" required style="display: inline-block;">
                        <option>제목</option>
                        <option>내용</option>
                        <option>작성자</option>
                    </select>
                    <div style="width: 267px; border: 1px solid lightgray; display: inline-block;" >
                        <input type="text" name="keyword" id="keyword" class="form-control" required>
                        <input type="submit" id="search" value="">
                    </div>
                    
                </form>
          


            </div>
            <div id="listArea">
                <table class="table table-hover">
                    <thead style="background-color: #C4F2EA;">
                        <tr>
                            <th width="10%">번호</th>
                            <th width="10%">카테고리</th>
                            <th width="40%">게시물 제목</th>
                            <th width="10%">작성자</th>
                            <th width="15%">작성일</th>
                            <th width="10%">조회수</th>
                            <th width="5%">선택</th>
                        </tr>
                    </thead>
                    <tbody style="border-top: none;">
                    <c:forEach items="${boardList}" var="b">
                    
                        <tr onclick="location.href='${root}/board/detail/${b.no}'">
                            <td>${b.no}</td>
                            <td>
	                            <c:choose>
	                            	<c:when test="${b.type eq 'N'}">공지사항</c:when>
	                            	<c:when test="${b.type eq 'C'}">커뮤니티</c:when>
	                            	<c:when test="${b.type eq 'G'}">갤러리</c:when>
	                            </c:choose>
                            </td>
                            <td>${b.title}</td>
                            <td>${b.writer}</td>
                            <td>${b.enrollDate}</td>
                            <td>${b.hit}</td>
                            <td><input type="checkbox" name="checked" id=""></td>
                        
                        </tr>
                    
                    
                    
                    </c:forEach>

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
        </main>
    </div>
</body>
<script>
    //선택 항목 삭제하는 AJAX

    
	

</script>
	
	<script>
    //카테고리 필터 AJAX
	function filter(){
    	const category = $("#filter").val();
		$.ajax({
			url : "${root}/board/list",
			type : 'GET',
			data : {"category":category},
			success : function(data){
				console.log(data);
			},
			error : function(){
				alert("error");
			}



		});
	}
	
	</script>
</html>