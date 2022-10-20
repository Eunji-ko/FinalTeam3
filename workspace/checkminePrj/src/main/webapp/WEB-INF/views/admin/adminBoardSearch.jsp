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
        height: 616px;
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
        display: inline-block;
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
                    <button type="button" class="btn" onclick="location.href='${root}/admin/board/write'">공지 등록</button>
                    <button type="button" class="btn" style="width: 110px;" onclick="deleteList()">선택 삭제</button>
                </div>
                
            </div>
			<div id="area2">
			<div>
                <select class="form-select" id="filter" name="select" onchange="location.href=this.value">
                	<option value="${root}/admin/board/list?sort=a&p=1">-----</option>
                    <option value="${root}/admin/board/list?sort=a&p=1">모두</option>
                    <option value="${root}/admin/board/list?sort=n&p=1">공지사항</option>
                    <option value="${root}/admin/board/list?sort=c&p=1">커뮤니티</option>
                    <option value="${root}/admin/board/list?sort=g&p=1">갤러리</option>
                </select>
            	<div style="display: inline-block; margin:10px">'${keyword}'의 검색결과입니다.</div>
               </div>
                <form action="${root}/admin/board/search" method="get">
                <input type="hidden" name="p" value="1">
                    <select class="form-select" id="option" name="option" required style="display: inline-block;">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
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
                            <td onclick="event.cancelBubble=true"><input type="checkbox" name="check" value="${b.no}"></td>
                        
                        </tr>
                    
                    
                    
                    </c:forEach>

                    </tbody>
                    
                </table>
            </div>
            <div id="pageArea">
            <c:if test="${pv.startPage ne 1}">
                <a href="${root}/admin/board/search?p=${pv.startPage -1}&option=${option}&keyword=${keyword}">&lt;</a>            
            </c:if>
            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
            	<c:choose>
            		<c:when test="${pv.currentPage eq i}">
            			<a style="font-weight:900;">${i}</a>  
            		</c:when>
            		<c:otherwise>
		                <a href="${root}/admin/board/search?p=${i}&option=${option}&keyword=${keyword}">${i}</a>            
            		
            		</c:otherwise>
            	
            	</c:choose>
                
            </c:forEach>
              <c:if test="${pv.endPage ne pv.maxPage}">
                <a href="${root}/admin/board/search?p=${pv.endPage + 1}&option=${option}&keyword=${keyword}">&gt;</a>
              </c:if>
            </div>
        </main>
    </div>
</body>
<script>
    //선택 항목 삭제하는 AJAX
    function deleteList(){
        const checkArr = [];
        var answer = confirm("해당 게시물을 삭제하시겠습니까?");
        
        //확인 버튼 누를 시 체크 값 담고 삭제
        ;
        if(answer == true){
            if($("input:checkbox[name='check']:checked").length == 0){
                alert("선택한 게시물이 없습니다");
            }else{
                $("input:checkbox[name='check']:checked").each(function(){
             checkArr.push($(this).val());
             console.log(checkArr);
        });

            $.ajax({
            type : "POST",
            url : "${root}/admin/board/delete",
            data:{
                checkArr : checkArr
            },
            success: function(e){
                console.log(e);
                alert("삭제되었습니다.");
                location.reload();
            },
            fail: function(error){
                alert("오류가 발생하였습니다. 시스템 관리자에게 문의하세요.");
            }

        });
            }
            
            }else{
                return false;
            }
        
      
        
    }
    

</script>
	
	
	
	
</html>