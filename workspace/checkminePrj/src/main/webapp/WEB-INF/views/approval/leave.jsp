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

	<form action="${rootPath}/approval/leave/${docVo.no}" method="post" enctype="multipart/form-data" onsubmit='return leaveApproval();'>
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
				<select id="leave-type" class="form-select" name="type">
					<option class="leave-type-option" value="연차">연차</option>
					<option class="leave-type-option" value="반차" id="l-time">반차</option>
					<option class="leave-type-option" value="공가">공가</option>
					<option class="leave-type-option" value="병가">병가</option>
					<option class="leave-type-option" value="특별휴가">특별휴가</option>
				</select>
				<div id="l-day-div">
					<div id="draft-team" class="input-group-text">휴가일수(무급휴가 포함)</div>
					<input type="number" id="l-day" min="0" step="0.5" class="form-control" name="leaveDay" value="${leaveVo.leaveDay}">
				</div>
				<div id="approval-content">
					<div id="leave-content">
						<div class="input-group-text">시작일</div>
						<input type="date" id="start-date" class="form-control apply-date" name="begin" value="${leaveVo.begin}" required>
						<div class="input-group-text">종료일</div>
						<input type="date" id="end-date" class="form-control apply-date" name="end" value="${leaveVo.end}" required>
						<div class="input-group-text">반차 시간</div>
						<div>
							<select id="l-time-select" class="form-select" name="leaveTime" disabled>
								<option class="lt-option" value="" id="no-l-time">없음</option>
								<option class="lt-option" value="오전">오전</option>
								<option class="lt-option" value="오후">오후</option>
							</select>
						</div>
						<div class="input-group-text">신청 연차</div>
						<input type="number" id="leave-apply" name="apply" step="0.5" class="form-control" min="0" value="${leaveVo.apply}" readonly>
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

	<c:if test="${leaveVo eq null}">
	<script>
		//무급휴가 확인 함수
		function leaveApproval(){
			if(($('#l-day').val() > $('#leave-apply').val()) || ($('#l-day').val()%1 == 0.5 && $('#l-day').val() > 0.5)){
				if(confirm('무급휴가가 포함되어 있는 것이 맞습니까?')){
					if($('#leave-apply').val() > 0.5 && $('#leave-type').val() == '반차'){
						$('#leave-apply').val(0.5);
					}
					return approval();
				}else{
					return false;
				}
			}else if($('#l-day').val() < $('#leave-apply').val()){
				alert('휴가일은 연차일보다 작을 수 없습니다.');
				$('#l-day').val($('#leave-apply').val());
				return false;
			}else{
				return approval();
			}
		}

		//오늘 이후 선택
		$('#start-date').blur(function(){
			var today = new Date();
			var date1 = new Date(document.querySelector('#start-date').value);
			var date2 = new Date(document.querySelector('#end-date').value);
			if(document.querySelector('#start-date').value < today.toISOString().slice(0, 10)){
				alert('휴가는 오늘 이후만 가능합니다.');
				document.querySelector('#start-date').value = today.toISOString().slice(0, 10);
				return;
			}
			if(date2 < date1){
				alert('종료일은 시작일 이후만 가능합니다.');
				document.querySelector('#end-date').value = date1.toISOString().slice(0, 10);
				return;
			}
		});
		$('#end-date').blur(function(){
			var today = new Date();
			var date1 = new Date(document.querySelector('#start-date').value);
			var date2 = new Date(document.querySelector('#end-date').value);
			if(document.querySelector('#end-date').value < today.toISOString().slice(0, 10)){
				alert('휴가는 오늘 이후만 가능합니다.');
				document.querySelector('#end-date').value = today.toISOString().slice(0, 10);
				return;
			}else if(date2 < date1){
				alert('종료일은 시작일 이후만 가능합니다.');
				document.querySelector('#end-date').value = date1.toISOString().slice(0, 10);
				return;
			}
		});

		//신청 연차 계산식
		$('.apply-date').blur(function(){
			var date1 = new Date(document.querySelector('#start-date').value);
			var date2 = new Date(document.querySelector('#end-date').value);
			var applyTime = Math.abs(date1 - date2);
			var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
			if(isNaN(applyDay)==false){
				if(applyDay > $('#l-day').val()){
					$('#l-day').val(applyDay);
				}
				document.querySelector('#leave-apply').value = applyDay;
			}
			//하루 반차일 때
			if((date1 == date2) && ($('#leave-type').val() == '반차')){
				document.querySelector('#leave-apply').value = 0.5;
			}
		});

		//반차 활성화
		$('#leave-type').blur(function(){
			if($('#leave-type').val() == '반차'){//반차일때
				$("#l-time-select").prop("disabled", false);
				$('#no-l-time').prop('disabled',true);
				var date1 = new Date(document.querySelector('#start-date').value);
				var date2 = new Date(document.querySelector('#end-date').value);
				var applyTime = Math.abs(date1 - date2);
				var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
				if(isNaN(applyDay)==false){
					document.querySelector('#leave-apply').value = Number(applyDay) - Number(0.5);
				}
				if($('#leave-apply').val() > $('#l-day').val()){
					$('#l-day').val($('#leave-apply').val());
				}
				$("#l-time-select").prop("required", true);
			}else{//아닐때
				$("#l-time-select").prop("disabled", true);
				$("#l-time-select").prop("required", false);
				$('#no-l-time').prop('disabled',false);
				$('#no-l-time').prop('selected',true);
				var date1 = new Date(document.querySelector('#start-date').value);
				var date2 = new Date(document.querySelector('#end-date').value);
				var applyTime = Math.abs(date1 - date2);
				var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
				if(isNaN(applyDay)==false){
					document.querySelector('#leave-apply').value = applyDay;
				}
			}
		});

		//반차 클릭할때
		$('#l-time-select').blur(function(){
			var date1 = new Date(document.querySelector('#start-date').value);
			var date2 = new Date(document.querySelector('#end-date').value);
			var applyTime = Math.abs(date1 - date2);
			var applyDay = Math.ceil(applyTime/(1000*60*60*24))+1;
			if(isNaN(applyDay)==false){
				document.querySelector('#leave-apply').value = Number(applyDay) - Number(0.5);
			}
			if($('#leave-apply').val() > $('#l-day').val()){
				$('#l-day').val($('#leave-apply').val());
			}
			if($('#leave-apply').val() > 0.5 && $('#leave-type').val() == '반차'){
				$('#leave-apply').val(0.5);
			}
			$("#l-time-select").prop("required", true);
		});
		
	</script>
	</c:if>

	<c:if test="${leaveVo ne null}">
		<script>
			//바로 결재함수로
			function leaveApproval(){
				return approval();
			}

			//타입 옵션 보여주기
			window.onload = function(){
				document.querySelectorAll('.leave-type-option').forEach(para => {
					if(para.value == "${leaveVo.type}"){
						para.selected = true;
					}else{
						para.selected = false;
						para.disabled = true;
					}
				});
			}
		</script>
	</c:if>

	<c:if test="${leaveVo.leaveTime ne null}">
		<script>
			//반차 옵션 보여주기
			$("#l-time-select").prop("disabled", false);
			document.querySelectorAll('.lt-option').forEach(sele => {
				if(sele.value == "${leaveVo.leaveTime}"){
					sele.selected = true;
				}else{
					sele.selected = false;
					sele.disabled = true;
				}
			});
		</script>
	</c:if>

	</form>
</main>