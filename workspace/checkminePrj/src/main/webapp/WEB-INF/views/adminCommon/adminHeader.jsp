<%@page import="com.kh.checkmine.admin.vo.AdminVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
    <c:set var="msg" value="${sessionScope.msg}"/>
	<c:remove var="msg" scope="session"/>

	<c:if test="${not empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>

  
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        @import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
        * { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
    	
        nav{
            background-color: #B0D9D1;
            width: 310px;
            height: 850px;
            margin-top: 20px;
            margin-right: 60px;
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
        }
        main{
            width: 1520px;
            height: 880px;
            border: 1px solid #CECECE;
            margin-bottom: 20px;
            flex: none;
        }

        nav{
            padding: 70px;
        }

        nav a{
            font-size: 25px;
            text-decoration: none;
            color: #293533;
            margin-bottom: 3rem;

        }

        nav a:hover{
            color: #ffffff;
        }
        .side-nav-selected{
            color: #ffffff;
        }
        .side-nav-home{
            font-size: 25px;
            text-decoration: none;
            font-weight: bold;
            color: #000000;
            margin-bottom: 4rem;
        }
        #profileImg > img {
            width: 100%;
        }


    </style>
</head>
<body>
    <header class="d-flex " style="width: 1920px; height: 140px;">
        <div style="width: 270px;" class="ms-5"></div>

        <!-- 체크마인 로고 TODO: 홈경로 설정-->
        <div id="logo" class="m-auto">
            <a href="${root}/admin/main"><img src="${root}/resources/img/header/logo.png"></a>
        </div>
        
        <!-- 설정메뉴 TODO: 설정메뉴 경로 설정-->
        <div class="d-flex h-100 align-items-center justify-content-between me-5" style="width:200px">
    
            <!-- 설정 -->
            <div><a href="설정경로">
                <img src="${root}/resources/img/header/cogwheel-button-.png">
            </a></div>

            <!-- 사용자 TODO: 프로필 이미지 처리, 사용자 이름 처리-->
            <div class="d-flex align-items-center justify-content-between" style="width: 110px; margin-left: 30px;">
                <div style="width: 40px; height: 40px; border-radius: 50%;" id="profileImg">
                    <img src="${root}/resources/img/admin/adminProfile.png">
                </div>
                <span class="fs-5 fw-bold">${loginAdmin.name}</span>
            </div>
        </div>
    </header>


</body>
<script>
		service();

    	function service(){
    		let loginAdmin = "${loginAdmin}";
    		if (loginAdmin == ""){
    			alert("로그인 후 이용하실 수 있습니다.");
    			location.href="${root}/admin/login";
    		} 
    	}
    </script>

</html>