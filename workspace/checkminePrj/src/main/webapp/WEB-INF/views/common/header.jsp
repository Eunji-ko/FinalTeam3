<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
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
</head>
<body>
    <header class="d-flex " style="width: 100%; height: 140px;">
        <div style="width: 270px;" class="ms-5"></div>

        <!-- 체크마인 로고 TODO: 홈경로 설정-->
        <div id="logo" class="m-auto">
            <a href="홈경로"><img src="/checkmine/resources/img/header/logo.png"></a>
        </div>
        
        <!-- 알림, 설정메뉴 TODO: 설정메뉴 경로 설정-->
        <div class="d-flex h-100 align-items-center justify-content-between me-5" style="width:340px">
        
        	<!-- 메일 TODO:메일경로-->
        	<a href="메일경로"><img src="/checkmine/resources/img/header/mail-icon.png"></a>
        
            <!-- 알림 TODO:경로처리 갯수 처리, 배지 -->
            <div class="dropdown">
                <a class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/checkmine/resources/img/header/notification-bell.png">
                    <span class="position-absolute top-0 start-70 translate-middle badge rounded-pill bg-danger">
					    1
					    <span class="visually-hidden">unread messages</span>
					</span>
                </a>
                <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton1" style="width: 560px;">
                    <h5 class="fw-bold" style="margin-bottom: 25px;">알림 목록</h5>

                    <!-- TODO: 경로, 정보 -->
                    <li class="d-flex align-items-center"><a class="dropdown-item" href="목표경로" style="width: 95%;">
                        <span>[메일]000님이 메일을 보냈습니다.</span>
                        <span style="font-size: 10px;">2022.02.03 22:10</span>
                        <span><a href="삭제경로" style="margin-left: 10px"><img src="/checkmine/resources/img/header/X.png"></a></span>
                        
                    </a></li>
                    <hr>
                </ul>
            </div>

            <!-- 설정 -->
            <div><a href="설정경로">
                <img src="/checkmine/resources/img/header/cogwheel-button-.png">
            </a></div>

            <!-- 사용자 TODO: 프로필 이미지 처리, 사용자 이름 처리-->
            <div class="d-flex align-items-center justify-content-between" style="width: 110px; margin-left: 30px;">
                <div style="width: 40px; height: 40px;">
                    <img src="/checkmine/resources/img/header/profile.png">
                </div>
                <span class="fs-5 fw-bold">테스트</span>
            </div>
        </div>
    </header>


</body>

</html>