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
        font-weight: 500;
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

                <div id="">
                    
                </div>
            </div>
        </main> 
    </div>
</body>
</html>