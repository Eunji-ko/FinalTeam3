<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시물 상세보기</title>
<style>
    main > div {
        width: 1450px;
        margin: 10px auto;
    }
    
    #area{
        height: 130px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }

    #infoWrap{
        height: 700px;
    }

    #area button:first-child{
        width: 20px; 
        height: 20px; 
        border: none; 
        background-color: white;
        font-size: 20px;
        font-weight: bolder;
    }

    #header{
        font-size: 20px;
        font-weight: bolder;
    }

    #title{
        width: 1450px;
        height: 70px;
        background-color: #B0D9D1;
        border-bottom: 1px solid black;
    }

    #title > div{
        font-size: 30px;
        margin-left: 20px;
        line-height: 65px;
    }

    #info{
        height: 40px;
        border-bottom: 1px solid #5D736F;
        display: flex;
        justify-content: end;
    }

    #info > div{
        display: inline-block;
        margin-right: 15px;
        line-height: 40px;
        font-size: 18px;
    }

    #dateArea{
        color: gray;
    }

    #content-box{
        height: 550px;
        overflow: auto;
        margin-bottom: 15px;
    }

    #content{
   		width:98%;
   		min-height: 340px;
        margin: 10px;
        display: inline-block;
    }

    #content > img {
        max-width: 100%;
        display: block;
    }

    #attachArea{
        margin: 20px;
        border-bottom: 1px solid #5D736F;
    }

    #replyArea{
        height: 100px;
        margin: 20px;
        margin-top: 25px;
    }

    #reply-bot{
        margin-left: 30px;
        border-bottom: 1px solid lightgrey;
        font-size: 15px;
    }

    #replyTitle, #attachArea > h6{
        color: #5D736F;
        font-weight: bolder;
    }

    #replyWriter{
        width: 100%;
    }

    #replyWriter > div{
        display: inline-block;
        margin-right: 10px;
    }
    
    #replyWriter button {
        background-color: white;
        border: none;
        color: gray;
    }

    textarea {
        resize: none;
        border: 1px solid gray;
        width: 1300px;
        margin-left: 30px;
        margin-top: 5px;
    }

    #write > button{
        background-color: #5D736F;
        border: none;
        color: white;
        height: 55px;
        width: 60px;
        margin: 5px;
        border-radius: 20px;    
    }

    #write {
        display: flex;
        justify-content: space-around;
    }
   
    #buttonArea{
        display: flex;
        justify-content:space-between;
    }
    
    #buttonArea  button{
        margin: 0px 5px;
        width: 88px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 10px;
        color: white;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
            <div id="area">
                <div>
                    <span id="header">&nbsp;&nbsp;상세보기</span>
                </div>
            </div>
            
            <div id="infoWrap">
                <div id="title">
                	<div>
                        <c:if test="${board.type eq 'N'}">[공지]&nbsp</c:if>
                        ${board.title}
                	</div>
                </div>

                <div id="info">
                	<div id="recommendCnt">추천 ${board.recommendCnt}</div>
                    <div>조회수 ${board.hit}</div>
                    <div id="writer">
                        <b>
                            <c:choose>
                                <c:when test="${board.department eq '-'}">${board.writer}</c:when>
                                <c:otherwise>${board.department}&nbsp${board.writer}</c:otherwise>
                            </c:choose>
                        </b>
                    </div>
                    <div id="dateArea">
                        <c:choose>
                            <c:when test="${board.modifyDate ne null}">
                                ${board.modifyDate}
                            </c:when>
                            <c:otherwise>
                                ${board.enrollDate}
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="content-box">
                    <div id="content">${board.content}</div>
                    <div id="attachArea">
                        <c:if test="${fn:length(attList) != 0}">
                            <h6>첨부파일</h6>
                            <c:forEach items="${attList}" var="a">
                                <a download href="${rootPath}/resources/upload/board/${a.name}" style="font-size: small;">${a.name}</a><br>
                            </c:forEach>
                    	</c:if>
                    </div>

                    <div id="replyArea">
                        <div id="replyTitle">댓글</div>
                        <div id="replyList">

                        </div>
                        <div id="write">
                            <textarea name="content" id="replyText" placeholder="댓글을 남겨보세요."></textarea>
                            <button type="button" onclick="replyAdd()" id="add">등록</button>
                        </div>
                    </div>
                </div>

                <div id="buttonArea">
                    <div>
                        <c:choose>
                            <c:when test="${recommendList eq '1'}">
                                <button type="button" class="btn" id="recommend" style="background-color: white; color:#5D736F" onclick="recommendBoard()">추천!</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn" id="recommend" onclick="recommendBoard()">추천</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <c:choose>
                            <c:when test="${board.type eq 'N'}">
                                <button type="button" class="btn" id="correct" onclick ="location.href = '${rootPath}/board/list/notice'">목록</button>
                            </c:when>
                            <c:when test="${board.type eq 'C'}">
                                <button type="button" class="btn" id="correct" onclick ="location.href = '${rootPath}/board/list/community'">목록</button>
                            </c:when>
                            <c:when test="${board.type eq 'G'}">
                                <button type="button" class="btn" id="correct" onclick ="location.href = '${rootPath}/board/list/gallery'">목록</button>
                            </c:when>
                        </c:choose>
                        <c:if test="${loginMember.no eq board.wno}">   
                            <button type="button" class="btn" id="correct" onclick ="location.href = '${rootPath}/board/edit/${board.no}'">수정</button>
                            <button type="button" class="btn" id="delete" onclick="deleteBoard()">삭제</button>
                        </c:if> 
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        //추천 기능 
        function recommendBoard(){
            $.ajax({
                url: "${rootPath}/board/recommend",
                type : "POST",
                data : {
                    "bNo" : "${board.no}",
                    "memberNo" : "${loginMember.no}"
                },
                success: function(str){
                    if(str.recommendList == 0){
                        document.querySelector('#recommend').innerHTML = "추천!";
                        document.querySelector('#recommend').style.cssText = "background-color: white; color:#5D736F";
                    }else{
                        document.querySelector('#recommend').innerHTML = "추천";
                        document.querySelector('#recommend').style.cssText = " ";
                    }
                    $('#recommendCnt').html("추천 "+ str.recommendCnt);
                },
                error: function(result){
                    alert("통신 중 문제가 발생하였습니다.");
                }
            });
        }
    </script>

    <script>
        //게시물 삭제 
        function deleteBoard(){
            const answer = confirm('해당 게시물을 삭제할까요?');
	        if(answer == true){
	            location.href="${rootPath}/board/delete/${board.type}/${board.no}";
	        }
        }
    </script>

    <script>
        $(function(){
            replyList();
        })

        //댓글 조회 ajax
        function replyList(){
            $.ajax({
                url : "${rootPath}/reply/list/${board.no}",
                type : 'POST',
                success : function(list){
                    var result = "";
                    for(var i in list){
                        var a = list[i].mno;
                       if("${loginMember.no}" == a){
                           result +=
                           '<div id="reply-bot"><div id="replyWriter"><input type="hidden" value="'+list[i].no+'" id="replyNo">'+
                                       '<div style="font-weight:500;">'+list[i].replier+'&nbsp'+list[i].position+'</div>'+
                                       '<div style="color:gray;">'+ list[i].replyDate +'</div>'+
                                       '<button type="button" id="deleteReply" onclick="deleteReply()">삭제</button>'+                              
                                       '</div><div>'+list[i].content+'</div></div>'
                       }else{
                            result +=
                            '<div id="reply-bot"><div id="replyWriter"><input type="hidden" value="'+list[i].no+'" id="replyNo">'+
                                        '<div>'+list[i].replier+'&nbsp'+list[i].position+'</div>'+
                                        '<div style="color:gray;>'+ list[i].replyDate +'</div>'+                  
                                        '</div><div>'+list[i].content+'</div></div>'
                       }            
                    }
                    $("#replyList").html(result);
                },
                error : function(e){
                    alert("통신 중 문제가 발생하였습니다.");
                }
            });
        }
    </script>

    <script>
        //댓글 추가 ajax
        function replyAdd(){
            const replyText = document.querySelector('#replyText').value;

            if(replyText == ''){
                alert("댓글 내용을 입력해주세요");
                return;
            }

            const boardNo = "${board.no}";
            const replierName = '${sessionScope.loginMember.name}';
            
            $.ajax({
                url: "${rootPath}/reply/write",
                type : "POST",
                data : {
                    "content" : replyText,
                    "bNo" : boardNo   
                },
                success: function(result){
                    if(result == 'ok'){
                        alert("등록되었습니다.");
                        replyList(); //댓글 업데이트
                        //기존에 입력한 내용 지우기
                        document.querySelector('#replyText').value = '';
                    }else{
                        alert("처리 중 문제가 발생하였습니다.");
                    }
                },
                error: function(result){
                    alert("통신 중 문제가 발생하였습니다.");
                }
            });
        }
    </script>

    <script>
        //댓글 삭제 ajax
        function deleteReply(){
            let answer = confirm("삭제하시겠습니까?");
            if(!answer){
                return;
            }

            const replyNo = document.querySelector('#replyNo').value;
	
            $.ajax({
                url: "${rootPath}/reply/delete",
                type : "POST",
                data : {
                    "no" : replyNo
                },
                success: function(result){
                    if(result == 'ok'){
                        alert("삭제되었습니다.");
                        replyList(); //댓글 업데이트
                    }else{
                        alert("처리 중 문제가 발생하였습니다.");
                    }
                },
                error: function(result){
                    alert("통신 중 문제가 발생하였습니다.");
                }
            });
        }
    </script>
</body>
</html>