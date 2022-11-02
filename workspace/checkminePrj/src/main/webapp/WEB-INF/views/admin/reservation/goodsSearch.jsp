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
        height: 622px;
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

    .modal-content{
        width: 700px;
        height: 500px;
        padding: 20px;
    }

    .list-header{
        text-align: left;
    }

    .goods-list, .goods-info{
        margin: 0 auto;
        width: 500px;
    }

    .goods-list *, .goods-info *{
        width: 250px;
        text-align: center;
    }

    table {
        border-collapse: separate;
        border-spacing: 0 15px;
        
    }
    .modal-body{
        overflow: auto;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">공유물 관리 - 장비</span>
                <div>
                    <button type="button" class="btn" onclick="location.href='${root}/admin/goods/add'">공유물 등록</button>
                    <button type="button" class="btn" style="width: 110px;" onclick="deleteList()">선택 삭제</button>
                </div>
                
            </div>
			<div id="area2">
                <div>
                    <select class="form-select" id="filter" name="select" onchange="location.href=this.value">
                        <option value="">-----</option>
                        <option value="${root}/admin/goods/list?sort=p&p=1">장소</option>
                        <option value="${root}/admin/goods/list?sort=g&p=1">장비</option>
                    </select>
                    <div style="display: inline-block; margin:10px">'${map.keyword}'의 검색결과입니다.</div>
                </div>
                <form action="${root}/admin/goods/searchGoods" method="get">
                    <select class="form-select" id="option" name="option" required style="display: inline-block;">
                        <option value="name">이름</option>
                        <option value="info">설명</option>
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
                        <tr style="height: 40.5px;">
                            <th width="10%">번호</th>
                            <th width="10%">카테고리</th>
                            <th width="20%">이름</th>
                            <th width="45%">설명</th>
                            <th width="10%">오늘 예약건수</th>
                            <th width="5%">선택</th>
                        </tr>
                    </thead>
                    <tbody style="border-top: none;">
                    <c:forEach items="${goodsList}" var="g">
                    	<tr style="height: 41px;" data-bs-toggle="modal" data-bs-target="#myModal2" onclick="bookList('${g.no}', '${g.name}', '${g.note}');">
                            <td>${g.no}</td>
                            <td>장비</td>
                            <td>${g.name}</td>
                            <td>${g.note}</td>
                            <td>${g.cnt}</td>
                            <td data-bs-dismiss="modal" data-bs-target="#myModal2"><input type="checkbox" name="check" value="${g.no}"></td>
                        </tr>
					</c:forEach>
                    </tbody>
                    
                </table>
            </div>
             <div id="pageArea">
            <c:if test="${pv.startPage ne 1}">
                <a href="${root}/admin/goods/list?sort=${sort}&p=${pv.startPage -1}">&lt;</a>            
            </c:if>
            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
            	<c:choose>
            		<c:when test="${pv.currentPage eq i}">
            			<a style="font-weight:900;">${i}</a>  
            		</c:when>
            		<c:otherwise>
		                <a href="${root}/admin/goods/list?sort=${sort}&p=${i}">${i}</a>            
            		
            		</c:otherwise>
            	
            	</c:choose>
                
            </c:forEach>
              <c:if test="${pv.endPage ne pv.maxPage}">
                <a href="${root}/admin/goods/list?sort=${sort}&p=${pv.endPage + 1}">&gt;</a>
              </c:if>
            </div>
        </main>
    </div>
     <!-- The Modal -->

     <div class="modal" id="myModal2">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">상세보기</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body" align="center">
                
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn" style="background-color: #5D736F; color: white;" data-bs-dismiss="modal">닫기</button>
   			 </div>
   			 </div>
		  </div>
		</div>
    
</body>
<script>
    //예약 리스트 모달 ajax
    function bookList(no, name, note){
        $.ajax({
            type : "POST",
            url : "${root}/admin/goods/book",
            data:{
                "no" : no,
                "sort" : '${sort}'
            },
            success: function(list){
                var result = '<table class="goods-info"><tr><th>이름</th><td>'+name+'</td></tr><tr><th>타입</th><td>장비</td></tr><tr><th>설명</th><td>'
                    +note+'</td></tr></table><hr><div style="margin: 30px; font-weight: bolder;">예약목록</div>';

                if(list.length == 0){
                    result += '<table class="goods-list">예약 내역이 없습니다.</table><hr>'
                }else{
                    for(var i in list){
                        result += 
                         '<table class="goods-list"><tr><th>예약자</th><td>'+list[i].eNo+'</td></tr><tr><th>예약일자</th><td>'+list[i].borrow+'</td></tr><tr>'
                        +'<th>종료일자</th><td>'+list[i].rsvEnd+'</td></tr></table><hr>'
                    }

                }
                $(".modal-body").html(result);

            },
            fail: function(error){
                alert("오류가 발생하였습니다. 시스템 관리자에게 문의하세요.");
            }

        });
            }

</script>
<script>
    //선택 항목 삭제하는 AJAX
    function deleteList(){
        const checkArr = [];
        var answer = confirm("해당 항목을 삭제하시겠습니까?");
        
        //확인 버튼 누를 시 체크 값 담고 삭제
        
        if(answer == true){
            if($("input:checkbox[name='check']:checked").length == 0){
                alert("선택한 항목이 없습니다");
            }else{
                $("input:checkbox[name='check']:checked").each(function(){
             checkArr.push($(this).val());
            });
            
       
            $.ajax({
            type : "POST",
            url : "${root}/admin/goods/delete",
            data:{
                "sort" : '${sort}',
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