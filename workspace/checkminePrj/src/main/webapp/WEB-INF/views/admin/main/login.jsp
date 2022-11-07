<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:set var="msg" value="${sessionScope.msg}"/>
	<c:remove var="msg" scope="session"/>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${not empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	
<html>
<head>
	 <title>CHECKMINE 관리자 로그인</title>
	    
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <style>
        @font-face {
            font-family: 'SDSamliphopangche_Basic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Basic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        
        *{
            box-sizing: border-box;
            border: none;
        }
   
        #pageWrap{
            width: 1920px;
            height: 1080px;
            background-color: #91b3ac;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #background{
            width: 1373px;
            height: 839px;
            background-color: white;
            border-radius: 30px;
            display: grid;
            grid-template-columns: 1fr 4fr 4fr 1fr;
        }

        #logo{
            grid-column: 2;
            margin: auto;
        }

        #login-form{
            margin: auto;
        }

        input:focus{
            outline: none;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px #B6CED9 inset;
        }

        .input-box {
            width: 327px;
            height:39px;
            background-color: #B6CED9;
            border-radius: 50px;
            margin: 10px auto;
        }

        .input-box *{
            margin-left: 15px;
            line-height: 35px;
            border: none;
            background-color: #B6CED9;
        }

        .input-box > input{
            width: 260px;
        }

        input[type="submit"]{
            width: 327px;
            height: 49px;
            color: white;
            background-color: #326A60;
            border-radius: 50px;
            font-weight: bolder;
            font-size: 20px;
        }

        #subText{
            font-size: 20px;
            font-weight: bolder;
            color: #326A60;
            text-align: end;
        }

        #mainText{
            font-size: 50px;
            font-weight: bolder;
            font-family: 'SDSamliphopangche_Basic';
            text-align: center;
        }

        #bottom{
            text-align: center;
        }
    
        #userLogin{
            font-weight: bolder;
            color: #326A60;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div id="pageWrap">
	    <div id="background">
	        <div id="logo">
	            <img src="${root}/resources/img/admin/checkLogo.png" alt="로고" width="250px">
	        </div>
	        <div id="login-form">
	       		<div id="subText">ADMIN</div>
	            <div id="mainText">CHECKMINE</div>
	            <form action="${root}/admin/login" method="post" name="form" onSubmit="return Checkform();">
	                <div class="input-box">
                        <img src="${root}/resources/img/admin/free-icon-user-2549965 1.png" alt="유저아이콘" width="20px">
                        <input type="text" name="id" placeholder="아이디">
                    </div>
	                <div class="input-box">
                        <img src="${root}/resources/img/admin/free-icon-password-7817000 1.png" alt="잠금아이콘" width="20px">
                        <input type="password" name="pwd" placeholder="비밀번호" autocomplete="off">
                    </div>
	                <input type="submit" value="로그인">
	            </form>
	            <div id="bottom"><a href="${root}" id="userLogin">사용자로 로그인</a></div>
	        </div>
	    </div>
    </div>
    <script>
        //필수 입력값 확인
        function Checkform(){
            if(form.id.value == "") {
                form.id.focus();
                alert("아이디를 입력해주세요.");
                return false;
            }else if(form.pwd.value == ""){
                alert("비밀번호를 입력해주세요.");
                return false;
            }
        }
    </script>
</body>
</html>