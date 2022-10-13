<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 사원관리</title>
<style>


    main > div, main > form > div {
        width: 1389px;
        margin: 10px auto;
    }
    
    #area{
        height: 130px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }
    #infoWrap{
        height: 596px;
        border: 1px solid lightgray;
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
        width: 1350px;
        height: 570px;
        margin: auto;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(5, 1fr) 2fr;
    }
    
    #memberInfo > div:not(#modify){
        font-size: 20px;
        margin: 0 auto;
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
        font-size: 20px;
        font-weight: bolder;
    }
    #profileImg{
        background-color: #C4F2EA;
        width: 317px;
        height: 284px;
        grid-row: span 4;
    }
 
    #imgArea > img{
        display: block;
        margin: 20px auto;
    }
    #photo{
        padding-left: 40px;
        width: 300px;
    }
    #modify{
        grid-column: span 3;
        text-align: right;
        color: lightgray;
        font-size: 18px;
        padding-right: 5px;
    }
    input[type="checkbox"]{
        margin-right: 20px;
    }

    select {
        width: 219px;
        height: 36px;
    }
    #checkDup{
        background-color: #C4F2EA;
        border: 1px solid lightgrey;
        margin-left: 5px;
    }

    
    
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <form action="" method="post" enctype="multipart/form-data">
            <div id="area">
                <div>
                    <button onclick="history.back()">←</button>
                    <span id="header">&nbsp;&nbsp;상세보기</span>
                </div>
                
                <button type="submit" class="btn">수정하기</button>
            </div>
            
                <div id="infoWrap">
                    <div id="memberInfo">
                    <div id="modify">수정일자 2022.10.13</div>
                    
                        <div id="profileImg">
                            <div id="imgArea">
                                <img src="${root}/resources/img/admin/user-icon-thum.png" alt="기본이미지" id="reviewImg"style="width: 200px; height: 200px; border-radius: 50%;">
                            </div>
                            <input type="file" name="photo" id="photo" onchange="review()">
                        </div>
                        
                        <div class="inputField" style="grid-column: 2;"><label>이름</label><input type="text" name="name" id="name"  value="aaa" required></div>
                        <div class="inputField" style="grid-column: 2;"><label>부서</label>
                          <select name="position">
                            <option>사원</option>
                            <option selected>주임</option>
                            <option>대리</option>
                            <option>과장</option>
                          </select>
                        </div>
                        <div class="inputField" style="grid-column: 2;"><label>직위</label>
                            <select name="department">
                            <option>인사부</option>
                            <option selected>총무부</option>
                      
                            </select>
                        </div>
                        <div class="inputField" style="grid-column: 2; margin-right: 85px;"><label>아이디</label><input type="text" name="id" id="memberId" value="aaa" readonly></div>
                        <input type="hidden" value="X" id="dup">
                        <div class="inputField" style="grid-column: 3; grid-row: 2;"><label>주소</label><input type="text" name="address" value="aaa"></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 3; margin-right: 90px;"><label>상세주소</label><input type="text" name="addressDetail" value="aaa"></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 4; margin-right: 90px;"><label>전화번호</label><input type="text" name="phone" id="" value="" required></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 5; margin-right: 90px;"><label>이메일</label><input type="text" name="email" id="email" value="aaa@@"readonly></div>
                        <div class="inputField" style="margin-left: 150px;"><label>권한</label>
                            <br><input type="checkbox" name="N" id=""><label style="font-weight: normal;">공지 등록</label>
                            <br><input type="checkbox" name="R" id=""><label style="font-weight: normal;">장비/장소 예약 승인</label>
                            <br><input type="checkbox" name="H" id=""><label style="font-weight: normal;">인사 관리</label>
                        </div>
                        <div class="inputField" style="margin-top:50px;"><label>입사일</label><input type="date" name="enrollDate" value="" readonly></div>
                        <div class="inputField" style="margin-top:50px;"><label>퇴사일</label><input type="date" name="resignDate"></div>
                    </div>
                    
                </div>
        </form>
            
        </main>
    </div>

    <script>
        //프로필 이미지 미리보기
       function review(){
            const photo = document.querySelector('#photo');
            const reviewImg = document.querySelector('#reviewImg');
            
            if(photo.files.length > 0){
                const fr = new FileReader();
                fr.onload = function(data){
                    console.log(data);
                    reviewImg.src = data.target.result;
                }
                fr.readAsDataURL(photo.files[0]); 
            }else{
                imgTag.src = "";
            }
       }


    </script>
</body>
</html>