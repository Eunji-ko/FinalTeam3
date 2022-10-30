<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     <!-- 서머노트를 위해 추가해야할 부분 -->
        <script src="${rootPath}/resources/summernote/summernote-lite.js"></script>
        <script src="${rootPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="${rootPath}/resources/summernote/summernote-lite.css">
     <!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 게시판</title>

<style>


    main > div {
        width: 1450px;
        margin: 10px auto;
    }
    
    #area{
        height: 130px;
        display: flex;
        justify-content:space-between;
        align-items: center;
    }
    #infoWrap{
        height: 700px;
        border: 1px solid lightgrey;
    }
    #area button:first-child{
        width: 20px; 
        height: 20px; 
        border: none; 
        background-color: white;
        font-size: 20px;
        font-weight: bolder;
    }

    #header{
        font-size: 20px;
        font-weight: bolder;
    }
    #title{
        width: 100%;
        border-bottom: 1px solid lightgray;
        display: flex;
        justify-content: left;
    }
    #title input{
        height: 100%;
        width: 100%;
        border: none;
    }
 
 
    #content{
        height: 590px;
        margin: 10px;
        border: 1px solid #5D736F;
    }
    select[name="type"]{
        border-top: none;
        border-left: none;
    }
  

    #regist{
        width: 178px;
        font-size: 16px;
        background-color: #5D736F; 
        border-radius: 30px;
        color: white;
    }
    #buttonArea{
        display: flex;
        justify-content:right;
    }
    #buttonArea > button{
        margin-right: 10px;
    }
    #footer{
        margin: 10px;
        display: flex;
        justify-content: space-between;
    }

    textarea{
        resize: none;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
            <div id="area">
                <div>
                    <button onclick="history.back()">←</button>
                    <span id="header">&nbsp;&nbsp;글 작성</span>
                </div>
            </div>
            
            <div id="infoWrap">
                <form action="" method="post" enctype="multipart/form-data">
            
                <div style="display: flex; justify-content: space-between;">
                    <div>
                        <select style="width: 200px;" class="form-select" name="type" onchange=attachType(); required>
                        <c:if test="${fn:contains(loginMember.permission, 'N')}">
                            <option value="N">공지사항</option>
                        </c:if>
                        <option value="C">커뮤니티</option>
                        <option value="G">갤러리</option>
                        </select>
                    </div>
                    <div id="title"><input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" required></div>
               </div>
                <div id="content-box">
                    <div id="content">
                        <textarea style="width: 100%; height: 100%;" class="summernote" name="content" style="width:650px; height:350px;" required></textarea>
                       
                    </div>
                    <div id="footer">
                        <div id="attach"><input type="file" name="attach" multiple></div>
                        <div id="buttonArea"><button type="submit" class="btn" id="regist">등록하기</button></div>
                    </div>

                </div>

                
            </form>
                
            </div>
            
 
            
        </main>
    </div>
   
    <script>
        //커뮤니티, 갤러리 선택 시 사진만 첨부 가능하게 함
        function attachType(){
            const select = document.querySelector("select[name=type]").value;
            const attachArea = document.querySelector("#attach");
            if(select == 'G' || select == 'C'){
                attachArea.innerHTML = '<input type="file" accept=".gif, .jpg, .png" name="attach" multiple>';
            }else{
                attachArea.innerHTML = '<input type="file" name="attach" multiple>';
            }

        }
        
       
    </script>

    <script>
        //썸머노트 적용
        $('.summernote').summernote({
            height: 533,
            lang: "ko-KR",
            disableResizeEditor: true,
           
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
	});
           
    function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${rootPath}/board/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', '${rootPath}'+ "/resources/upload/board/" +data.fileName);
				}
			});
		}
   
    </script>
    




</body>
</html>