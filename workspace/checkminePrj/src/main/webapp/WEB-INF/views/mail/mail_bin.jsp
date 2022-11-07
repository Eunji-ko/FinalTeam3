<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckMine - 메일</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_basic.css">

<c:set var="imgPath" value="/checkmine/resources/img/mail"/>

<style>
    

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
   
    .dropdown:hover .dropdown-content {
        display: block;
    }
    #mid-nav>*{
        margin-left: 14px;
    }
    #mid-nav>input[type="checkbox"]{
        margin-top: 4px;
        width: 20px;
        height: 20px;
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
    .dropdown-content span{
        display : block;
        text-decoration: none;
        border-bottom: 1px solid #cdcdcd;
        color: #000;
    }
    .dropdown-content span:hover{
        background-color: #f0f0f0;
        cursor: pointer;
    }
    .dropdown-content>span:last-child{
        border: none;
    }
    #recycle-bin>img:hover{
        cursor: pointer;
    }

    /* 메일리스트 아이템 */

    .mail-list-item{
        display: flex; 
        align-items: center;
        height: 40px;
        text-decoration: none;
        color: #000000;
    }
    .mail-item.read a{
        background-color: #f8f8f8;
        color: #9a9a9a;
    }

    .mail-item.read a:hover{
        color: #000000;
        background-color: #f0f0f0;
    }
    .mail-list-item>input[type="checkbox"]{
        width: 20px;
        height: 20px;
        margin-left: 15px;
        margin-right: 25px;
    }
    .impbtn:hover{
        cursor: pointer;
    }
    #mail-list div{
        border-bottom: 1px solid #9a9a9a;
    }
    



</style>

</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="container-header" class="d-flex align-items-center">
                <span style="font-size: 30px;">메일</span>
                <div>
                    <img src="${imgPath}/mail_search.png">
                    <input type="text" placeholder="메일검색" onkeyup="if(window.event.keyCode==13){mailSearch(this);}">
                </div>
            </div>

            <hr style="height: 2px;">

            <div class="d-flex" style="padding-top: 8px;">
                <div id="container-nav">
                    <div onclick="location.href='/checkmine/mail/write'">
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

					<!-- 각 메일함마다 바꿔주기 -->
                    <ul>
                        <li><div><a href="/checkmine/mail/receive?p=1">받은편지함</a><span>${notReadCountReceive}</span></div></li>
                        <li><div><a href="/checkmine/mail/ref?p=1">참조편지함</a><span>${notReadCountRef }</span></div></li>
                        <li><div><a href="/checkmine/mail/send?p=1">보낸편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/imp?p=1">중요편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/save?p=1">임시보관함</a></div></li>
                        <li><div class="container-nav-selected"><a href="/checkmine/mail/bin?p=1">휴지통</a></div></li>
                        <li><div><a href="/checkmine/mail/addr?p=1">주소록</a></div></li>
                    </ul>
                </div>

                <div>
                    <div id="list-name" style="margin-left: 12px; margin-bottom: 3px;">휴지통</div> <!-- 편지함마다 바꾸기 -->

                    <div id="mid-nav" class="d-flex" style="width: 1258px;">
                        <!-- 전체 체크박스 -->
                        <input type="checkbox" name="checkbox-all" class="align-self-center" onclick="selectAll(this);">
                        
                        <!-- 드롭다운 -->
                        <div class="dropdown">
                            <span class="dropbtn"><img src="${imgPath}/mail_arrow.png"></span>
                            <div class="dropdown-content">
                                <span onclick="selectSome('read');">읽은메일</span>
                                <span onclick="selectSome('notRead');">안읽은메일</span>
                                <span onclick="selectSome('imp');">중요메일</span>
                            </div>
                        </div> 

                        <!-- 휴지통으로 보내기 -->
                        <span id="recycle-bin" class="flex-grow-1" ><img src="${imgPath}/trash_icon.png" onclick="gotoRecycleBin();"></span>
                        
                        <!-- 페이지네이션 -->
                        <span>${pageVo.currentPage } page</span>
                        <c:choose>
                        	<c:when test="${pageVo.currentPage eq '1'}">
                        		<a><img src="${imgPath}/mail_arrow_pre_blank.png"></a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="/checkmine/mail/receive?p=${pageVo.currentPage - 1}"><img src="${imgPath}/mail_arrow_pre.png"></a>
                        	</c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${pageVo.currentPage eq pageVo.maxPage}">
                        		<a><img src="${imgPath}/mail_arrow_next_blank.png"></a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="/checkmine/mail/receive?p=${pageVo.currentPage + 1}"><img src="${imgPath}/mail_arrow_next.png"></a>
                        	</c:otherwise>
                        </c:choose>
                    </div>

                    <!-- 메일 리스트 -->
                    <div id="mail-list" style="width: 1258px; margin-top: 19px;">
                        <div class="d-flex" style="padding-bottom: 10px; ">
                            <span style="margin-left: 59px; width: 257px;">보낸이</span>
                            <span style="width: 650px;">제목</span>
                            <span style="width: 235px;">시간</span>
                            <span>중요도</span> 
                        </div>
                        
                        <!-- 리스트 여기부터 받아오기 -->
                        <c:forEach items="${mailBinList}" var="item">
                        	<c:if test="${item.read eq 'N'}">
                        		<c:set var="read" value="notRead"/>
                        	</c:if>
                        	<c:if test="${item.read eq 'S'}">
                        		<c:set var="read" value="notRead"/>
                        	</c:if>
                        	<c:if test="${item.read eq 'Y'}">
                        		<c:set var="read" value="read"/>
                        	</c:if>
                        	<c:if test="${item.importance eq 'N'}">
                        		<c:set var="imp" value="notImp"/>
                        		<c:set var="impImgPath" value="${imgPath}/mail_star_blank.png"/>
                        	</c:if>
                        	<c:if test="${item.importance eq 'S'}">
                        		<c:set var="imp" value="notImp"/>
                        		<c:set var="impImgPath" value="${imgPath}/mail_star_blank.png"/>
                        	</c:if>
                        	<c:if test="${item.importance eq 'Y'}">
                        		<c:set var="imp" value="imp"/>
                        		<c:set var="impImgPath" value="${imgPath}/mail_star_sel.png"/>
                        	</c:if>
                        	
                        	<!-- 여기가 리스트 아이템 -->
							<div id="${item.no}" class="mail-item ${read} ${imp} d-flex align-items-center">
								<c:choose>
									<c:when test="${item.type eq 'S'}">
										<a href="/checkmine/mail/send/detail?n=${item.no}" class="mail-list-item">
											<input type="checkbox" value="${item.no}">
			                                <span style="width: 257px;">나</span>
			                                <span style="width: 650px;">[보낸편지]${item.title}</span>
			                                <span style="width: 235px;">${item.sendDate}</span>
			                            </a>
									</c:when>
									<c:when test="${item.type eq 'A'}">
										<a href="/checkmine/mail/receive/detail?n=${item.no}" class="mail-list-item">
											<input type="checkbox" value="${item.no}">
			                                <span style="width: 257px;">${item.sender}</span>
			                                <span style="width: 650px;">[받은편지]${item.title}</span>
			                                <span style="width: 235px;">${item.sendDate}</span>
			                            </a>
			                            <span class="d-flex justify-content-center"><img class="impbtn" src="${impImgPath}" style="margin-left: 11px;" onclick="importance(this);"></span>
									</c:when>
									<c:when test="${item.type eq 'R'}">
										<a href="/checkmine/mail/ref/detail?n=${item.no}" class="mail-list-item">
											<input type="checkbox" value="${item.no}">
			                                <span style="width: 257px;">${item.sender}</span>
			                                <span style="width: 650px;">[참조편지]${item.title}</span>
			                                <span style="width: 235px;">${item.sendDate}</span>
			                            </a>
			                            <span class="d-flex justify-content-center"><img class="impbtn" src="${impImgPath}" style="margin-left: 11px;" onclick="importance(this);"></span>
									</c:when>
								</c:choose>
	                        </div>
                        </c:forEach>
                        
                        
                    </div>
                </div>
            </div>
		</main>
    </div>

    <script>
    
        // 전체선택 전체 해재
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('#mail-list input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }

        //특정선택
        function selectSome(type){
            const checkboxes = document.querySelectorAll('#mail-list .'+ type + ' input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = true;
            });
        }
        
        //중요도 체크
        function importance(img){
            let classList = img.parentNode.parentNode.classList;
            const mailNum = img.parentNode.parentNode.id;
            if(classList.contains('imp')){
               
                $.ajax({
                    type:'post',
                    url: '/checkmine/mail/importance',
                    data:{
                        'mailNum' : mailNum,
                        'importance' : 'N'
                    },
                    success:function(result){
                        if(result == '1'){
                            img.src = '${imgPath}/mail_star_blank.png';
                            classList.remove('imp');
                            classList.add('notImp');
                        }else{
                            console.log('result is not 1');
                        }
                    },
                    error:function(){
                        console.log("fail");
                    }
                });
            }else{
                $.ajax({
                    type:'post',
                    url: '/checkmine/mail/importance',
                    data:{
                        'mailNum' : mailNum,
                        'importance' : 'Y'
                    },
                    success:function(result){
                        if(result == '1'){
                            img.src = '${imgPath}/mail_star_sel.png';
                            classList.remove('notImp');
                            classList.add('imp');
                        }else{
                            console.log('result is not 1');
                        }
                    },
                    error:function(){
                        console.log("fail");
                    }
                });
            }
        }
        
        //휴지통으로 보내기
        function gotoRecycleBin(){
           
        }
    </script>
</body>
</html>