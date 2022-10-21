<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #psn-all-zone {
        float: left;
        margin-left: 50px;
        display: block;
    }
    #psn-area {
        padding-top: 50px;
        width: 300px;
        margin: 0 auto;
    }
    #mp-profile-out {
        width: 300px;
        height: 500px;
        padding-top: 25px;
        padding-left: 25px;
        background-color: #5D736F;
        border-radius: 20px;
        margin-top: 50px;
        margin-bottom: 30px;
    }
    #mp-profile-in {
        width: 250px;
        height: 450px;
        background-color: white;
        padding-top: 40px;
        padding-bottom: 20px;
        border-radius: 5px;
    }
    #mp-profile-img {
        margin: 0 auto;
        width: 180px;
        height: 180px;
        border-radius: 100px;
        background-color: white;
        margin-bottom: 50px;
        overflow: hidden;
    }
    #mp-profile-img > img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #mp-profile-tag {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 50px;
    }
    #mp-profile-dept {
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    #mp-profile-email {
        text-align: center;
        font-size: 15px;
    }
    .checkmine-btn {
        background-color: #5D736F;
        color: white;
        border-radius: 7px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 3px;
        padding-top: 3px;
    }
    .checkmine-btn:hover {
        background-color: #72918b;
    }
    #psn-left-out {
        width: 156px;
        height: 686px;
        padding-left: 18px;
        padding-top: 18px;
        background-color: #B0D9D1;
        border-radius: 20px;
        margin-top: 50px;
        margin-bottom: 30px;
    }
    #psn-left-in {
        width: 120px;
        height: 650px;
        background-color: white;
        padding-top: 50px;
        padding-bottom: 20px;
        border-radius: 5px;
        text-align: center;
        font-size: 20px;
    }
    #psn-right-out {
        width: 886px;
        height: 686px;
        padding-left: 18px;
        padding-top: 18px;
        background-color: #CFFFF6;
        border-radius: 20px;
        margin-top: 50px;
        margin-bottom: 30px;
    }
    #psn-right-in {
        width: 850px;
        height: 650px;
        background-color: white;
        padding-top: 50px;
        padding-left: 25px;
        padding-bottom: 20px;
        border-radius: 5px;
        font-size: 20px;
    }
    #margin-btm {
        margin-bottom: 30px;
    }
</style>
</head>
<body>
    <div id="personal-content">
        <div id="psn-all-zone">
            <div id="psn-area">
                <div id="mp-profile-out">
                    <div id="mp-profile-in">
                        <div id="mp-profile-img">
                            <img src="${imgPath}/none-profile.jpg">
                        </div>
                        <div id="mp-profile-tag">
                            ${loginMember.name}
                        </div>
                        <div id="mp-profile-dept">
                            ${loginMember.deptNo} ${loginMember.posNo}
                        </div>
                        <div id="mp-profile-email">
                            ${loginMember.email}
                        </div>
                    </div>
                </div>
                <button class="btn checkmine-btn" style="margin-left: 90px;"  data-bs-toggle="modal" data-bs-target="#changeImg">사진 변경 신청</button>
            </div>
        </div>
        <div id="psn-all-zone">
            <div id="psn-left-out">
                <div id="psn-left-in">
                    <div id="margin-btm">
                        아이디
                    </div>
                    <div id="margin-btm">
                        비밀번호
                    </div>
                    <div id="margin-btm">
                        전화번호
                    </div>
                    <div style="margin-bottom: 90px;">
                        주소
                    </div>
                    <div id="margin-btm">
                        입사일
                    </div>
                </div>
            </div>
        </div>
        <div id="psn-all-zone" style="margin-left: 20px;">
            <div id="psn-right-out">
                <div id="psn-right-in">
                    <div id="margin-btm">
                        ${loginMember.id}
                    </div>
                    <div id="margin-btm">
                        <button class="btn checkmine-btn" data-bs-toggle="modal" data-bs-target="#changePwd">비밀번호 변경</button>
                    </div>
                    <div id="margin-btm">
                        ${loginMember.phone}
                    </div>
                    <div style="margin-bottom: 15px;">
                    	<c:if test="${not empty loginMember.address}">
                        	${loginMember.address}
                    	</c:if>
                    	<c:if test="${empty loginMember.address}">
                        	-
                    	</c:if>
                    </div>
                    <div style="margin-bottom: 45px;">
                        <c:if test="${not empty loginMember.addressDetail}">
                        	${loginMember.addressDetail}
                    	</c:if>
                    	<c:if test="${empty loginMember.addressDetail}">
                        	-
                    	</c:if>
                    </div>
                    <div style="margin-bottom: 100px;">
                        ${fn:substring(loginMember.enrollDate,0,10)} (0년 0개월차)
                    </div>
                    <div>
                    	<button class="btn checkmine-btn" data-bs-toggle="modal" data-bs-target="#changeInfo">개인정보 수정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/member/pwd-modal.jsp" %>
    <%@ include file="/WEB-INF/views/member/img-modal.jsp" %>
    <%@ include file="/WEB-INF/views/member/info-modal.jsp" %>
</body>
</html>