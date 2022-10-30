<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시판</title>

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
        border: 1px solid lightgrey;
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
        width: 100%;
        border-bottom: 1px solid lightgray;
        display: flex;
        justify-content: left;
    }
    #title input{
        height: 100%;
        width: 100%;
        border: none;
    }
 
 
    #content{
        height: 590px;
        margin: 10px;
        border: 1px solid #5D736F;
    }
  

    #regist{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
    }
    #buttonArea{
        display: flex;
        justify-content:right;
    }
    #buttonArea > button{
        margin-right: 10px;
    }
    #footer{
        margin: 10px;
        display: flex;
        justify-content: space-between;
    }

    textarea{
        resize: none;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
            <div id="area">
                <div>
                    <button onclick="history.back()">←</button>
                    <span id="header">&nbsp;&nbsp;글 수정하기</span>
                </div>
            </div>
            
            <div id="infoWrap">
                <form action="" method="post" enctype="multipart/form-data">
            
                <div id="title">
                    <div><select style="width: 200px;" class="form-select" name="type" id="type">
                        <c:if test="${fn:contains(loginMember.permission, 'N')}">
                            <option value="N">공지사항</option>
                        </c:if>
                        <option value="C">커뮤니티</option>
                        <option value="G">갤러리</option>
                    </select></div>
                    <div><input type="text" class="form-control" name="title" value=${board.title} required></div>
                    
               </div>
                <div id="content-box">
                    <div id="content">
                        <textarea style="width: 100%; height: 100%;" name="content" style="width:650px; height:350px;" required>${board.content}</textarea>
                       
                    </div>
                    <div id="footer">
                        <div id="attach">
                            <c:choose>
                                <c:when test="${board.type eq 'N'}">
                                    <input type="file" name="attach" multiple>
                                </c:when>
                                <c:otherwise>
                                    <input type="file" accept=".gif, .jpg, .png" name="attach" multiple>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div id="buttonArea"><button type="submit" class="btn" id="regist">수정하기</button></div>
                    </div>

                </div>

                
            </form>
                
            </div>
            
 
            
        </main>
    </div>
   
    <script>
        //카테고리 적용
        $('#type').val('${board.type}').prop("selected",true);
       
    </script>
    
    



</body>
</html>