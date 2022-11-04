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
    #checkDupBtn{
        background-color: #C4F2EA;
        border: 1px outset #C4F2EA;
        margin-left: 5px;
        font-size: 17px;
        width: 50px;
        height: 40px;
    }
    input[type=text], select, input[type=date], input[type=password]{
        font-size: 17px;
        height: 40px;
        width: 250px;
    }
   
    p{
        text-align: right;
        font-size: 13px;
        color: red;
    }
   

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <form action="${root}/admin/member/add" method="post" name="form" enctype="multipart/form-data" onsubmit="return check();">
            <div id="area">
                <div>
                    <button onclick="history.back()">←</button>
                    <span id="header">&nbsp;&nbsp;사원 등록</span>
                </div>
                
                <button type="submit" class="btn">등록하기</button>
            </div>
            
                <div id="infoWrap">
                    <div id="memberInfo">
                    <div id="modify"></div>
                    
                        <div id="profileImg">
                            <div id="imgArea">
                                <img src="${root}/resources/img/admin/user-icon-thum.png" alt="기본이미지" id="reviewImg"style="width: 200px; height: 200px; border-radius: 50%;">
                            </div>
                            <input type="file" name="profile" id="photo" onchange="review()">
                        </div>
                        
                        <div class="inputField" style="grid-column: 2;"><label>이름</label><input type="text" name="name" id="name"><p id="nameCheck"></p></div>
                        <div class="inputField" style="grid-column: 2;"><label>부서</label>
                          
                            <select name="deptNo">
                                <c:forEach items="${dept}" var="d">
                            <option value="${d.no}">${d.name}</option>
                          </c:forEach>
                          </select>
                        </div>
                        <div class="inputField" style="grid-column: 2;"><label>직위</label>
                            <select name="posNo">
                            
                            <c:forEach items="${pos}" var="p">
                            	<option value="${p.no}">${p.name}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <div class="inputField" style="grid-column: 2; margin-right: 10px;"><label>아이디</label><input type="text" name="id" id="memberId" onchange="inputId();">
                            <button id="checkDupBtn" type="button" onclick="checkDup();">확인</button>
                        </div>
                        <input type="hidden" value="X" id="dup">
                        <div class="inputField" style="grid-column: 3; grid-row: 2;"><label>주소</label><input type="text" id="address_kakao" name="address"></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 3; margin-right: 75px;"><label>상세주소</label><input type="text" name="addressDetail"></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 4; margin-right: 75px;"><label>전화번호</label><input type="text" name="phone" oninput="autoHyphen(this);" maxlength="13"><p id="phoneCheck"></p></div>
                        <div class="inputField" style="grid-column: 3; grid-row: 5; margin-right: 75px;"><label>이메일</label><input type="text" name="email" id="email" readonly></div>
                        <div class="inputField" style="margin-left: 150px;"><label>권한</label>
                            <br><input type="checkbox" name="permission" value="n"><label style="font-weight: normal;">공지 등록</label>
                            <br><input type="checkbox" name="permission" value="r"><label style="font-weight: normal;">장비/장소 예약 승인</label>
                            <br><input type="checkbox" name="permission" value="h"><label style="font-weight: normal;">인사 관리</label>
                        </div>
                        <div class="inputField" style="margin-top:50px; margin-right: 70px;"><label>입사일</label><input type="date" name="enrollDate"><p id="enrollCheck"></p></div>
                        <div class="inputField" style="margin-top:50px; margin-right: 70px;"><label>비밀번호</label><input type="password" name="pwd" autoComplete="off"><p id="pwdCheck"></p></div>
                    </div>
                    
                </div>
        </form>
            
        </main>
    </div>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = function(){
            document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
                //카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                        document.getElementById("address_kakao").value = data.address; // 주소 넣기
                        document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
        </script>
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
                reviewImg.src = "${root}/resources/img/admin/user-icon-thum.png";
            }
       }

        //이메일을 아이디 + @checkmine.com으로 자동 설정, 중복 확인 전까지 X로
        function inputId(){
            document.querySelector('#dup').value = 'X';
            const id = document.querySelector('#memberId').value;
            document.querySelector('#email').value = id + '@checkmine.com';
        }

        function check(){
            document.querySelectorAll("p").forEach(node => node.innerHTML = "");

            //중복확인 체크
            if(document.querySelector('#dup').value == 'X' || form.id.value == ''){
                form.id.focus();
                alert("아이디 중복확인을 먼저해주세요.");
                return false;
            //필수 입력값 체크
            }else if(form.name.value == "" || form.phone.value == "" || form.enrollDate.value == "" || form.pwd.value.length < 4){
                if(form.name.value == ""){
                    document.getElementById('nameCheck').innerHTML = "이름을 입력해주세요."
                }
                if(form.phone.value == ""){
                    document.getElementById('phoneCheck').innerHTML = "전화번호를 입력해주세요."
                }
                if(form.enrollDate.value == ""){
                    document.getElementById('enrollCheck').innerHTML = "입사일을 입력해주세요."
                }
                if(form.pwd.value.length < 4){
                    document.getElementById('pwdCheck').innerHTML = "비밀번호는 최소 4자리 이상이어야 합니다."
                }
                return false;
            }
            

        }
    </script>
    <script>
        //아이디 중복확인 ajax
        function checkDup(){
            const dup = document.querySelector('#dup');
            const id = document.querySelector('#memberId').value;
            var idReg = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{4,14}$/g;

            if(id == null || id == ""){
                alert("아이디를 입력해주세요.");
                return;
            }else if( !idReg.test(id)) {
            alert("아이디는 영문자로 시작하는 5~15자 영문자+숫자 조합이어야 합니다.");
                return;
            }
            $.ajax({
                url : "${root}/admin/member/dup",
                type : "POST",
                data : {id : id},
                success : function(result){
                    if(result == 0){
                        alert("사용 가능한 아이디입니다.");
                        dup.value = 'O';
                    }else{
                        alert("사용 불가한 아이디입니다.");
                        dup.value = 'X';
                    }
                },
                error : function(){
                    alert("처리 중 문제가 발생하였습니다.");
                }
            });


        }

        //전화번호
    const autoHyphen = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }



    </script>
</body>
</html>