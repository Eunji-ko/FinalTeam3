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
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_detail.css">
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr_modal.css">

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
                    <div onclick="location.href='/checkmine/mail/write'">
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
						<li><div><a href="/checkmine/mail/receive?p=1">받은편지함</a><span>${notReadCountReceive}</span></div></li>
                        <li><div class="container-nav-selected"><a href="/checkmine/mail/ref?p=1">참조편지함</a><span>${notReadCountRef}</span></div></li>
                        <li><div><a href="/checkmine/mail/send?p=1">보낸편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/imp?p=1">중요편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/save?p=1">임시보관함</a></div></li>
                        <li><div><a href="/checkmine/mail/bin?p=1">휴지통</a></div></li>
                        <li><div><a href="/checkmine/mail/addr?p=1">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px;">참조편지함</div>
                    <div id="detail-container">
                        <div class="d-flex">
                            <a href="javascript:window.history.back();"><img src="${imgPath}/mail_d_arrow_pre.png"></a>
                            <a href="javascript:return false;" onclick="deleteMail('${mailVo.no}');"><img src="${imgPath}/trash_icon.png"></a>
                            <c:if test="${mailVo.importance eq 'N'}">
	                            <a id="star" href="javascript:return false;" onclick="setImp('Y', '${mailVo.no}')"><img src="${imgPath}/mail_star_blank.png"></a>
                            </c:if>
                            <c:if test="${mailVo.importance ne 'N'}">
	                            <a id="star" href="javascript:return false;" onclick="setImp('N', '${mailVo.no}')"><img src="${imgPath}/mail_star_sel.png"></a>
                            </c:if>
                            <a href="/checkmine/mail/reply?t=${mailVo.senderEmail}"><img src="${imgPath}/mail_d_reply.png"></a>
                        </div>

                        <div id="title">[참조]${mailVo.title}</div>

                        <div class="d-flax">
                            <span>보낸이 : ${mailVo.senderEmail}</span> 
                            <button  id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">주소록에 추가</button>
                            <span id="time">${mailVo.sendDate}</span>
                        </div>

                        <div id="content">${mailVo.content}</div>

                        <!-- 다운로드 처리 -->
                        <div>
                            <button id="down">전부 다운로드</button> :
                            <div id="downloadList">
	                            <c:forEach items="${mailVo.mailAttVo}" var="fileName">
		                            <a href="/checkmine/download/${fileName.name}/${fileName.realName}">${fileName.realName}</a>&nbsp;&nbsp;
	                            </c:forEach>
                            </div>
                        </div>
						
                        <div class="d-flex justify-content-end">
                            <button id="reply-btn" onclick="location.href = '/checkmine/mail/reply?t=${mailVo.senderEmail}'">
                                <img src="${imgPath}/mail_d_reply.png">
                                답장
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <!-- 주소록 추가 모달 -->
    <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>

    <script>
    	//메일 삭제
        function deleteMail(receiveMailNo){
            if(confirm('메일을 삭제하시겠습니까?')){
                $.ajax({
                    url : '/checkmine/mail/receive/detail/delete'
                    , type : 'post'
                    , data : {'receiveMailNo' : receiveMailNo}
                    , success : function(result){
                        if(result == '1'){
                            alert('메일이 휴지통으로 이동되었습니다!');
                            location.href = '/checkmine/mail/ref';
                        }else{
                            alert('삭제 실패');
                        }
                    }
                });
            }
        }
    	
    	//중요도 표시
    	function setImp(impVal,receiveMailNo) {
    		const star = document.querySelector("#star");
    		
    		$.ajax({
                url : '/checkmine/mail/receive/detail/setImp'
                , type : 'post'
                , data : {
                        'impVal' : impVal,
                        'receiveMailNo' : receiveMailNo
                    }
                , success : function(result){
                    if(result == '1'){
                    	if(impVal == 'N'){
                    		star.onclick = function(){setImp('Y', receiveMailNo);}
                    		star.innerHTML = '<img src="${imgPath}/mail_star_blank.png">';
                    	}else if(impVal == 'Y'){
                    		star.onclick = function(){setImp('N', receiveMailNo);}
                    		star.innerHTML = '<img src="${imgPath}/mail_star_sel.png">';
                    	}
                    }else{
                        alert('error');
                    }
                }
            });
		}
    </script>
</body>
</html>