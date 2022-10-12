<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			<div>
                <!--카테고리-->
                <div id="category-wrap">
                    <a class="category" id="report">보고</a>
                    <a class="category">지시</a>
                </div>

                <!--작성 칸-->
                <div>제목</div><div><input type="text"></div>
                <div>수신처</div><div></div>
                <div>참조</div>
                <div>첨부파일</div><div><input type="file"></div>
            </div>
        </main>
    </div>
</body>
</html>