<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
	#draft-wrapper, form{
		width : 100%;
		height : 100%;
		border: none;
	}
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
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		margin-bottom: 15px;
	}
	#approval-title{
		border-right : 1px solid black;
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
	.form-select{
		height: 100%;
		width: 100%;
		color: white;
		background-color: #5d736f;
	}
	#l-day-div{
		display : grid;
		grid-template-columns : 1fr 5fr;
	}
	#leave-content{
		height: 100%;
		width: 100%;
		display: grid;
		grid-template-columns: 1fr 6fr;
		grid-template-rows: repeat(4, 1fr);
	}
	#leave-apply{
		color: white;
		background-color: #91b3ac;
	}
</style>



<main id="draft-wrapper">

	<form action="${rootPath}/approval/leave/${docVo.no}" method="post" enctype="multipart/form-data" onsubmit='return approval();'>
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
				<input type="text" maxlength="250" class="form-control" value="${docVo.title}">
			</div>
			<div id="approval-content-div">
				<select id="leave-type" class="form-select" name="type">
					<option class="leave-type-option" value="연차">연차</option>
					<option class="leave-type-option" value="반차" id="l-time">반차</option>
					<option class="leave-type-option" value="공가">공가</option>
					<option class="leave-type-option" value="병가">병가</option>
					<option class="leave-type-option" value="특별휴가">특별휴가</option>
				</select>
				<div id="l-day-div">
					<div id="draft-team" class="input-group-text">휴가일수</div>
					<input type="number" min="0" class="form-control" name="lDay">
				</div>
				<div id="approval-content">
					<div id="leave-content">
						<div class="input-group-text">시작일</div>
						<input type="date" name="apply-date" id="start-date" class="form-control" name="begin" value="${leaveVo.begin}">
						<div class="input-group-text">종료일</div>
						<input type="date" name="apply-date" id="end-date" class="form-control" name="end" value="${leaveVo.end}">
						<div class="input-group-text">반차 시간</div>
						<div>
							<select id="l-time-select" class="form-select" name="lTime" disabled>
								<option class="lt-option" value="">없음</option>
								<option class="lt-option" value="오전">오전</option>
								<option class="lt-option" value="오후">오후</option>
							</select>
						</div>
						<div class="input-group-text">신청 연차</div>
						<input type="text" id="leave-apply" class="form-control" value="0" disabled>
					</div>
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

	<script>
		//신청 연차 계산식
		$('input[name=apply-date]').blur(function(){
			var date1 = new Date(document.querySelector('#start-date').value);
			var date2 = new Date(document.querySelector('#end-date').value);
			var applyTime = Math.abs(date1 - date2);
			var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
			if(isNaN(applyDay)==false){
				document.querySelector('#leave-apply').value = applyDay;
			}
		});

		//반차 활성화
		$('#leave-type').blur(function(){
			if($('#leave-type').val() == '반차'){
				$("#l-time-select").prop("disabled", false);
				document.querySelector('#leave-apply').value += 0.5;
			}else{
				$("#l-time-select").prop("disabled", true);
				var date1 = new Date(document.querySelector('#start-date').value);
				var date2 = new Date(document.querySelector('#end-date').value);
				var applyTime = Math.abs(date1 - date2);
				var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
				if(isNaN(applyDay)==false){
					document.querySelector('#leave-apply').value = applyDay;
				}
			}
		});
	</script>

	<c:if test="${levaeVo.type ne null}">
		<script>
			window.onload = function(){
				document.querySelectorAll('.leave-type-option').forEach(function(x){
					if(x.value == '${levaeVo.type}'){
						x.selected = true;
					}else{
						x.selected = false;
						x.disabled = true;
					}
				});
			}
		</script>
	</c:if>

	<c:if test="${levaeVo.lTime ne null}">
		<script>
			window.onload = function(){
				document.querySelectorAll('.lt-option').forEach(function(x){
					if(x.value == '${levaeVo.lTime}'){
						x.selected = true;
					}else{
						x.selected = false;
						x.disabled = true;
					}
				});
			}
		</script>
	</c:if>

	</form>
</main>