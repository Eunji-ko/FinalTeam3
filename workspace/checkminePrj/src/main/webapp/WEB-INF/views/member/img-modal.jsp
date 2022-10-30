<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #profile-thumb{
        margin: 0 auto;
        height: 200px;
        width: 150px;
        justify-self: start;
        margin-top: 20px;
        grid-column: 2/3;
        grid-row: span 2;
    }
</style>
</head>
<body>
  <form action="${rootPath}/member/changePhoto" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="changeImg" tabindex="-1" aria-labelledby="changeImgLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="changeImgLabel">사진 변경</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="no" value="{loginMember.no}">
            <div class="input-group">
              <input type="file" name="profile" class="form-control" id="profileImg" aria-describedby="profileImgAddon" aria-label="Upload">
            </div>
            <div id="profile-thumb">
              <img id="profile-img-thumb" src="${rootPath}/resources/upload/profile/${loginMember.photoName}" width="100%" height="100%">
            </div>
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn checkmine-btn" value="신청하기">
          </div>
        </div>
      </div>
    </div>
  </form>

  <script>
	
    const fileInputTag = document.querySelector('input[name=profile]');
  
      fileInputTag.onchange = function(){
          
          const imgTag = document.querySelector('#profile-img-thumb');
  
          if(fileInputTag.files.length > 0){
              //파일 선택됨  
              const fr = new FileReader();
              fr.onload = function(data){
                  imgTag.src = data.target.result;
              }
  
              fr.readAsDataURL(fileInputTag.files[0]); //파일 읽기
          }else{
              imgTag.src = "";
          }
      }
  </script>
  
</body>
</html>