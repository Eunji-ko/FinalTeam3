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
	#expenditure-table-div{
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
</style>



<main id="draft-wrapper">

	<div id="main-top">
		<div id="write-info">
			<div id="writer-div">
				작성자 : (작성자영역)
			</div>
			<div id="write-date-div">
				작성일 : (작성년월일)
			</div>
		</div>
		<div id="approver-info">
			<div id="approver1">1차</div>
			<div id="approver2">2차</div>
			<div id="approver3">3차</div>
			<div id="approver4">최종</div>
			<div id="approver5">5</div>
			<div id="approver6">6</div>
			<div id="approver7">7</div>
			<div id="approver8">8</div>
			<div id="approver9">9</div>
			<div id="approver10">10</div>
			<div id="approver11">11</div>
			<div id="approver12">12</div>
		</div>
	</div>
	<div id="main-bot">

		<form action="${rootPath}/approval/expenditure" method="post" enctype="multipart/form-data" onsubmit='return approval();'>

			<div id="approval-title-div">
				<div id="approval-title" class="input-group-text">제목</div>
				<input type="text" maxlength="250" class="form-control">
			</div>
			<div id="approval-content-div">
				<div id="expenditure-table-div">
					<div class="table-content-div">
						<div class="th-div input-group-text">적요</div>
						<div class="th-div input-group-text">금액</div>
						<div class="th-div input-group-text">비고</div>
					</div>
					
					<div class="table-content-div" id="etable-div">
						<input type="text" class="form-control" id="name-input" name="brief">
						<input type="number" class="form-control money-form" id="money-input" placeholder="0" min="0" name="amount">
						<input type="text" class="form-control" id="brief-input" name="note">
					</div>
					<div id="eplus-btn-div">
						<button type="button" class="btn" id="eplus-btn">+</button>
					</div>
				</div>
			</div>
				
			<div id="approval-btn-div">
				<input type="file" name="expenditureFile" id="" multiple>
				<input type="hidden" id="return-reason" name="returnReason">
				<button id="approval-btn" class="btn btn-lg">결재</button>
			</div>

		</form>

	</div>

	<script>

		let eidNum = 0;
		$('#eplus-btn').click(function(){
			const eoriDiv = document.querySelector('#etable-div');
			const ebtnDiv = document.querySelector('#eplus-btn-div');
			const enewDiv = eoriDiv.cloneNode(true);
			enewDiv.id = eoriDiv.id + eidNum;
			ebtnDiv.before(enewDiv);
			eidNum++;
			if(eidNum > 5){
				$('#eplus-btn').prop('disabled', true);
			}
		});

	</script>

</main>