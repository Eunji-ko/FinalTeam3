<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 공유물 등록</title>

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
    

    .btn{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
    }
    #content-box{
        height: 630px;
        margin: 10px;
        
    }
    #content-box *{
        margin: 0 auto;
        font-size: 20px; 
    }
    #content-box input[type="text"], textarea{
       width: 600px; 
    }
    table{
        border-collapse: separate;
        border-spacing: 0 20px;
    }
    table th{
        padding-right: 20px;
    }
    textarea{
        resize: none;
        height: 300px;
    }
    label{
        padding-left: 10px;
        
    }
    input[type="radio"]{
        vertical-align: middle;
    }
   
    
    #footer{
        margin: 10px;
        display: flex;
        justify-content: right;
    }

  
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area">
                <div>
                    <button onclick="history.back()">←</button>
                    <span id="header">&nbsp;&nbsp;공유물 등록</span>
                </div>
            </div>
            
            <div id="infoWrap">
                <form action="${root}/admin/goods/add" method="post">
                    <div id="content-box">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" class="form-control" name="name" id="" required></td>
                        </tr>
                        <tr>
                            <th>타입</th>
                            <td><input type="radio" name="type" style="width:20px;height:20px;border:1px;" value="place" checked><label for="place">장소</label>
                                <input type="radio" name="type" style="width:20px;height:20px;border:1px;margin-left: 20px;" value="goods"><label for="goods">장비</label>
                            </td>
                        </tr>
                        <tr>
                            <th>설명</th>
                            <td><textarea class="form-control" name="content" id="" required></textarea></td>
                        </tr>
                    </table>
                </div>
                    <div id="footer">
                        <div id="buttonArea"><button type="submit" class="btn" id="regist">등록하기</button></div>
                    </div>
                
               

                
                </form>
                
            </div>
            
 
            
        </main>
    </div>
   
    <script>

       
    </script>
    




</body>
</html>