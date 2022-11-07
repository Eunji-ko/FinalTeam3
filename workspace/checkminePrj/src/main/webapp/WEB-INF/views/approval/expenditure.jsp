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
	#expenditure-table-div{
		overflow-y: scroll;
		height: 270px;
		grid-column: 1/3;
		grid-row: 1/3;
	}
	#eplus-btn{
		color: white;
		background-color: #5d736f;
        margin: auto;
		display: block;
        margin-top: 10px;
    }
	#eminus-btn{
		color: white;
		background-color: #5d736f;
        margin: auto;
		display: block;
        margin-top: 10px;
    }
</style>



<main id="draft-wrapper">
	
	<form action="${rootPath}/approval/expenditure/${docVo.no}" method="post" enctype="multipart/form-data" onsubmit='return approval();'>
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
				<div id="expenditure-table-div">
					<div class="table-content-div">
						<div class="th-div input-group-text">적요</div>
						<div class="th-div input-group-text">금액</div>
						<div class="th-div input-group-text">비고</div>
					</div>
					
					<c:if test="${expenditureVo eq null}">
						<div class="table-content-div" id="etable-div">
							<input type="text" class="form-control" id="name-input" name="brief" required>
							<input type="number" class="form-control money-form" id="money-input" value="0" min="0" name="amount" required>
							<input type="text" class="form-control" id="brief-input" name="note">
						</div>
						<div id="eplus-btn-div">
							<button type="button" class="btn" id="eplus-btn">+</button>
							<button type="button" class="btn" id="eminus-btn">-</button>
						</div>
					</c:if>
					<c:forEach items="${expenditureVo}" var="list">
						<div class="table-content-div" id="etable-div">
							<input type="text" class="form-control" id="name-input" name="brief" value="${list.brief}">
							<input type="number" class="form-control money-form" id="money-input" placeholder="0" min="0" name="amount" value="${list.amount}">
							<input type="text" class="form-control" id="brief-input" name="note" value="${list.note}">
						</div>
					</c:forEach>
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
		//금액 안적고 나오면 0원으로
		$('input[type=number]').blur(function(){
			if(this.value == null){
				this.value = 0;
			}
		})

		//칸 추가
		let eidNum = 0;
		$('#eplus-btn').click(function(){
			if(eidNum <10){
				$('#eplus-btn').prop('disabled', false);
				$('#eminus-btn').prop('disabled', false);
				const eoriDiv = document.querySelector('#etable-div');
				const ebtnDiv = document.querySelector('#eplus-btn-div');
				const enewDiv = eoriDiv.cloneNode(true);
				enewDiv.id = eoriDiv.id + eidNum;
				ebtnDiv.before(enewDiv);
				eidNum++;
			}else{
				$('#eplus-btn').prop('disabled', true);
				$('#eminus-btn').prop('disabled', false);
			}
		});
		//칸 삭제
		$('#eminus-btn').click(function(){
			if(eidNum > 0){
				$('#eminus-btn').prop('disabled', false);
				$('#eplus-btn').prop('disabled', false);
				const ebtnDiv = document.querySelector('#eplus-btn-div');
				ebtnDiv.previousSibling.remove();
				eidNum--;
			}else{
				$('#eminus-btn').prop('disabled', true);
				$('#eplus-btn').prop('disabled', false);
			}
		});

	</script>

	</form>
</main>