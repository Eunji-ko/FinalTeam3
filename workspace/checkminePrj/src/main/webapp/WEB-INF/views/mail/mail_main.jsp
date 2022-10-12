<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckMine - mail</title>


<style type="text/css">
    
	main{
		padding: 25px 18px 40px 51px;
	}

    #container-header>span{
        font-size: 30px;
        font-weight: 400;
    }
    #container-header>div{
        width: 510px;
        height: 36px;
        border: 1px solid #cdcdcd;
        border-radius: 18px;
        display: flex;
        align-items: center;
        padding: 3px 10px 0px 10px;
        margin-left: 100px;
    }
    #container-header>div>input{
        margin-left: 7px;
        flex-grow: 1;
        border: none;
        outline: none;
    }

    #container-nav{
        width: 170px;
        height: 740px;
        border: none;
        background-color: #c4f2ea;
        border-radius: 5px;
        margin-right: 20px;
    }

    /* 메일쓰기 버튼 */
    #container-nav>div{
        width: 104px;
        height: 46px;
        background-color: #cffff6;
        border-radius: 10px;
        margin: 19px 33px 29px 33px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0px 4px 5px 0px rgb(141, 161, 155);
    }
    #container-nav>div:active{
        box-shadow: 0px 1px 5px 0px rgb(141, 161, 155);
    }
    #container-nav>div>span{
        font-size: 15px;
    }

    /* 메일네비 목록 */
    #container-nav>ul{
        list-style: none;
        padding-left: 22px;
    }
    #container-nav li{
        font-size: 15px;
        margin-bottom: 16px;
    }
    #container-nav li a{
        text-decoration: none;
        color: #000000;
    }
    #container-nav li span{
        margin-left: 28px;
        color: #494949;
    }

    /* 선택된 목록 */
    .container-nav-selected{
        width: 163px;
        height: 24px;
        border-radius: 12px;
        background-color: #b0d9d1;
        margin-left: -31px;
        box-shadow: 0px 4px 5px 0px rgb(141, 161, 155);
    }
    .container-nav-selected>a{
        margin-left: 31px;
    }
   
    /* 메일 체크박스 옆 드롭다운 */
    .dropdown{
        position : relative;
        display : inline-block;
    }
    .dropbtn{
        display: inline-block;
        display: flex;
        width: 20px;
        height: 20px;
        margin-top: 5px;
    }
    .dropbtn>img{
        margin: auto;
    }
    .dropdown-content{
        display : none;
        position : absolute;
        z-index : 1; /*다른 요소들보다 앞에 배치*/
        width: 100px;
        height: 75px;
        border: 1px solid #cdcdcd;
        border-radius: 5px;
        background-color: white;
    }
    .dropdown-content a{
        display : block;
        text-decoration: none;
        border-bottom: 1px solid #cdcdcd;
        color: #000;
    }
    .dropdown-content>a:last-child{
        border: none;
    }
    
    .dropdown:hover .dropdown-content {
        display: block;
    }
    #mid-nav>*{
        margin-left: 14px;
    }
    #mid-nav>input[type="checkbox"]{
        margin-top: 4px;
    }

	
</style>

<c:set var="imgPath" value="/checkmine/resources/img/mail"/>

</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="container-header" class="d-flex align-items-center">
                <span style="font-size: 30px;">메일</span>
                <div>
                    <img src="${imgPath}/mail_search.png">
                    <input type="text" placeholder="메일검색">
                </div>
            </div>

            <hr style="height: 2px;">

            <div class="d-flex" style="padding-top: 8px;">
                <div id="container-nav">
                    <div>
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
                        <li><div class="container-nav-selected"><a href="">받은편지함</a><span>21</span></div></li>
                        <li><div><a href="">보낸편지함</a><span>21</span></div></li>
                        <li><div><a href="">중요편지함</a><span>21</span></div></li>
                        <li><div><a href="">임시보관함</a><span>21</span></div></li>
                        <li><div><a href="">휴지통</a></div></li>
                        <li><div><a href="">주소록</a></div></li>
                    </ul>
                </div>

                <div>
                    <div>받은편지함</div>

                    <div class="d-flex" style="width: 1258px;" id="mid-nav">
                        <!-- 전체 체크박스 -->
                        <input type="checkbox" name="checkbox-all" class="align-self-center" style="width: 20px; height: 20px;">
                        
                        <!-- 드롭다운 -->
                        <div class="dropdown">
                            <span class="dropbtn"><img src="${imgPath}/mail_arrow.png"></span>
                            <div class="dropdown-content">
                                <a href="읽은메일 조회">읽은메일</a>
                                <a href="안읽은메일 조회">안읽은메일</a>
                                <a href="중요메일 조회">중요메일</a>
                            </div>
                        </div> 

                        <!-- 휴지통으로 보내기 -->
                        <a href="메일 삭제" class="flex-grow-1"><img src="${imgPath}/trash_icon.png"></a>
                        
                        <!-- 페이지네이션 -->
                        <span>1 page</span>
                        <a href="메일 리스트 이전 페이지"><img src="${imgPath}/mail_arrow_pre.png"></a>
                        <a href="메일 리스트 다음 페이지"><img src="${imgPath}/mail_arrow_next.png"></a>
                    </div>
                </div>
            </div>
        </main> 
    </div>
</body>
</html>