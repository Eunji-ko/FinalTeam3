<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
        display: grid;
        grid-template-columns: 1fr 3fr 1fr 1fr;
		
		border: 1px solid black;
	}
	
	#wrap>div{
		border: 1px solid black;
	}

    #title{
        grid-column-start: 2;
        grid-column-end: 4;
    }
	
</style>
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
                <div id="wrap">
	                <div>제목</div><div id="title"><input type="text"></div>
	                <div>수신처</div>
                    <div>
                        <select>
                            <option value="1">부장님</option>
                            <option value="2">대리님</option>
                            <option value="3">사장님</option>
                            <option value="4">이사님</option>
                        </select>
                    </div>
	                <div>참조</div>
                    <div>
                        <select>
                            <option value="1">부장님</option>
                            <option value="2">대리님</option>
                            <option value="3">사장님</option>
                            <option value="4">이사님</option>
                        </select>
                    </div>
	                <div>첨부파일</div><div><input type="file"></div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>