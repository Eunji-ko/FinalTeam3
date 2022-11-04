<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <meta charset="UTF-8">
    <style>
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
            min-height: 880px;
            border: 1px solid #CECECE;
            margin-bottom: 20px;
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
        #side-nav-home{
            font-size: 25px;
            text-decoration: none;
            font-weight: bold;
            color: #000000;
            margin-bottom: 5rem;
        }


    </style>
    <!-- 제이쿼리 -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    
    <c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
	<c:remove var="alertMsg" scope="session"/>

	<c:if test="${not empty alertMsg}">
		<script>
			alert('${alertMsg}');
		</script>
	</c:if>
</head>
<body>
    <header class="d-flex " style="width: 100%; height: 140px;">
        <div style="width: 270px;" class="ms-5"></div>

        <div id="logo" class="m-auto">
            <a href="${rootPath}/member/main"><img src="/checkmine/resources/img/header/logo.png"></a>
        </div>
        
        <!-- 알림, 설정메뉴 TODO: 설정메뉴 경로 설정-->
        <div class="d-flex h-100 align-items-center justify-content-between me-5" style="width:340px">
        
        	<a href="${rootPath}/mail/receive"><img src="/checkmine/resources/img/header/mail-icon.png"></a>
        
            <div class="dropdown">
                <a class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/checkmine/resources/img/header/notification-bell.png">
                    <span class="position-absolute top-0 start-70 translate-middle badge rounded-pill bg-danger" id="badge">
					    ${alarmSum}
                        <c:if test="${alarmSum eq null}">
                            0
                        </c:if>
					</span>
                </a>
                <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton1" style="width: 560px;">
                    <h5 class="fw-bold" style="margin-bottom: 25px;">알림 목록</h5>

                    <c:forEach items="${alarmList}" var="list">
                        <div id="list-div${list.no}">
                            <li class="d-flex align-items-center">
                                <a class="dropdown-item" href="${rootPath}/${list.url}" onclick="readAlarm('${list.no}');" style="width: 95%;">
                                    <span>[${list.type}]${list.content}</span>
                                    <span style="font-size: 10px;">${list.time}</span>
                                    <span><a type="button" onclick="deleteAlarm('${list.no}');" style="margin-left: 10px"><img src="/checkmine/resources/img/header/X.png"></a></span>
                                </a>
                            </li>
                            <hr>
                        </div>
                    </c:forEach>
                    <div id="no-alarm" hidden>
                        <li class="d-flex align-items-center">
                            <a class="dropdown-item" href="#" style="width: 95%;">
                                <span>새로운 알람이 없습니다.</span>
                            </a>
                        </li>
                        <hr>
                    </div>
                    <c:if test="${alarmSum eq 0}">
                        <li class="d-flex align-items-center">
                            <a class="dropdown-item" href="#" style="width: 95%;">
                                <span>새로운 알람이 없습니다.</span>
                            </a>
                        </li>
                        <hr>
                    </c:if>
                </ul>
            </div>

            <!-- 설정 -->
            <div><a href="${rootPath}/설정경로">
                <img src="/checkmine/resources/img/header/cogwheel-button-.png">
            </a></div>

            <!-- 사용자 TODO: 프로필 이미지 처리, 사용자 이름 처리-->
            <div class="d-flex align-items-center justify-content-between" style="width: 110px; margin-left: 30px;">
                <div style="width: 40px; height: 40px;">
                    <img src="/checkmine/resources/img/header/profile.png">
                </div>
                <span class="fs-5 fw-bold">${loginMember.name}</span>
            </div>
        </div>
    </header>

    <script>

        function deleteAlarm(param){
            $.ajax({
                url : "${rootPath}/alarm/delete",
  				type : "GET",
  				data : {'no' : param},
  				dataType : 'text',
  				success : function(data){
                   if(data == 'fail'){
                    alert('알림 삭제에 실패하였습니다.');
                   }else{
                    $('#list-div' + param).hide();
                    var preSum = Number(document.querySelector('#badge').innerHTML);
                    document.querySelector('#badge').innerHTML = preSum - 1;
                    if(Number(document.querySelector('#badge').innerHTML) == 0){
                        $('#no-alarm').prop('hidden', false);
                    }
                   }
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
            });
        }

        function readAlarm(param){
            $.ajax({
                url : "${rootPath}/alarm/read",
  				type : "GET",
  				data : {'no' : param},
  				dataType : 'text',
  				success : function(data){
                   if(data == 'fail'){
                    alert('알림 처리에 실패하였습니다.');
                   }
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
            });
        }

        

    </script>


</body>

</html>