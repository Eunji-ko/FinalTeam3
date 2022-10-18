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
	.buy-order-content{
		display: grid;
		grid-template-columns: 1fr 2fr 1fr 2fr;
		grid-template-rows: repeat(4, 1fr);
	}
	.buy-order-content textarea{
		resize: none;
		grid-column: 1/5;
		grid-row: 4/5;
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

		<form action="${rootPath}/approval/order" method="post" enctype="multipart/form-data" onsubmit='return approval();'>

			<div id="approval-title-div">
				<div id="approval-title" class="input-group-text">제목</div>
				<input type="text" maxlength="250" class="form-control">
			</div>
			<div id="approval-content-div">
				<div class="input-group-text">품의부서</div>
				<input type="text" maxlength="25" class="form-control" name="department" required>
				<div id="approval-content" class="buy-order-content">
					<div class="input-group-text">목적</div>
					<input type="text" maxlength="100" class="form-control" name="conservation">
					<div class="input-group-text">품명</div>
					<input type="text" maxlength="50" class="form-control" name="name" required>
					<div class="input-group-text">수량</div>
					<input type="number" class="form-control" name="amount" min="0" required>
					<div class="input-group-text">단가</div>
					<input type="number" class="form-control" name="price" min="0" required>
					<div class="input-group-text">납품기간</div>
					<input type="date" maxlength="25" class="form-control" name="startDate">
					<div class="input-group-text">완납일자</div>
					<input type="date" maxlength="25" class="form-control" name="endDate">
					<textarea class="form-control" maxlength="250"></textarea>
				</div>
			</div>
			<div id="approval-btn-div">
				<input type="file" name="orderFile" id="" multiple>
				<input type="hidden" id="return-reason" name="returnReason">
				<button id="approval-btn" class="btn btn-lg">결재</button>
			</div>

		</form>

	</div>

</main>