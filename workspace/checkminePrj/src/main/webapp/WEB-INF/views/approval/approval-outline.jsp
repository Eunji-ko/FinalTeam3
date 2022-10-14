<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkmine</title>
<style>
    html, body{
        box-sizing: border-box;
    }
    .hr-border {
        margin: 0;
        border: 1px solid #B0D9D1;
    }
    .left-space {
        margin-left: 20px;
    }
    .list-group-horizontal>.list-group-item:first-child, .list-group-horizontal>.list-group-item:last-child {
        border-radius: 0.25rem 0.25rem 0 0;
    }
    .list-group-item.active {
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        border-color: #B0D9D1;
        background-color: white;
        color: #728D89;
    }
    .top-radius-btn {
        border-color: #8D8D8D;
        border-bottom-color: rgba(255, 255, 255, 0);
        background-color: white;
        color: black;
        border-bottom: 0px;
        font-weight: bold;
        font-size: 23px;
        padding: 8px;
        text-align: center;
        padding-left: 12px;
        padding-right: 12px;
    }
    .tab-content>div{
    	padding : 30px;
    }
</style>
</head>
<body>

<div class="d-flex">
    <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
    
    <main class="shadow" id="approval-wrapper">
    
    	<br><br>
	    <div class="list-group list-group-horizontal left-space" id="list-tab" role="tablist">
	        <a class="list-group-item active top-radius-btn" id="list-draft-list" data-bs-toggle="list" href="#list-draft" role="tab" aria-controls="list-draft">기안서</a>
	        <a class="list-group-item top-radius-btn" id="list-proposal-list" data-bs-toggle="list" href="#list-proposal" role="tab" aria-controls="list-proposal">제안서</a>
	        <a class="list-group-item top-radius-btn" id="list-minutes-list" data-bs-toggle="list" href="#list-minutes" role="tab" aria-controls="list-minutes">회의록</a>
	        <a class="list-group-item top-radius-btn" id="list-expenditure-list" data-bs-toggle="list" href="#list-expenditure" role="tab" aria-controls="list-expenditure">지출결의서</a>
	        <a class="list-group-item top-radius-btn" id="list-buy-order-list" data-bs-toggle="list" href="#list-buy-order" role="tab" aria-controls="list-buy-order">구매품의서</a>
	        <a class="list-group-item top-radius-btn" id="list-state-list" data-bs-toggle="list" href="#list-state" role="tab" aria-controls="list-state">전표</a>
	        <a class="list-group-item top-radius-btn" id="list-leave-list" data-bs-toggle="list" href="#list-leave" role="tab" aria-controls="list-leave">휴가</a>
    	</div>
    	<hr class="hr-border">
        <div class="tab-content" id="nav-tabContent">
	        <div class="tab-pane fade show active" id="list-draft" role="tabpanel" aria-labelledby="list-draft-list">
	            <%@ include file="/WEB-INF/views/approval/draft.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-proposal" role="tabpanel" aria-labelledby="list-proposal-list">
	            <%@ include file="/WEB-INF/views/approval/proposal.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-minutes" role="tabpanel" aria-labelledby="list-minutes-list">
	            <%@ include file="/WEB-INF/views/approval/minutes.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-expenditure" role="tabpanel" aria-labelledby="list-expenditure-list">
	            <%@ include file="/WEB-INF/views/approval/expenditure.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-buy-order" role="tabpanel" aria-labelledby="list-buy-order-list">
	            <%@ include file="/WEB-INF/views/approval/buy-order.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-state" role="tabpanel" aria-labelledby="list-state-list">
	            <%@ include file="/WEB-INF/views/approval/state.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-leave" role="tabpanel" aria-labelledby="list-leave-list">
	            <%@ include file="/WEB-INF/views/approval/leave.jsp" %>
	        </div>
    	</div>
		
    </main>
</div>

</body>
</html>