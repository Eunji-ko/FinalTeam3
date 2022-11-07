<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #mp-board-area {
        position: relative;
        width: 1400px;
        height: 730px;
        margin: 0 auto;
    }
    #left-board {
        width: 750px;
        height: 730px;
        border: 10px solid #B0D9D1;
        border-radius: 30px;
        float: left;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 70px;
        padding-bottom: 10px;
    }
    #right-comment {
        margin-left: 40px;
        width: 600px;
        height: 730px;
        border: 10px solid #CFFFF6;
        border-radius: 30px;
        float: left;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 70px;
        padding-bottom: 10px;
    }
    #mp-board-tbl {
        margin-top: 20px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
    }
    .black-noline {
        text-decoration-line: none;
        color: black;
    }
    .mp-board-btn {
        width: 27px;
    }
    .mp-board-btn :hover {
        cursor: pointer;
    }
    .mpb-page-bottom {
        position: absolute;
        bottom: 50px;
        width: 700px;
    }
    #board-page-zone {
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-evenly;
    }
    #board-page-zone > a {
        text-decoration: none;
        color: black;
        font-size: 18px;
    }
    .board-selected {
        font-weight: bold;
    }
    .mpr-page-bottom {
        position: absolute;
        bottom: 50px;
        width: 600px;
    }
    #reply-page-zone {
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-evenly;
    }
    #reply-page-zone > a {
        text-decoration: none;
        color: black;
        font-size: 18px;
    }
    .left-container::-webkit-scrollbar {
        width: 10px;
    }
    .left-container::-webkit-scrollbar-thumb {
        background-color: #769791;
        border-radius: 10px;
    }
    .left-container::-webkit-scrollbar-track {
        background-color: #B0D9D1;
        border-radius: 10px;
    }
    .right-container::-webkit-scrollbar {
        width: 10px;
    }
    .right-container::-webkit-scrollbar-thumb {
        background-color: #769791;
        border-radius: 10px;
    }
    .right-container::-webkit-scrollbar-track {
        background-color: #CFFFF6;
        border-radius: 10px;
    }
</style>
<c:set var="imgPath" value="/checkmine/resources/img/member"/>
</head>
<body>
    <br>
    <div id="mp-board-area">
        <div id="left-board" style="overflow:auto;" class="left-container">
            <h3 style="color: #5D736F">내가 쓴 글</h3>
            <table class="table" id="mp-board-tbl">
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <th><a href="${rootPath}/board/detail/${board.no}" class="black-noline">${board.title}</a></th>
                        <td><a href="${rootPath}/board/detail/${board.no}" class="black-noline">${board.content}</a></td>
                        <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/edit/${board.no}'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                        <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete/${board.type}/${board.no}'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                    </tr>
                </c:forEach>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>dd</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>dd</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
                <tr><td>dd</td><td></td><td></td><td></td></tr>
                <tr><td>d</td><td></td><td></td><td></td></tr>
            </table>
        </div>
        <div id="right-comment" style="overflow:auto;" class="right-container">
            <h3 style="color: #5D736F">내가 쓴 댓글</h3>
            <table class="table" id="mp-board-tbl">
                <c:forEach items="${replyList}" var="reply">
                    <tr>
                        <th><a href="${rootPath}/board/detail/${reply.no}" class="black-noline">${reply.replier}</a></th>
                        <td><a href="${rootPath}/board/detail/${reply.no}" class="black-noline">${reply.content}</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>