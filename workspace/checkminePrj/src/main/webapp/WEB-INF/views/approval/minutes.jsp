<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
	#main-top{
		width : 100%;
		height : 200px;
		display: flex;
	}
	#write-info{
		width : 60%;
		height : 100%;	
		display: grid;
		grid-template-rows: repeat(2, 1fr);
		align-items: center;
	}
	#write-info div{
		color: white;
		width: 90%;
		height: 90%;
		margin: 10px;
		padding: 10px;
		padding-top: 25px;
		padding-left: 20px;
		background-color:#91b3ac;
		border-radius: 15px;
		font-size: 23px;
		align-items: center;
	}
	#approver-info{
		width: 40%;
		height: 100%;
		border-top: 1px solid black;
		border-right: 1px solid black;
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: 1fr 3fr 1fr;
	}
	#approver-info div{
		border-left: 1px solid black;
		border-bottom: 1px solid black;
		padding: 10px;
		text-align: center;
	}
	#approver-info input{
		height: 100%;
		width: 80%;
		border: none;
		margin: none;
		padding: none;
		cursor: default;
	}
	.approver5, .approver6, .approver7, .approver8{
		line-height: 80px;
		font-size: 25px;
	}
	#main-bot{
		height: 80vh;
		margin-top : 30px;
	}
	#approval-title-div{
		height: 10%;
		display : grid;
		grid-template-columns : 1fr 6fr;
		margin-bottom: 15px;
	}
	#approval-title{
		font-size : 20px;
	}
	#approval-content-div{
		height: 80%;
		display: grid;
		grid-template-columns: 1fr 6fr;
		grid-template-rows: 1fr 10fr;
	}
	#approval-content{
		height: 100%;
		grid-column: 1/3;
	}
	.minutes-grid{
		display: grid;
		grid-template-columns: 1fr 6fr;
		grid-template-rows: 1fr 8fr;
	}
	.minutes-grid textarea{
		height: 100%;
		resize: none;
		grid-column: 1/3;
	}
	#approval-btn-div{
		height: 10%;
	}
	#approval-btn{
		color: white;
		background-color: #5d736f;
		margin: auto;
		display: block;
	}
	#minutes-ta{
		height: 200px;
	}
</style>



<main id="draft-wrapper">
	
	<form action="${rootPath}/approval/minutes/${docVo.no}" method="post" enctype="multipart/form-data" onsubmit='return approval();'>
	<div id="main-top">
		<div id="write-info">
			<div id="writer-div">
				작성자 : <input type="text" value="${docVo.writerNo}" name="writerNo" readonly>
			</div>
			<div id="write-date-div">
				작성일 : <input type="text" value="${docVo.date}" name="date" readonly>
			</div>
		</div>
		<div id="approver-info">
			<div id="approver1">1차</div>
			<div id="approver2">2차</div>
			<div id="approver3">3차</div>
			<div id="approver4">최종</div>
			<div class="approver5">${apVo.firstApprover}</div>
			<div class="approver6">${apVo.secondApprover}</div>
			<div class="approver7">${apVo.thirdApprover}</div>
			<div class="approver8">${apVo.finalApprover}</div>
			<div id="approver9"><input type="text" value="${apVo.firstDate}" name="firstDate" readonly></div>
			<div id="approver10"><input type="text" value="${apVo.secondDate}" name="secondDate" readonly></div>
			<div id="approver11"><input type="text" value="${apVo.thirdDate}" name="thirdDate" readonly></div>
			<div id="approver12"><input type="text" value="${apVo.finalDate}" name="finalDate" readonly></div>
		</div>
	</div>
	<div id="main-bot">


		<div id="approval-title-div">
			<div id="approval-title" class="input-group-text">제목</div>
			<input type="text" maxlength="250" class="form-control" name="title" value="${docVo.title}">
		</div>
		<div id="approval-content-div">
			<div id="minutes-purpose" class="input-group-text">목적</div>
			<input type="text" maxlength="500" class="form-control" name="purpose" value="${minutesVo.purpose}">
			<div id="approval-content" class="minutes-grid">
				<div id="minutes-purpose" class="input-group-text">참석자</div>
				<input type="text" maxlength="50" class="form-control" name="emp" value="${minutesVo.emp}">
				<textarea class="form-control" id="minutes-ta" maxlength="2000" name="content">${minutesVo.content}</textarea>
			</div>
			
		</div>
		<div id="approval-btn-div">
			<c:if test="${fileList eq null}">
				<input type="file" name="file" id="" multiple>
			</c:if>
			<c:forEach items="${fileList}" var="list">
				<a download="${list.fileName}" href="${rootPath}/resources/upload/approval/${list.fileName}">${list.fileName}</a>
			</c:forEach>
			<!--반려사유-->
			<input type="hidden" class="return-reason" name="returnReason">
			<!--결재자 번호-->
			<input type="hidden" name="firstApprover" class="first-approver">
			<input type="hidden" name="secondApprover" class="second-approver">
			<input type="hidden" name="thirdApprover" class="third-approver">
			<input type="hidden" name="finalApprover" class="final-approver">
			<button type="submit" id="approval-btn" class="btn btn-lg">결재</button>
		</div>

			
	</div>
		
	</form>
</main>