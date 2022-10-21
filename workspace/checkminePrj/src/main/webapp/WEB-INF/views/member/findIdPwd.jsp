<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
	<c:remove var="alertMsg" scope="session"/>

	<c:if test="${not empty alertMsg}">
		<script>
			alert('${alertMsg}');
		</script>
	</c:if>
<html>
<head>
	 <title>CHECKMINE 아이디/비밀번호 찾기</title>
	    
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
        
        #findIdPwd{
        	color: gray;
        }


        
    </style>
</head>
<body>
   <div id="pageWrap">
	    <div id="background">
	        <div>
	        
	        	<%@ include file="/WEB-INF/views/member/find-content.jsp" %>
	
	        </div>
	    </div>
    </div>
    
</body>
</html>