<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<c:set var="m" value="${memberVo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 사원정보</title>
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
        width: 200px; 
        height: 200px; 
        border-radius: 50%;
        object-fit: cover;
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
            <form action="${root}/admin/member/edit/${m.no}" method="post" name="form" enctype="multipart/form-data" onsubmit="return check();">
                <div id="area">
                    <div>
                        <button type="button" onclick="history.back()">←</button>
                        <span id="header">&nbsp;&nbsp;상세보기</span>
                    </div>
                    <button type="submit" class="btn">수정하기</button>
                </div>
            
                <div id="infoWrap">
                    <div id="memberInfo">
                        <div id="modify">
                            <c:if test="${m.modifyDate ne null}">수정일자 ${m.modifyDate}</c:if>
                        </div>
                        <div id="profileImg">
                            <div id="imgArea">
                                <c:choose>
                                    <c:when test="${empty m.photoName}">
                                        <img src="${root}/resources/img/admin/user-icon-thum.png" alt="기본이미지" class="reviewImg">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${root}/resources/upload/profile/${m.photoName}" alt="프로필" class="reviewImg">
                                        <input type="hidden" name="photoName" value="${m.photoName}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <input type="file" name="profile" id="photo" onchange="review()">
                        </div>
                            
                        <div class="inputField" style="grid-column: 2;">
                            <label>이름</label>
                            <input type="text" name="name" id="name"  value="${m.name}"><p id="nameCheck"></p>
                        </div>
                        <div class="inputField" style="grid-column: 2;">
                            <label>부서</label>
                            <select name="posNo">
                                <c:forEach items="${pos}" var="p">
                                    <c:choose>
                                        <c:when test="${p.no eq m.posNo}">
                                            <option value="${p.no}" selected>${p.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${p.no}">${p.name}</option>                          	
                                        </c:otherwise>                          
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="inputField" style="grid-column: 2;">
                            <label>직위</label>
                            <select name="deptNo">
                                <c:forEach items="${dept}" var="d">
                                    <c:choose>
                                        <c:when test="${d.no eq m.deptNo}">
                                            <option value="${d.no}" selected>${d.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${d.no}">${d.name}</option>                          	
                                        </c:otherwise>                          
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="inputField" style="grid-column: 2; margin-right: 70px;">
                            <label>아이디</label>
                            <input type="text" name="id" id="memberId" value="${m.id}" readonly>
                        </div>
                        
                        <div class="inputField" style="grid-column: 3; grid-row: 2;">
                            <label>주소</label>
                            <input type="text" name="address" value="${m.address}" id="address_kakao">
                        </div>
                        <div class="inputField" style="grid-column: 3; grid-row: 3; margin-right: 75px;">
                            <label>상세주소</label>
                            <input type="text" name="addressDetail" value="${m.addressDetail}">
                        </div>
                        <div class="inputField" style="grid-column: 3; grid-row: 4; margin-right: 75px;">
                            <label>전화번호</label>
                            <input type="text" name="phone" value="${m.phone}" oninput="autoHyphen(this);" maxlength="13"><p id="phoneCheck"></p>
                        </div>
                        <div class="inputField" style="grid-column: 3; grid-row: 5; margin-right: 75px;">
                            <label>이메일</label>
                            <input type="text" name="email" id="email" value="${m.email}" readonly>
                        </div>
                        <div class="inputField" style="margin-left: 150px;">
                            <label>권한</label><br>
                            <c:choose>
                                <c:when test="${fn:contains(m.permission, 'N')}">
                                    <input type="checkbox" name="permission" value="N" checked>
                                    <label style="font-weight: normal;">공지 등록</label>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="permission" value="N">
                                    <label style="font-weight: normal;">공지 등록</label>
                                </c:otherwise>
                            </c:choose>
                            <br>
                            <c:choose>
                                <c:when test="${fn:contains(m.permission, 'R')}">
                                    <input type="checkbox" name="permission" value="R" checked>
                                    <label style="font-weight: normal;">장비/장소 예약 승인</label>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="permission" value="R">
                                    <label style="font-weight: normal;">장비/장소 예약 승인</label>
                                </c:otherwise>
                            </c:choose>
                            <br>
                            <c:choose>
                                <c:when test="${fn:contains(m.permission, 'H')}">
                                    <input type="checkbox" name="permission" value="H" checked>
                                    <label style="font-weight: normal;">인사 관리</label>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="permission" value="H">
                                    <label style="font-weight: normal;">인사 관리</label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="inputField" style="margin-top:70px;">
                            <label>입사일</label>
                            <input type="date" name="enrollDate" value="${m.enrollDate}" readonly>
                        </div>
                        <div class="inputField" style="margin-top:70px; margin-right: 75px;">
                            <label>퇴사일</label>
                            <input type="date" name="resignDate" value="${m.resignDate}">
                        </div>
                    </div>  
                </div>
            </form>
        </main>
    </div>

    <!-- 카카오 주소 입력 적용-->
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
            const reviewImg = document.querySelector('.reviewImg');
            
            if(photo.files.length > 0){
                const fr = new FileReader();
                fr.onload = function(data){
                    reviewImg.src = data.target.result;
                }
                fr.readAsDataURL(photo.files[0]); 
            }else if('${m.photoName}' == ""){
                reviewImg.src = "${root}/resources/img/admin/user-icon-thum.png";
            }else{
                reviewImg.src = "${root}/resources/upload/profile/${m.photoName}";
            }
        }

        //폼 필수 입력값 체크
        function check(){
            document.querySelectorAll("p").forEach(node => node.innerHTML = "");

            if(form.name.value == "" || form.phone.value == ""){
                if(form.name.value == ""){
                    document.getElementById('nameCheck').innerHTML = "이름을 입력해주세요."
                }
                if(form.phone.value == ""){
                    document.getElementById('phoneCheck').innerHTML = "전화번호를 입력해주세요."
                }
                return false;
            }
        }
       
        //전화번호 '-' 삽입
        const autoHyphen = (target) => {
            target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }
    </script>
</body>
</html>