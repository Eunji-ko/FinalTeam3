<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 공유물관리</title>
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
        height:20px;
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
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">공유물 관리</span>
                <div>
                    <button type="button" class="btn">공유물 등록</button>
                    <button type="button" class="btn" style="width: 110px;" onclick="deleteList()">선택 삭제</button>
                </div>
                
            </div>
			<div id="area2">
                <select class="form-select" id="filter">
                    <option>모두</option>
                    <option>장소</option>
                    <option>장비</option>
                </select>
                <form action="">
                    <select class="form-select" id="option" required style="display: inline-block;">
                        <option>이름</option>
                        <option>설명</option>
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
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>이름</th>
                            <th>설명</th>
                            <th>오늘 예약건수</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody style="border-top: none;">
                        <tr onclick="location.href='#'">
                            <td>1</td>
                            <td>장소</td>
                            <td>안쪽 어딘가의 회의실</td>
                            <td>2층 안쪽의 횜ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
                            <td>3</td>
                            <td><input type="checkbox" name="checked" id=""></td>
                        
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
        </main>
    </div>
</body>
<script>
    //선택 항목 삭제하는 AJAX



</script>
</html>