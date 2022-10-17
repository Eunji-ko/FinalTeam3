<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #alarm-zone {
        width: 1200px;
        height: 700px;
        margin: 0 auto;
        padding-top: 30px;
    }
    .alarm-delete-btn {
        width: 27px;
    }
    .alarm-delete-btn :hover {
        cursor: pointer;;
    }
    .black-noline {
        text-decoration-line: none;
        color: black;
    }
    #mp-alarm-table {
        margin-bottom: 35px;
    }
    #alarm-page-zone {
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-evenly;
    }
    #alarm-page-zone > a {
        text-decoration: none;
        color: black;
        font-size: 18px;
    }
    .alarm-selected {
        font-weight: bold;
    }
</style>
</head>
<body>
    <div id="alarm-zone">
        <table class="table" id="mp-alarm-table">
            <tr>
                <th>결재</th>
                <td>윤선형[주임]</td>
                <td><a href="${rootPath}/alarm?no=1" class="black-noline">선형대수학 이론에 대한 고찰</a></td>
                <td>09/30</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>결재</th>
                <td>고수학[사원]</td>
                <td><a href="${rootPath}/alarm?no=2" class="black-noline">어떻게 이름이 수학일수가 있는거죠에 대한 결제건</a></td>
                <td>09/30</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>일정</th>
                <td>관리자</td>
                <td><a href="${rootPath}/alarm?no=3" class="black-noline">야유회</a></td>
                <td>09/27</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>게시물</th>
                <td>관리자</td>
                <td><a href="${rootPath}/alarm?no=4" class="black-noline">댓글이 달렸습니다.</a></td>
                <td>09/25</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>업무</th>
                <td>이빤짝[사장]</td>
                <td><a href="${rootPath}/alarm?no=5" class="black-noline">기강좀 잡게나</a></td>
                <td>09/25</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>메일</th>
                <td>허수염[부장]</td>
                <td><a href="${rootPath}/alarm?no=6" class="black-noline">스팸메일 아님 아무튼 아님</a></td>
                <td>09/24</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>근태</th>
                <td>관리자</td>
                <td><a href="${rootPath}/alarm?no=7" class="black-noline">연차 신청이 접수되었습니다.</a></td>
                <td>09/18</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>예약</th>
                <td>총무부</td>
                <td><a href="${rootPath}/alarm?no=8" class="black-noline">회의실 1 예약이 승인되었습니다.</a></td>
                <td>09/09</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>결재</th>
                <td>유승호[사원]</td>
                <td><a href="${rootPath}/alarm?no=9" class="black-noline">이 기능 어떻게 쓰는거에요?</a></td>
                <td>09/08</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>메일</th>
                <td>강소라[차장]</td>
                <td><a href="${rootPath}/alarm?no=10" class="black-noline">내일까지 첨부파일 내용 확인하시고 답장주세요</a></td>
                <td>09/05</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>결재</th>
                <td>윤선형[주임]</td>
                <td><a href="${rootPath}/alarm?no=11" class="black-noline">선형대수학 이론에 대한 고찰</a></td>
                <td>09/30</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>결재</th>
                <td>고수학[사원]</td>
                <td><a href="${rootPath}/alarm?no=12" class="black-noline">어떻게 이름이 수학일수가 있는거죠에 대한 결제건</a></td>
                <td>09/30</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>일정</th>
                <td>관리자</td>
                <td><a href="${rootPath}/alarm?no=13" class="black-noline">야유회</a></td>
                <td>09/27</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>게시물</th>
                <td>관리자</td>
                <td><a href="${rootPath}/alarm?no=14" class="black-noline">댓글이 달렸습니다.</a></td>
                <td>09/25</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
            <tr>
                <th>업무</th>
                <td>이빤짝[사장]</td>
                <td><a href="${rootPath}/alarm?no=15" class="black-noline">기강좀 잡게나</a></td>
                <td>09/25</td>
                <td><div class="alarm-delete-btn" onclick="location.href='${rootPath}/alarm'"><img src="${imgPath}/delete_icon.png" alt="해당 댓글 삭제" width="27px"></div></td>
            </tr>
        </table>
        <div id="alarm-page-zone">
            <!-- <a href="">&lt;</a> -->
            <a href="${rootPath}/member/alarm/p=1" class="alarm-selected">1</a>
            <a href="${rootPath}/member/alarm/p=2">2</a>
            <a href="${rootPath}/member/alarm/p=3">3</a>
            <a href="${rootPath}/member/alarm/p=4">4</a>
            <a href="${rootPath}/member/alarm/p=5">5</a>
            <a href="${rootPath}/member/alarm/next">&gt;</a>
        </div>
    </div>
</body>
</html>