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
	.form-check{
		margin-left: 20px;
	}
	.form-check>input:checked{
		background-color: #5d736f !important;
	}
	#state-name{
		font-size: 25px;
	}
	#state-content{
		height: 100%;
		width: 100%;
		display: grid;
		grid-template-columns: 1fr 6fr;
		grid-template-rows: 1fr 1fr 4fr;
	}
	#state-table-div{
		grid-column: 1/3;
		grid-row: 3/4;
	}
	.spanning{
		display: inline-block;
		margin-top: 5px;
	}
    .table-content-div{
        display: grid;
        grid-template-columns: 1fr 5fr 1fr;
    }
    #plus-btn{
		color: white;
		background-color: #5d736f;
        margin: auto;
		display: block;
        margin-top: 10px;
    }
</style>



<main id="draft-wrapper">
	
	<form action="${rootPath}/approval/state/${docVo.no}" method="post" enctype="multipart/form-data" onsubmit='return approval();'>
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
				<div id="form-check-div" class="form-control">
					<div class="form-check spanning">
						<input class="form-check-input" type="radio" id="in" name="stateRp" value="R" checked>
						<label class="form-check-label" for="in">입금</label>
					</div>
					<div class="form-check spanning">
						<input class="form-check-input" type="radio" id="out" name="stateRp" value="P">
						<label class="form-check-label" for="out">출금</label>
					</div>
				</div>
				<div id="state-name">
					
				</div>
				<div id="approval-content">
					<div id="state-content">
						<div class="input-group-text">거래처</div>
						<input type="text" class="form-control" id="state-account" name="account" value="${stateVo[0].account}">
						<div class="input-group-text">총 금액</div>
						<input type="number" class="form-control" id="money" name="money" min="0" readonly>
						<div id="state-table-div">
							<div class="table-content-div">
								<div class="th-div input-group-text">품목명</div>
								<div class="th-div input-group-text">적요</div>
								<div class="th-div input-group-text">금액</div>
							</div>
							<c:if test="${stateVo eq null}">
								<div class="table-content-div" id="table-div">
									<input type="text" class="form-control" id="name-input" name="stateName">
									<input type="text" class="form-control" id="brief-input" name="stateBrief">
									<input type="number" class="form-control money-form" id="money-input" placeholder="0" min="0" name="stateMoney">
								</div>
								<div id="plus-btn-div">
									<button type="button" class="btn" id="plus-btn">+</button>
								</div>
							</c:if>
							<c:forEach items="${stateVo}" var="list">
								<input type="text" class="form-control" id="name-input" name="name" value="${list.name}">
								<input type="text" class="form-control" id="brief-input" name="brief" value="${list.brief}">
								<input type="number" class="form-control money-form" id="money-input" placeholder="0" min="0" name="money" value="${list.money}">
							</c:forEach>
						</div>
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
		//전표 추가
		let idNum = 0;
		$('#plus-btn').click(function(e){
			const oriDiv = document.querySelector('#table-div');
			const btnDiv = document.querySelector('#plus-btn-div');
			const newDiv = oriDiv.cloneNode(true);
			newDiv.id = oriDiv.id + idNum;
			btnDiv.before(newDiv);
			idNum++;
			if(idNum > 5){
				$('#plus-btn').prop('disabled', true);
			}
		});

		//총 금액 구하기
		$('.money-form').blur(function(){
			var arr = document.querySelector('input[name=stateMoney]').value;
			var result = arr.reduce(function add(sum, currValue) {
			return sum + currValue;
			}, 0);
			if(isNaN(result)){
				$('#money').val(result);
			}
		});
	</script>

	</form>
</main>