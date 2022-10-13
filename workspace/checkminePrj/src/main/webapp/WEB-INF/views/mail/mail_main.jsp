<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckMine - 메일</title>
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_basic.css">
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_main.css">

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
                    <div style="margin-left: 12px; margin-bottom: 3px;">받은편지함</div>

                    <div id="mid-nav" class="d-flex" style="width: 1258px;">
                        <!-- 전체 체크박스 -->
                        <input type="checkbox" name="checkbox-all" class="align-self-center">
                        
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

                    <div id="mail-list" style="width: 1258px; margin-top: 19px;">
                        <div class="d-flex" style="padding-bottom: 10px; border-bottom: 1px solid #9a9a9a;">
                            <span style="margin-left: 59px; width: 207px;">보낸이</span>
                            <span style="width: 785px;">제목/내용</span>
                            <span style="width: 150px;">시간</span>
                            <span>중요도</span> 
                        </div>
                        
                        <!-- 리스트 여기부터 받아오기 -->
                        <a href="메일_상세보기" class="mail-list-item">
                            <input type="checkbox" name="네임은_메일_번호로">
                            <span style="width: 207px;">chan0966@gmail.com</span>
                            <span style="width: 785px;">제목제목제목제목-내용내용내용내용내용내용내용내용내용내용내용내용내용내용...</span>
                            <span style="width: 150px;">2022-10-12 12:12</span>
                            <span class="d-flex justify-content-center"><img src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;"></span> 
                        </a>
                        <a href="메일_상세보기" class="mail-list-item">
                            <input type="checkbox" name="네임은_메일_번호로">
                            <span style="width: 207px;">chan0966@gmail.com</span>
                            <span style="width: 785px;">제목제목제목제목-내용내용내용내용내용내용내용내용내용내용내용내용내용내용...</span>
                            <span style="width: 150px;">2022-10-12 12:12</span>
                            <span class="d-flex justify-content-center"><img src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;"></span> 
                        </a>
                        <a href="메일_상세보기" class="mail-list-item">
                            <input type="checkbox" name="네임은_메일_번호로">
                            <span style="width: 207px;">chan0966@gmail.com</span>
                            <span style="width: 785px;">제목제목제목제목-내용내용내용내용내용내용내용내용내용내용내용내용내용내용...</span>
                            <span style="width: 150px;">2022-10-12 12:12</span>
                            <span class="d-flex justify-content-center"><img src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;"></span> 
                        </a>
                    </div>
                </div>
            </div>
		</main>
    </div>
</body>
</html>