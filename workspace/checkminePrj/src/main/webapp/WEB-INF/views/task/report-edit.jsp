<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--tagify-->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />


<!DOCTYPE html>
<c:set value="${pageContext.request.contextPath}" var="root"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /*카테고리*/
    .nav-tabs{
        margin-top: 20px;
        border-bottom: 1px solid #B0D9D1;
    }
    
    .nav-link {
    	border-top: 1px solid lightgray !important;
    	border-left: 1px solid lightgray !important;
    	border-right: 1px solid lightgray !important;
    	color: lightgray;
    }
    
    /*활성화 카테고리 색상 변경*/
    .active	{
    	margin-left: 40px;
    	border-top: 1px solid #B0D9D1 !important;
    	border-left: 1px solid #B0D9D1 !important;
    	border-right: 1px solid #B0D9D1 !important;
    	color: #B0D9D1 !important;
    }

    #report{
        border: 3px solid #B0D9D1;
        border-bottom: none;
        margin-left: 20px;

        color: #B0D9D1;
        font-weight: bold;
    }

    /*작성 부분*/
	#table{
        margin: 10px auto;
        width:95%;
        height: 90%;
        display: grid;
        grid-template-columns: 100px;
        grid-template-rows: 40px 40px 40px 40px 40px 550px 40px 40px;
		border: 1px solid #5D736F;
        border-radius: 10px;
	}
	
	#table>div{
        border-bottom: 1px solid #5D736F;
        text-align: center;
	}

    #subject{grid-column-start: 1; grid-column-end: 3;}
    #text-area{grid-column-start: 1; grid-column-end: 3;}
    #title > input {
        border: none;
        width: 100%;
        height: 100%;
    }

    textarea{
        width: 100%;
        height: 100%;
        border: none;
        resize: none;
    }

    #submit-area{
        margin-right: 40px;
        text-align: right;
    }

    input[type="submit"]{
        padding: 5px;
        margin-top: 10px;
        margin-bottom: 20px;
        width: 70px;
        border: 1px solid lightgray;
        background-color: #B0D9D1;
        border-radius: 10px;
        color: white;
    }

    input[type="submit"]:hover{
        background-color: #5D736F;
    }

    #order {
        border-radius: 10px 0 0 0 ;
    }

    #select, #select > select{
        border-radius: 0 10px 0 0;
    }

	/*구분 css*/
    .division {
        font-weight: 700;
        background-color: #f0f0f0;
        line-height: 40px;
    }

    select, input[type="file"]{
        width: 100%;
        height: 100%;
    }

    /*파일 첨부 css*/
    input[type=file]::file-selector-button {
        width: 100px;
        height: 30px;
        margin: 5px;
        background: #B0D9D1;
        border: 1px solid lightgray;
        color: white;
        border-radius: 10px;
        line-height: 30px;
        display: right;
        padding: 0px;
    }

    input[type=file]{cursor: pointer;}
    input[type=file]::file-selector-button:hover{background: #5D736F;}

    .attachments{
        grid-row-start: 7;
        grid-row-end: 9;
        line-height: 40px;
        line-height: 80px;
        border-radius: 0 0 0 10px;
        border-bottom: none !important;
    }

    #show-files{
        border-radius: 0 0 10px 0;
        border-bottom: none !important;
    }


    /*border-radius*/
    #title-diveision{
        border-radius: 10px 0 0 0 ;
    }

    #title, input[type="text"]{
        border-radius: 0 10px 0 0 ;
    }

/*스크롤바 설정*/
#text, #show-files{
        overflow: auto;
    }

    #text::-webkit-scrollbar, #show-files::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    #text::-webkit-scrollbar-thumb, #show-files::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    #text::-webkit-scrollbar-track, #show-files::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

    /*tagify*/
    .tag{
        width: 100%;
        height: 100%;
    }

    .tag:focus{
    }

    .tagify__input{
        padding: 4px;
        text-align: left;
    }

    .tagify__tag {
        margin: 3px 2px 3px 3px !important;
    }

    .tags-look .tagify__dropdown__item{
        display: inline-block;
        border-radius: 3px;
        padding: .3em .5em;
        border: 1px solid #CCC;
        background: #F3F3F3;
        margin: .2em;
        font-size: .85em;
        color: black;
        transition: 0s;
    }

    .tagify__dropdown .destination-tags{
        border: 1px dashed #5D736F;
    }
    .tags-look .tagify__dropdown__item--active{
        color: black;
    }

    .tags-look .tagify__dropdown__item:hover{
        background: #D3E2E2;
        border-color: #B0D9D1;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">

            <!--작성 칸-->
            <div id="wrap">

                <!--카테고리-->
				<ul class="nav nav-tabs">
			        <li class="nav-item">
			          <a class="nav-link active" href="${root}/task/report/list/1">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>

                <form action="" method="post" enctype="multipart/form-data" onsubmit="return check();">
                    <div id="table">
                        <div class="division" id="order">지시서</div>
                        <div id="select">
                            <select name="taskNo">
                                <c:forEach items="${taskList}" var="task">
                                    <option value="${task.no}">${task.no} | ${task.orderer} | ${task.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="division" id="title-diveision">제　목</div><div id="title"><input type="text" name="title" value={vo.title}></div>
                        <div class="division">수　신</div>
                        <div class="destination">
                            <input type="text" class="tag" name="attNoA" placeholder="수신받을 직원의 이름을 적으세요." value="${aVo.empNo}">
                        </div>
                        <div class="division">참　조</div>
                        <div class="reference">
                            <input type="text" class="tag" name="attNoR" placeholder="참조할 직원의 이름을 적으세요." value="${rVo.empNo}">
                        </div>
                        <div class="division" id="subject">내　용</div>
                        <div id="text-area" class="division">
                            <textarea name="content" id="text" cols="30" rows="10" value=${vo.content}></textarea>
                        </div>
                        <div class="division attachments">첨부 파일</div>
                        <div class="file"><input type="file" id="upload-file" name="files" multiple></div>
                        <div id="show-files">${fileVo.name}</div>

                    </div>
                    <div id="submit-area">
                        <input type="submit" value="작성">
                    </div>
                </form>
            </div>
        </main>
    </div>

    <!--빈칸 방지-->
    <script>
        const title = document.querySelector('#title');
        const content = document.querySelector('#content');
        const att = document.querySelector('#att');
        const startDate = document.querySelector('#order_start_date');
        const endDate = document.querySelector('#order_end_date');

        function check(){
            //제목
            if(title.value.length == 0){
                alert("제목을 작성해주세요.");
                return false;
            }

            //본문
            if(content.value.length == 0){
                alert("내용을 작성해주세요.");
                return false;
            }

            //수신
            if(att.value.length == 0){
                alert("수신인을 지정해주세요.");
                return false;
            }
        }
    </script>

    <script>
        //file 목록 출력
        window.onload = function(){
            target = document.getElementById('upload-file');
            target.addEventListener('change', function(){
                fileList="";
                for(i=0; i<target.files.length;i++){
                    fileList += target.files[i].name + '<br>';
                }
                target2 = document.getElementById('show-files');
                target2.innerHTML = fileList;
            })
        }

        //tagify
        const input = document.querySelector('input[name=attNoA]');
        const input2 = document.querySelector('input[name=attNoR]');
        let tagify = new Tagify(input, {//드롭다운
            whitelist: ["A# .NET", "A# (Axiom)", "A-0 System", "A+", "A++", "ABAP", "ABC", "ABC ALGOL", "ABSET", "ABSYS", "ACC", "Accent", "Ace DASL", "ACL2", "Avicsoft", "ACT-III", "Action!", "ActionScript", "Ada", "Adenine", "Agda", "Agilent VEE", "Agora", "AIMMS", "Alef", "ALF", "ALGOL 58", "ALGOL 60", "ALGOL 68", "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "Apex (Salesforce.com)", "APL", "AppleScript", "Arc", "ARexx", "Argus", "AspectJ", "Assembly language", "ATS", "Ateji PX", "AutoHotkey", "Autocoder", "AutoIt", "AutoLISP / Visual LISP", "Averest", "AWK", "Axum", "Active Server Pages", "ASP.NET", "B", "Babbage", "Bash", "BASIC", "bc", "BCPL", "BeanShell", "Batch (Windows/Dos)", "Bertrand", "BETA", "Bigwig", "Bistro", "BitC", "BLISS", "Blockly", "BlooP", "Blue", "Boo", "Boomerang", "Bourne shell (including bash and ksh)", "BREW", "BPEL", "B", "C--", "C++ – ISO/IEC 14882", "C# – ISO/IEC 23270", "C/AL", "Caché ObjectScript", "C Shell", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "CFML", "Cg", "Ch", "Chapel", "Charity", "Charm", "Chef", "CHILL", "CHIP-8", "chomski", "ChucK", "CICS", "Cilk", "Citrine (programming language)", "CL (IBM)", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL – ISO/IEC 1989", "CobolScript – COBOL Scripting language", "Cobra", "CODE", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language (CPL)", "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "COMPASS", "Component Pascal", "Constraint Handling Rules (CHR)", "COMTRAN", "Converge", "Cool", "Coq", "Coral 66", "Corn", "CorVision", "COWSEL", "CPL", "CPL", "Cryptol", "csh", "Csound", "CSP", "CUDA", "Curl", "Curry", "Cybil", "Cyclone", "Cython", "M2001", "M4", "M#", "Machine code", "MAD (Michigan Algorithm Decoder)", "MAD/I", "Magik", "Magma", "make", "Maple", "MAPPER now part of BIS", "MARK-IV now VISION:BUILDER", "Mary", "MASM Microsoft Assembly x86", "MATH-MATIC", "Mathematica", "MATLAB", "Maxima (see also Macsyma)", "Max (Max Msp – Graphical Programming Environment)", "MaxScript internal language 3D Studio Max", "Maya (MEL)", "MDL", "Mercury", "Mesa", "Metafont", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script", "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "Mathcad", "MSIL – deprecated name for CIL", "MSL", "MUMPS", "Mystic Programming L"], // 화이트리스트 배열
            maxTags: 100, // 최대 허용 태그 갯수
            
            dropdown: {
                maxItems: 20,           // 드롭다운 메뉴에서 몇개 정도 항목을 보여줄지
                classname: "destination-tags", // 드롭다운 메뉴 엘리먼트 클래스 이름. 이걸로 css 선택자로 쓰면 된다.
                enabled: 0,             // 단어 몇글자 입력했을떄 추천 드롭다운 메뉴가 나타날지
                closeOnSelect: false    // 드롭다운 메뉴에서 태그 선택하면 자동으로 꺼지는지 안꺼지는지
            }
        }); // initialize Tagify

        let tagify2 = new Tagify(input2, {
            whitelist: ["..."], // 화이트리스트 배열
            maxTags: 100, // 최대 허용 태그 갯수
            
            dropdown: {
                maxItems: 20,           // 드롭다운 메뉴에서 몇개 정도 항목을 보여줄지
                classname: "reference-tag", // 드롭다운 메뉴 엘리먼트 클래스 이름. 이걸로 css 선택자로 쓰면 된다.
                enabled: 0,             // 단어 몇글자 입력했을떄 추천 드롭다운 메뉴가 나타날지
                closeOnSelect: false    // 드롭다운 메뉴에서 태그 선택하면 자동으로 꺼지는지 안꺼지는지
            }
        })
        // 태그가 추가되면 이벤트 발생
        tagify.on('add', function() {
          console.log(tagify.value); // 입력된 태그 정보 객체
        })

    </script>
</body>
</html>