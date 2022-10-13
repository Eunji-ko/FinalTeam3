<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
	#draft-wrapper{
		width : 100%;
		height : 100%;
		background-color : darkgray;
	}
	#main-top{
		width : 100%;
		height : 200px;
		background-color : skyblue;
	}
	#write-info{
		width : 35%;
		height : 100%;
		display: grid;
		grid-template-rows: repeat(2, 1fr);
		align-items: center;
		background-color : gray;
	}
</style>



<main id="draft-wrapper">

	<div id="main-top">
		<div id="write-info">
			<div id="writer-div">
				작성자
			</div id="write-date-div">
			<div>
				작성일
			</div>
		</div>
		<div>
		
		</div>
	</div>
	<div id="main-bot">
	
	</div>

</main>