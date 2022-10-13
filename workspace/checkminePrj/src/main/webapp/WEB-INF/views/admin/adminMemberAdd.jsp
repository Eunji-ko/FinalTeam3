<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 사원관리</title>
<style>


    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
    #area{
        height: 130px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }
    #area button:first-child{
        width: 20px; 
        height: 20px; 
        border: none; 
        background-color: white;
        font-size: 20px;
        font-weight: bolder;
    }


    #memberInfo {
        height: 596px;
        margin: 20px auto;
        border: 1px solid lightgray;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(5, 1fr) 2fr;
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
    label{
        margin-right: 15px;
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
                    <span id="header">&nbsp;&nbsp;사원 등록</span>
                </div>
                
                <button type="button" class="btn">등록하기</button>
            </div>
			
            <div id="memberInfo">
                <div id="modify">수정일 2022.10.13</div>
                <div id="profileImg">
                    <div id="imgArea">
                        <img src="" alt="">
                    </div>
                    <input type="file" name="" id="">
                </div>
                <div class="inputField"><label>이름</label><input type="text" name="name" id="name"></div>
                <div class="inputField"><label>부서</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>직위</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>아이디</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>주소</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>상세주소</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>전화번호</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>이메일</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>권한</label><input type="text" name="" id=""></div>
                <div class="inputField"><label>입사일</label><input type="date" name="enrollDate" id=""></div>
                <div class="inputField"><label>퇴사일</label><input type="date" name="quit" id=""></div>

                
            </div>
            
        </main>
    </div>
</body>
</html>