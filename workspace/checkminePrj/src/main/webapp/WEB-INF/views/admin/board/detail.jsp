<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
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

    #content-box{
        height: 550px;
        overflow: auto;
        margin-bottom: 15px;
    }

    #content{
   		width:98%;
   		min-height: 340px;
        margin: 14px;
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
        padding: 5px;
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
        font-size: 13px;
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

    .btn{
        width: 88px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 10px;
        color: white;
        margin: 0px 5px;
    }

    #buttonArea{
        display: flex;
        justify-content:right;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
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
                	<div>추천 ${board.recommendCnt}</div>
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
                            <c:when test="${board.modifyDate ne null}">${board.modifyDate}</c:when>
                            <c:otherwise>${board.enrollDate}</c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="content-box">
                    <div id="content">${board.content}</div>
                    <div id="attachArea">
                        <c:if test="${fn:length(attList) != 0}">
                        <h6>첨부파일</h6>
                    		<c:forEach items="${attList}" var="a">
	                    		<a download href="${root}/resources/upload/board/${a.name}" style="font-size: small;">${a.name}</a><br>
                    		</c:forEach>
                    	</c:if>
                    </div>

                    <div id="replyArea">
                        <div id="replyTitle">댓글</div>
                        <div id="replyList">

                        </div>
                        <div id="write">
                            <textarea name="content" id="replyText" placeholder="댓글을 남겨보세요."></textarea><button type="button" onclick="replyAdd()" id="add">등록</button>
                        </div>
                    </div>
                </div>

                <div id="buttonArea">
                    <button type="button" class="btn" id="correct" onclick ="location.href = '${root}/admin/board/list?sort=a'">목록</button>     
                    <c:if test="${loginAdmin.no eq board.wno}">
                        <button type="button" class="btn" id="correct" onclick ="location.href ='${root}/admin/board/edit/${board.no}'">수정</button>
                    </c:if>
                    <button type="button" class="btn" id="delete" onclick="deleteBoard()">삭제</button>
                </div>
            </div>
        </main>
    </div>

    <script>
	    //게시물 삭제 시 컨펌으로 한번더 확인
	    function deleteBoard(){
	        const answer = confirm('해당 게시물을 삭제할까요?');
	        if(answer == true){
	            location.href="${root}/admin/board/delete/${board.no}";
	        }
	    }
    </script>
    <script>
        //댓글 자동으로 조회
        $(function(){
            replyList();
        })

        //댓글 조회 ajax
        function replyList(){
            $.ajax({
                url : "${root}/reply/list/${board.no}",
                type : 'POST',
                success : function(list){
                    var result = "";
                    for(var i in list){
                        var a = list[i].mno;
                       if("${loginAdmin.no}" == a){
                           result +=
                           '<div id="reply-bot"><div id="replyWriter">'+
                                       '<div style="font-weight:500;">'+list[i].replier+'&nbsp'+list[i].position+'</div>'+
                                       '<div style="color:gray; font-size:13px">'+ list[i].replyDate +'</div>'+
                                       '<button type="button" id="deleteReply" onclick="deleteReply('+list[i].no+')">삭제</button>'+                              
                                       '</div><div>'+list[i].content+'</div></div>'
                       }else{
                        result +=
                           '<div id="reply-bot"><div id="replyWriter"><input type="hidden" value="'+list[i].no+'" id="replyNo">'+
                                       '<div style="font-weight:500;">'+list[i].replier+'&nbsp'+list[i].position+'</div>'+
                                       '<div style="color:gray; font-size:13px">'+ list[i].replyDate +'</div>'+                  
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
            const replierName = '${sessionScope.loginAdmin.name}';
            
            $.ajax({
                url: "${root}/reply/write",
                type : "POST",
                data : {

                    "content" : replyText,
                    "bNo" : boardNo
                    
                },
                success: function(result){
                    if(result == 'ok'){
                        alert("등록되었습니다.");
                        replyList();
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
        function deleteReply(replyNo){
            let answer = confirm("삭제하시겠습니까?");
            if(!answer){
                return;
            }

            $.ajax({
                url: "${root}/reply/delete",
                type : "POST",
                data : {
                    "no" : replyNo
                },
                success: function(result){
                    if(result == 'ok'){
                        alert("삭제되었습니다.");
                        replyList();
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