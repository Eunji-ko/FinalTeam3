<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% //테스트용 멤버 나중에 없앨것임
	com.kh.checkmine.member.vo.MemberVo vo = new com.kh.checkmine.member.vo.MemberVo();
	vo.setNo("1");
	vo.setEmail("chanrb0966@gmail.com");
	session.setAttribute("loginMember", vo);
%>

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

                    <ul>
                        <li><div class="container-nav-selected"><a onclick="getList(this,'receve',1, ${loginMember.no});">받은편지함</a><span>21</span></div></li>
                        <li><div><a onclick="getList(this,'send',1 ,${loginMember.no});">보낸편지함</a><span>21</span></div></li>
                        <li><div><a onclick="getList(this,'imp',1, ${loginMember.no});">중요편지함</a><span>21</span></div></li>
                        <li><div><a onclick="getList(this,'save',1, ${loginMember.no});">임시보관함</a><span>21</span></div></li>
                        <li><div><a onclick="getList(this,'ref',1 ,${loginMember.no});">참조편지함</a><span>21</span></div></li>
                        <li><div><a onclick="getList(this,'recycle',1, ${loginMember.no});">휴지통</a></div></li>
                        <li><div><a href="/checkmine/mail/addr">주소록</a></div></li>
                    </ul>
                </div>

                <div>
                    <div id="list-name" style="margin-left: 12px; margin-bottom: 3px;">받은편지함</div>

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
                        <span>1 page</span>
                        <a href="메일 리스트 이전 페이지"><img src="${imgPath}/mail_arrow_pre.png"></a>
                        <a href="메일 리스트 다음 페이지"><img src="${imgPath}/mail_arrow_next.png"></a>
                    </div>

                    <!-- 메일 리스트 -->
                    <div id="mail-list" style="width: 1258px; margin-top: 19px;">
                        <div class="d-flex" style="padding-bottom: 10px; ">
                            <span style="margin-left: 59px; width: 257px;">보낸이</span>
                            <span style="width: 650px;">제목/내용</span>
                            <span style="width: 235px;">시간</span>
                            <span>중요도</span> 
                        </div>
                        
                        <!-- 리스트 여기부터 받아오기 -->
                        <div id="1" class="mail-item read notImp d-flex align-items-center">
                            <a href="메일_상세보기" class="mail-list-item">
                                <input type="checkbox" value="1">
                                <span style="width: 207px;">chan0966@gmail.com</span>
                                <span style="width: 785px;">제목제목제목제목-내용내용내용내용내용내용내용내용내용내용내용내용내용내용...</span>
                                <span style="width: 150px;">2022-10-12 12:12</span>
                            </a>
                            <span class="d-flex justify-content-center"><img class="impbtn" src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;" onclick="importance(this);"></span>
                        </div>

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

        function selectSome(type){
            const checkboxes = document.querySelectorAll('#mail-list .'+ type + ' input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = true;
            });
        }

        //휴지통으로 보내기
        function gotoRecycleBin(){
            const checkboxes = document.querySelectorAll('#mail-list input[type="checkbox"]:checked');

            let mailArr = [];
            checkboxes.forEach((checkbox) =>{
                mailArr.push(checkbox.value);
            });
            
            if(confirm("선택된 메일을 휴지통으로 보내시겠습니까?")){
                $.ajax({
                    url:'/checkmine/mail/recycleBin',
                    type:'post',
                    data:{'mails' : mailArr},
                    dataType:'json',
                    success: function(data){
                        alert(data + '개의 메일이 삭제되었습니다.');
                    },
                    error:function(){
                        alert("실패");
                    }
                });
            }
        }

        //중요도 표시
        function importance(img){
            let classList = img.parentNode.parentNode.classList;
            const mailNum = img.parentNode.parentNode.id;
            if(classList.contains('imp')){
                img.src = '${imgPath}/mail_star_blank.png';
                classList.remove('imp');
                classList.add('notImp');
                $.ajax({
                    type:'post',
                    url: '/checkmine/mail/importance',
                    data:{
                        'mailNum' : mailNum,
                        'importance' : 'N'
                    }
                });
            }else{
                img.src = '${imgPath}/mail_star_sel.png';
                classList.remove('notImp');
                classList.add('imp');
                $.ajax({
                    type:'post',
                    url: '/checkmine/mail/importance',
                    data:{
                        'mailNum' : mailNum,
                        'importance' : 'Y'
                    }
                });
            }
        }

        //메일 리스트 조회
        function getList(element, type, page, receverNo){
            const sub = document.getElementById('list-name');
            if(type == 'receve'){
                sub.innerText = '받은편지함';
            }else if(type == 'send'){
                sub.innerText = '보낸편지함';
            }else if(type == 'imp'){
                sub.innerText = '중요편지함';
            }else if(type == 'save'){
                sub.innerText = '임시보관함';
            }else if(type == 'recycle'){
                sub.innerText = '휴지통';
            }else if(type == 'ref'){
                sub.innerText = '참조편지함';
            }

            //클릭시 화면 효과
            const menuList = document.querySelectorAll('#container-nav>ul div');
            for(let i=0;i<menuList.length;i++){
                if(menuList[i].classList.contains('container-nav-selected')){
                    menuList[i].classList.toggle('container-nav-selected');
                }
            }
            element.parentNode.classList.add('container-nav-selected');

            //리스트 삭제
            const mailList = document.querySelectorAll('#mail-list .mail-item');
            
            for(let i=0;i<mailList.length;i++){
                mailList[i].remove();
            }

            //리스트 조회
            $.ajax({
                url:'/checkmine/mail/getlist',
                type : 'post',
                data:{
                    'type' : type,
                    'page' : page,
                    'loginMember' : receverNo
                },
                success : function(mailList){
                	const list = JSON.parse(mailList);

                    //받아온 데이터로 처리하기
                    const mailListWrap = document.querySelector('#mail-list');
                    for(let i=0;i<list.length;i++){
                    	
                    	let read;
                    	let imp;
                    	if(list[i].read == 'N'){ read = 'notRead'; }else{ read = 'read';}
                    	if(list[i].importance == 'N'){ imp = 'notImp' }else{ imp = 'imp' }
                    	
                    	
                        mailListWrap.innerHTML = mailListWrap.innerHTML + 
                        '<div id="' +list[i].mailNo + '" class="mail-item ' + read + ' ' + imp + ' d-flex align-items-center">'+
                            '<a href="/checkmine/mail/detail?' + list[i].mailNo +'" class="mail-list-item"> '+
                                '<input type="checkbox" value="' + list[i].mailNo + '">'+
                                '<span style="width: 250px; font-size:13px;">' + list[i].senderEmail+ '</span>'+
                                '<span style="width: 650px;">' + list[i].title+'-' +list[i].content+ '</span>'+
                                '<span style="width: 235px;">' + list[i].sendDate+ '</span>'+
                            '</a>'+
                            '<span class="d-flex justify-content-center"><img class="impbtn" src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;" onclick="importance(this);"></span>'+
                        '</div>'
                    }
                    
                }
            });
        }

        //메일 검색
        function mailSearch(serchElement){
            
            //검색시 화면 효과
            const menuList = document.querySelectorAll('#container-nav>ul div');
            for(let i=0;i<menuList.length;i++){
                if(menuList[i].classList.contains('container-nav-selected')){
                    menuList[i].classList.toggle('container-nav-selected');
                }
            }

            //리스트 삭제
            const mailList = document.querySelectorAll('#mail-list .mail-item');
            
            for(let i=0;i<mailList.length;i++){
                mailList[i].remove();
            }
            
            const keyword = serchElement.value;
            const sub = document.getElementById('list-name');
            sub.innerText = '"' + keyword + '" (으)로 검색한 결과';
            //검색 요청
            $.ajax({
                url : '/checkmine/mail/serch',
                type : 'post',
                data : {'keyword' : keyword},
                success : function(mailList){
                    const mailListWrap = document.querySelector('#mail-list');
                    
                    for(let i=0;i<5;i++){
                        mailListWrap.innerHTML = mailListWrap.innerHTML + 
                        '<div id="1" class="mail-item notRead notImp d-flex align-items-center">'+
                            '<a href="메일_상세보기" class="mail-list-item"> '+
                                '<input type="checkbox" value="1">'+
                                '<span style="width: 207px;">chan0966@gmail.com</span>'+
                                '<span style="width: 785px;">제목제목제목제목-내용내용내용내용내용내용내용내용내용내용내용내용내용내용...</span>'+
                                '<span style="width: 150px;">2022-10-12 12:12</span>'+
                            '</a>'+
                            '<span class="d-flex justify-content-center"><img class="impbtn" src="${imgPath}/mail_star_blank.png" style="margin-left: 11px;" onclick="importance(this);"></span>'+
                        '</div>'
                    }
                }
            });
        }
    </script>
</body>
</html>