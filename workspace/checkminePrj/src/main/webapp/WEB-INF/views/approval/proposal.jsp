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
		padding-top: 28px;
		height: 10%;
	}
	#approval-btn{
		color: white;
		background-color: #5d736f;
		margin: auto;
		display: block;
	}
	#proposal-type{
		color: white;
		background-color: #5d736f;
	}
	#account-btn{
		color: white;
		background-color: #5d736f;
		width: 10%;
		height: 100%;
		display: inline;
	}
	#account-name-div{
		width: 90%;
		height: 100%;
		padding-left: 30px;
		display: inline;
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
			<div id="approver1">1</div>
			<div id="approver2">2</div>
			<div id="approver3">3</div>
			<div id="approver4">4</div>
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

		<form action="${rootPath}/approval/proposal" method="post">

			<div id="approval-title-div">
				<div id="approval-title" class="input-group-text">제목</div>
				<input type="text" maxlength="250" class="form-control" name="title">
			</div>
			<div id="approval-content-div">
				<select id="proposal-type" class="form-select" name="proposalType">
				  <option value="제휴">제휴</option>
				  <option value="영업">영업</option>
				  <option value="용역">용역</option>
				  <option value="투자">투자</option>
				  <option value="개발">개발</option>
				  <option value="컨설팅">컨설팅</option>
				  <option value="입점">입점</option>
				</select>
				<!-- Button to Open the Modal -->
				<div id="account-div">
					<button type="button" id="account-btn" class="btn" data-bs-toggle="modal" data-bs-target="#proposal-modal">
						거래처
					</button>
					<div id="account-name-div">(거래처명)</div>
				</div>
				<textarea id="approval-content" class="form-control" maxlength="500" name="content"></textarea>
			</div>
			<div id="approval-btn-div">
				<button id="approval-btn" class="btn btn-lg">결재</button>
			</div>

		</form>

	</div>
	
	
	<%@ include file="/WEB-INF/views/approval/proposal-modal.jsp" %>
	
	
	<script>
		document.querySelector(".dropdown-item").value
	</script>

</main>