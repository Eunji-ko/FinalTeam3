<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>업무 | 지시서 목록</title>
<style>

    #order{
        border-top: 1px solid #B0D9D1 !important;
        border-left: 1px solid #B0D9D1 !important;
        border-right: 1px solid #B0D9D1 !important;
        border-bottom: 1px solid white !important;
        color: #728D89 !important;
        font-weight: bold;
    }

    /*검색 기능+작성 버튼*/
    #search-write-box {
        margin-left: 20px;
        margin-right: 20px;
        display: flex;
        justify-content: space-between;
    }

    /*검색 기능*/
    #search{
        margin: 20px;
        border: 1px solid gray;
        border-radius: 50px;
    }

    .search-btn{
        border-radius: 100px;
        border: none;
        margin-right: 5px;
        margin-left: 10px;
    }

    .search-btn:hover{
        background-color: #5D736F;
        color: white;
    }

    .form-control{
        border-radius: 100px;
        margin-left: 5px;
    }
    
    /*검색 이미지*/
    #search-img{
        margin-left: 10px;
    }

    /*작성 버튼*/
    #write-box {
        margin: 20px;
        margin-top: 30px
    }

    #write{
        padding: 10px;
        border: 1px solid #5D736F;
        background-color: #5D736F;
        border-radius: 30px;
        color: white;
        text-decoration: none;
    }

    input[type="text"] {
        padding: 10px;
        border: none;
        height: 35px;
        border-radius: 50px;
    }

    #center{
        width: 95%;
        height: 90%;
        margin: auto;

        display: grid;
        grid-template-columns: 100PX 100PX 250px 700px 100px 200px;
        grid-template-rows: repeat(16, 40px);
    }
    
    #center > div{
        text-align: center;
    }

    .list-header{
        background-color: #B0D9D1;
        font-weight: bolder;
        font-size: large;
        line-height: 40px;
        border-right: 1px solid white;
    }

    .list{
        border-bottom: 1px solid lightgray;
        line-height: 35px;
        font-size: large;
    }

    #title>a {
        text-decoration: none;
        color: black;
    }

    #title:hover{ 
        text-decoration: underline;
    }


    /*페이징*/
    #page-area{
        margin-top: 20px;
        text-align: center;
    }

    .page-no{
        padding: 3px 10px 3px 10px;
        border-radius: 10px;
    }

    #page-area > a {
        font-size: large;
        text-decoration: none;
        color: black;
        /*height: 10px;
        padding: ;*/
    }
    
    .p-active{
        border: 2px solid #B0D9D1;
        color: #728D89 !important;
    }
    
    #page-area > a:hover {
        border: 2px solid #5D736F;
        background-color: #5D736F;
        color: white !important;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">

            <div id="wrap">
                <!--카테고리-->
				<%@ include file="/WEB-INF/views/task/navi.jsp" %>

                <!--검색 기능-->
                <div id="search-write-box">
                    <form id="search" action="${root}/task/order/search" method="get" >
                        <table class="pull-right">
                            <tr>
                                <td>
                                    <img src="${root}\resources\img\personnel\search_icon.png" alt="검색 아이콘" width="20px" id="search-img">
                                </td>
                                <td><select class="form-control" name="type">
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                        <option value="orderer">작성자</option>
                                </select></td>
                                <td>
                                    <input type="text" class="form-control"
                                    placeholder="지시서 검색" name="keyword" maxlength="100"></td>
                                <td><button type="submit"class="search-btn">검색</button></td>
                            </tr>
                        </table>
                    </form>
                    <c:if test="${not empty loginMember}">
                        <div id="write-box"><a href="${root}/task/order/write" id="write">지시서 작성</a></div>
                    </c:if>
                </div>
                
                <!--지시서 목록-->
                <div id="center">
                    <div class="list-header">번호</div>
                    <div class="list-header">중요도</div>
                    <div class="list-header">수신자</div>
                    <div class="list-header">제목</div>
                    <div class="list-header">작성자</div>
                    <div class="list-header">날짜</div>
                    <c:forEach items="${voList}" var="vo">
 	                   <c:if test="${vo.orderer eq loginMember.name or vo.attName eq loginMember.name}">
		                    <div class="list">${vo.no}</div>
		                    <div class="list">
		                    	<c:if test="${vo.importance eq 'N'}"> <span>보통</span></c:if>
		                    	<c:if test="${vo.importance eq 'E'}"> <span>중요</span></c:if>
		                    	<c:if test="${vo.importance eq 'I'}"> <span>긴급</span></c:if>
		                    </div>
		                    <div class="list att" id="att${vo.no}">
		                    	${vo.attName}
		                    </div>
		                    <div class="list" id="title"><a href="${root}/task/order/detail/${vo.no}" class="title">${vo.title}</a></div>
		                    <div class="list">${vo.orderer}</div>
		                    <div class="list">${vo.enrollDate}</div>
	                    </c:if>
                    </c:forEach>

                </div>
                
                <!--페이징-->
                <div id="page-area">
                	<c:if test="${pv.startPage ne 1}">                	
	                    <a href="${root}/task/order/list/${pv.startPage-1}"><</a>
                	</c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                    	<a href="${root}/task/order/list/${i}" class="page-no">${i}</a>
                    </c:forEach>
                    <c:if test="${pv.endPage ne pv.maxPage}">
                    	<a href="${root}/task/order/list/${pv.endPage + 1}">></a>
                    </c:if>
                </div>
            </div>
        </main>
    </div>

    <script>
        //nav 활성화
        var url = window.location.pathname;

        $('#page-area').find('a').each(function(){
            $(this).toggleClass('p-active', $(this).attr('href') == url);
        });
        
        //제목/수신자 화면 넘어가면
        function CheckMaxString(obj, maxNum){               
          var li_str_len = obj.length;
          var li_byte = 0;
          var li_len = 0;
          var ls_one_char = "";
          var ls_str2 = "";
          for( var j=0; j<li_str_len; j++){
                    ls_one_char = obj.charAt(j);
                    if(escape(ls_one_char).length > 4 ) {
                              li_byte += 2;
                    }else{
                              li_byte++;
                    }
                    if(li_byte <= maxNum){
                              li_len = j+1;
                    }
          }
          if(li_byte > maxNum){
                    ls_str2 = obj.substr(0, li_len)+"...";
          }else{
                    ls_str2 = obj;
          }
          console.log("변환 후 ::: " + ls_str2);
          return ls_str2;
        }

        var attList = document.getElementsByClassName('att');
        $.each(attList, function(idx, att){
            attList[idx].innerText = att.innerText;
            console.log("att ::: " + att.innerText);
            attList[idx].innerText = CheckMaxString(att.innerText, 29);
        })
        
        var titleList = document.getElementsByClassName('title');
        $.each(titleList, function(idx, title){
            titleList[idx].innerText = title.innerText;
            console.log("att ::: " + title.innerText);
            titleList[idx].innerText = CheckMaxString(title.innerText, 80);
        })

    </script>
</body>
</html>