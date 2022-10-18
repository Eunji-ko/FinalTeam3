<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .shadow{
       padding: 20px;
       display: flex;
       flex-direction: row;
       flex-wrap: wrap;
       justify-content: flex-start;
    }

    #top{
        width: 100%;
        height: 10%;
    }
</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			
            <div id="top">
                
            </div>

            <div id="content">
                
            </div>

        </main>
    </div>
</body>
</html>