<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
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
    select[name="type"]{
        border-top: none;
        border-left: none;
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
                    <span id="header">&nbsp;&nbsp;글 작성</span>
                </div>
            </div>
            
            <div id="infoWrap">
                <form action="" method="post">
            
                <div style="display: flex; justify-content: space-between;">
                    <div>
                        <select style="width: 200px;" class="form-select" name="type" onchange=attach(); required>
                        <option value="n">공지사항</option>
                        <option value="c">커뮤니티</option>
                        <option value="g">갤러리</option>
                        </select>
                    </div>
                    <div id="title"><input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" required></div>
                    
               </div>
                <div id="content-box">
                    <div id="content">
                        <textarea style="width: 100%; height: 100%;"name="content" style="width:650px; height:350px;" required></textarea>
                       
                    </div>
                    <div id="footer">
                        <div id="attach"><input type="file" name="file" multiple></div>
                        <div id="buttonArea"><button type="submit" class="btn" id="regist">등록하기</button></div>
                    </div>

                </div>

                
            </form>
                
            </div>
            
 
            
        </main>
    </div>
   
    <script>
        //커뮤니티, 갤러리 선택 시 사진만 첨부 가능하게 함
        function attach(){
            const select = document.querySelector("select[name=type]").value;
            const attachArea = document.querySelector("#attach");
            console.log(select);
            if(select == 'g' || select == 'c'){
                attachArea.innerHTML = '<input type="file" accept=".gif, .jpg, .png" name="file" multiple>';
            }else{
                attachArea.innerHTML = '<input type="file" name="file" multiple>';
            }

        }
        
       
    </script>
    




</body>
</html>