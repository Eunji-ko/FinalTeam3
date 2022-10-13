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
	        <a class="list-group-item top-radius-btn" id="list-account-list" data-bs-toggle="list" href="#list-account" role="tab" aria-controls="list-account">2</a>
    	</div>
    	<hr class="hr-border">
        <div class="tab-content" id="nav-tabContent">
	        <div class="tab-pane fade show active" id="list-draft" role="tabpanel" aria-labelledby="list-draft-list">
	            <%@ include file="/WEB-INF/views/approval/draft.jsp" %>
	        </div>
	        <div class="tab-pane fade" id="list-account" role="tabpanel" aria-labelledby="list-account-list">
	            
	        </div>
    	</div>
		
    </main>
</div>

</body>
</html>