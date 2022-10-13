<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #main-area {
        width: 1450px;
        margin: 0 auto;
    }
    #mem-content {
        width: 330px;
        height: 800px;
        border-radius: 25px;
        padding: 20px;
        padding-top: 50px;
        float: left;
        background-color: #C4F2EA;
    }
    #profile-img {
        margin: 0 auto;
        width: 180px;
        height: 180px;
        border-radius: 100px;
        background-color: white;
        margin-bottom: 15px;
    }
    #profile-tag {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
    }
    #main-content {
        width: 1070px;
        height: 750px;
        float: right;
        vertical-align: middle;
    }
    #main-content1f {
        width: 100%;
        height: 350px;
        display: grid;
        grid-template-columns: 650px 350px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content2f {
        width: 100%;
        height: 350px;
        display: grid;
        grid-template-columns: 550px 450px;
        grid-template-rows: 350px;
        align-content: center;
        gap: 50px;
    }
    #main-content1f > div, #main-content2f > div {
        border: 1px solid #C2C2C2;
    }
</style>
</head>
<body>
    <br>
    <div id="main-area">
        <div id="mem-content">
            <div id="profile-img">
            </div>
            <div id="profile-tag">
                테스트 사원
            </div>
        </div>
        <br>
        <div id="main-content">
            <div id="main-content1f">
                <div></div>
                <div></div>
            </div>
            <br><br>
            <div id="main-content2f">
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    <br>
</body>
</html>