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
<!-- 주소록 모달 -->
<link rel="stylesheet" type="text/css" href="/checkmine/resources/css/mail/mail_addr.css">
<!-- 주소록 추가 모달 -->
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
                    <input type="text" placeholder="메일검색" onkeyup="if(window.event.keyCode==13){mailSearch(this);}">
                </div>
            </div>

            <hr style="height: 2px;">

            <div id="wrapper" class="d-flex" style="padding-top: 8px;">
                <div id="container-nav">
                    <div onclick="location.href='/checkmine/mail/write'">
                        <img src="${imgPath}/mail_send.png">
                        <span>메일 쓰기</span>
                    </div>

                    <ul>
                        <li><div><a href="/checkmine/mail/receive?p=1">받은편지함</a><span>${notReadCountReceive}</span></div></li>
                        <li><div><a href="/checkmine/mail/ref?p=1">참조편지함</a><span>${notReadCountRef }</span></div></li>
                        <li><div><a href="/checkmine/mail/send?p=1">보낸편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/imp?p=1">중요편지함</a></div></li>
                        <li><div><a href="/checkmine/mail/save?p=1">임시보관함</a></div></li>
                        <li><div><a href="/checkmine/mail/bin?p=1">휴지통</a></div></li>
                        <li><div class="container-nav-selected"><a href="/checkmine/mail/addr?p=1">주소록</a></div></li>
                    </ul>
                </div>
                <!-- 여기까지 -->
                <div>
                    <div style="margin-left: 12px; margin-bottom: 3px; font-size: 30px;">주소록</div>
                    <div id="addr-box-wrap">

                        <!-- 사내 ========================================================================== -->
                        
                        <div class="addr-box" id="inner-box">
                            <div class="category">사내</div>

                            <!-- 여기부터 리스트 받아오기 -->
                            <div class="list-wrap">
	                            <c:forEach items="${AddrListInner }" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" id="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="javascript:return false;" onclick="addrDelete(this);" id="${addrVo.no}"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="/checkmine/mail/reply?t=${addrVo.email}"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
                            </div>
                            <!-- 여기까지 -->

                            <div id="inner-footer" class="footer-menu">
                                <a href="javascript:return false;" onclick="deleteChecked('inner-box');"><img src="${imgPath}/trash_icon.png"></a>
                            </div>
                        </div>

                        <!-- 거래처 ==========================================================================  -->
                        
                        <div class="addr-box" id="acc-box">
                            <div class="category">거래처</div>

							<div class="list-wrap">
                            <!-- 여기부터 리스트 받아오기 -->
	                            <c:forEach items="${AddrListAcc}" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" id="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="javascript:return false;" onclick="addrDelete(this);" id="${addrVo.no}"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="/checkmine/mail/reply?t=${addrVo.email}"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
							</div>
                            <!-- 여기까지 -->

                            <div id="acc-footer" class="footer-menu">
                                <a href="javascript:return false;" onclick="deleteChecked('acc-box');"><img src="${imgPath}/trash_icon.png"></a>
                            </div>
                        </div>

                        <!-- 외부 ==========================================================================  -->
                        
                        <div class="addr-box" id="outer-box">
                            <div class="category">외부</div>
							
							<div class="list-wrap">
	                            <!-- 여기부터 리스트 받아오기 -->
	                            <c:forEach items="${AddrListOuter}" var="addrVo">
		                            <div class="list">
		                                <input type="checkbox" id="${addrVo.no}">
		                                <span class="name">${addrVo.name}</span>
		                                <span class="addr">${addrVo.email}</span>
		                                <a class="delete" href="javascript:return false;" onclick="addrDelete(this);" id="${addrVo.no}"><img src="${imgPath}/trash_icon.png"></a>
		                                <a class="send" href="/checkmine/mail/reply?t=${addrVo.email}"><img src="${imgPath}/mail_d_reply.png"></a>
		                            </div>
	                            </c:forEach>
							</div>
                            <!-- 여기까지 -->

                            <div id="outer-footer" class="footer-menu">
                                <a href="javascript:return false;" onclick="deleteChecked('outer-box');"><img src="${imgPath}/trash_icon.png"></a>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div id="addr-search">
                            <img src="${imgPath}/mail_search.png">
                            <input id="searchInput" type="text" placeholder="주소록 검색" onkeyup="if(window.event.keyCode==13){addrSearch();}">
                        </div>

                        <div id="addr-search-result">
                            <!-- 결과 리스트 가져오기 -->
                        </div>
                    </div>

                    <button id="addr-add" data-bs-toggle="modal" data-bs-target="#add-addr-modal">추가</button>
                    
                </div>
            </div>
        </main>
    </div>
    <!-- 주소록 추가 모달 -->
    <%@ include file="/WEB-INF/views/mail/addr_modal.jsp" %>
    
    <script type="text/javascript">
		
		
        //하나 삭제
        function addrDelete(target){
            targetNo = target.id;
            if(confirm('삭제하시겠습니까?')){
                $.ajax({
                    url : "/checkmine/mail/addr/delete"
                    , type : "post"
                    , data :{targetNo:targetNo}
                    , success: function(data){
                        if(data == '1'){
                            target.parentNode.remove();
                        }
                    }
                });
            }
        }
		
        //체크된 것 삭제
        function deleteChecked(targetId){
            const checked =  document.querySelectorAll('#'+targetId+' input[type="checkbox"]:checked');
            
            if(confirm(checked.length + '개의 주소록 삭제하시겠습니끼?')){   
                var addrNoArr = new Array();
                
                for(var i = 0; i<checked.length; i++){
                    addrNoArr[i] = checked[i].id; 
                }
                
                $.ajax({
                    type: "post",
                    url: "/checkmine/mail/addr/deleteAll",
                    traditional : true,
                    data: {addrNoArr:addrNoArr},
                    success: function (response) {
                        if(response == '1'){
                            alert(checked.length + '개 삭제되었습니다!');
                            window.location.reload();
                        }else{
                            alert("fail");
                            window.location.reload();
                        }
                    }
                });
                
            }
        }

        function addrSearch(){
            const keyword = document.querySelector('#searchInput').value;

            $.ajax({
                type: "post",
                url: "/checkmine/mail/addr/search",
                data: {keyword:keyword},
                success: function (resListStr) {
                    const list = JSON.parse(resListStr);
                    console.log(list);
                    
                    document.querySelector('#searchInput').value = "";

                    const resultDiv = document.querySelector("#addr-search-result");
                    resultDiv.innerHTML = "";

                    for(var i = 0;i<list.length ; i++){
                        resultDiv.innerHTML = resultDiv.innerHTML
                            +'<div class="result">'
                            +   '<span>' + list[i].name + '</span>'    
                            +   '<span>' + list[i].email + '</span>'
                            +   '<a class="delete" id="' + list[i].no + '" href="javascript:return false;"  onclick="addrDelete(this);"><img src="${imgPath}/trash_icon.png"></a>'
                            +   '<a class="send" href="/checkmine/mail/reply?t=' + list[i].email + '"><img src="${imgPath}/mail_d_reply.png"></a>'
                            +'</div>'
                    }
                }
            });
        }
      	//메일 검색
        function mailSearch(input){
            const keyword = input.value;
            location.href = '/checkmine/mail/search?k='+keyword;
        }
    </script>
</body>
</html>