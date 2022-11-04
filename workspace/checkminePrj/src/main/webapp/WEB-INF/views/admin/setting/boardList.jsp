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
        justify-content:left;
        align-items: center;
    }
    #area2{
        height: 65px;
        display: flex;
        justify-content:right;
        align-items: center;
    }

    #listArea{
        height: 633px;
        margin: 0px auto;
        border: 1px solid lightgray;
    }
    #pageArea {
        height: 50px;
        display: flex;
        justify-content: center;
    }
    #header{
        font-size: 20px;
        font-weight: bolder;
    }

    .btn{
        width: 100px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
        margin: 5px;
    }

    .dropdown-toggle{
        margin-left: 20px;
        border: 1px solid ;
    }

    #listArea > table{
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        font-size: 15px;
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

    thead > tr{
        height: 39px;
    }

    tbody > tr{
        height: 39.5px;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">설정 - 삭제된 게시글 관리</span>
                <div class="dropdown">
                    <button type="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                      메뉴
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="${root}/admin/setting/memberList">퇴사한 사원 관리</a></li>
                      <li><a class="dropdown-item" href="${root}/admin/setting/boardList">삭제된 게시글 관리</a></li>
                    </ul>
                  </div>
            </div>
            <div id="area2">
                <button type="button" class="btn" onclick="restoreList();">복원</button>
                <button type="button" class="btn" onclick="deleteList();">영구 삭제</button>
            </div>

            <div id="listArea">
                <table class="table table-hover">
                    <thead style="background-color: #C4F2EA;">
                        <tr>
                            <th width="10%">번호</th>
                            <th width="10%">카테고리</th>
                            <th width="40%">게시물 제목</th>
                            <th width="10%">작성자</th>
                            <th width="15%">삭제일</th>
                            <th width="10%">조회수</th>
                            <th width="5%"><input type="checkbox" onclick="selectAll(this);"></th>
                        </tr>
                    </thead>
                    <tbody style="border-top: none;">
                    <c:forEach items="${boardList}" var="b">
                    
                        <tr>
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
                <a href="${root}/admin/setting/boardList?p=${pv.startPage -1}">&lt;</a>            
            </c:if>
            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
            	<c:choose>
            		<c:when test="${pv.currentPage eq i}">
            			<a style="font-weight:900;">${i}</a>  
            		</c:when>
            		<c:otherwise>
		                <a href="${root}/admin/setting/boardList?p=${i}">${i}</a>            
            		
            		</c:otherwise>
            	
            	</c:choose>
                
            </c:forEach>
              <c:if test="${pv.endPage ne pv.maxPage}">
                <a href="${root}/admin/setting/boardList?p=${pv.endPage + 1}">&gt;</a>
              </c:if>
            </div>
        </main>
    </div>
</body>
<script>
    //전체 선택
    function selectAll(selectAll)  {
    const checkboxes 
        = document.getElementsByName('check');
    
    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    })
    }




    //선택 항목 삭제하는 AJAX
    function deleteList(){
        const checkArr = [];
        var answer = confirm("해당 게시물을 영구 삭제하시겠습니까?");
        
        //확인 버튼 누를 시 체크 값 담고 삭제
        
        if(answer == true){
            if($("input:checkbox[name='check']:checked").length == 0){
                alert("선택한 항목이 없습니다");
            }else{
                $("input:checkbox[name='check']:checked").each(function(){
             checkArr.push($(this).val());
             console.log(checkArr);
        });

            $.ajax({
            type : "POST",
            url : "${root}/admin/setting/deleteBoard",
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

    //선택 항목 복원하는 AJAX
    function restoreList(){
        const checkArr = [];
        var answer = confirm("해당 게시물을 복원하시겠습니까?");
        
        //확인 버튼 누를 시 체크 값 담고 삭제
        
        if(answer == true){
            if($("input:checkbox[name='check']:checked").length == 0){
                alert("선택한 항목이 없습니다");
            }else{
                $("input:checkbox[name='check']:checked").each(function(){
             checkArr.push($(this).val());
             console.log(checkArr);
        });

            $.ajax({
            type : "POST",
            url : "${root}/admin/setting/restoreBoard",
            data:{
                checkArr : checkArr
            },
            success: function(e){
                console.log(e);
                alert("복원되었습니다.");
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