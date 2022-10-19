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
</style>
<c:set var="imgPath" value="/checkmine/resources/img/member"/>
</head>
<body>
    <br>
    <div id="mp-board-area">
        <div id="left-board">
            <h3 style="color: #5D736F">내가 쓴 글</h3>
            <table class="table" id="mp-board-tbl">
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=1" class="black-noline">오늘 저녁 텐동 ㅇㄸ?</a></th>
                    <td><a href="${rootPath}/board/detail?no=1" class="black-noline">역삼역에 나이스 샤워라고 있는데 생각보다 맛...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=1'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=1'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=2" class="black-noline">집 가고 싶어요</a></th>
                    <td><a href="${rootPath}/board/detail?no=2" class="black-noline">으악~!!ㅠㅠㅜㅜ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=2'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=2'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=3" class="black-noline">반려동물 사진 주세요</a></th>
                    <td><a href="${rootPath}/board/detail?no=3" class="black-noline">너무 피곤해서 집중이 안되네요 ㅠㅠ 치유 좀 부...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=3'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no='"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=4" class="black-noline">겜 한판 할 사람??</a></th>
                    <td><a href="${rootPath}/board/detail?no=4" class="black-noline">톡 날려라 ㅎㅎ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=4'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=4'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=5" class="black-noline">오늘 퇴근길에 ㅋㅋㅋ</a></th>
                    <td><a href="${rootPath}/board/detail?no=5" class="black-noline">ㅋㅋㅋㅋㅋㅋ 아 오늘 퇴근길에 길에서 지나가던...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=5'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=5'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=6" class="black-noline">내일부터 운동 시작한다</a></th>
                    <td><a href="${rootPath}/board/detail?no=6" class="black-noline">내일부터 1일차 응애 ㅎㅎ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=6'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=6'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=7" class="black-noline">앵무새 키우고 싶어요 ㅠㅠ 으아...</a></th>
                    <td><a href="${rootPath}/board/detail?no=7" class="black-noline">언젠가는 랜선집사 졸업하고 꼭 분양받겠습...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=7'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=7'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=8" class="black-noline">Gloria Tells - Grow 노래 추천...</a></th>
                    <td><a href="${rootPath}/board/detail?no=8" class="black-noline">글로리아 텔스가 부른 그로우 들어보세요~ ...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=8'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=8'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=9" class="black-noline">아.. 출근하기 싫다 ㅋㅋㅋ</a></th>
                    <td><a href="${rootPath}/board/detail?no=9" class="black-noline">집은 또 언제가냐 ㅋㅋㅋㅋ ㅜㅠㅠ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=9'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=9'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=10" class="black-noline">저희 회사 좋은 회산가요?</a></th>
                    <td><a href="${rootPath}/board/detail?no=10" class="black-noline">아까 검색해봤는데 잡플래닛 평점이 왜이...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/update?no=10'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/board/delete?no=10'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
            </table>
            <div class="mpb-page-bottom">
                <div id="board-page-zone">
                    <!-- <a href="${rootPath}/member/board/?before">&lt;</a> -->
                    <a href="${rootPath}/member/board/?p=1" class="board-selected">1</a>
                    <a href="${rootPath}/member/board?p=2">2</a>
                    <a href="${rootPath}/member/board?p=3">3</a>
                    <a href="${rootPath}/member/board?p=4">4</a>
                    <a href="${rootPath}/member/board?p=5">5</a>
                    <a href="${rootPath}/member/board?next">&gt;</a>
                </div>
            </div>
        </div>
        <div id="right-comment">
            <h3 style="color: #5D736F">내가 쓴 댓글</h3>
            <table class="table" id="mp-board-tbl">
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=1" class="black-noline">우리집 인형이 너무 귀여워요</a></th>
                    <td><a href="${rootPath}/board/detail?no=1" class="black-noline">쫄?</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=1'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=1'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=2" class="black-noline">우리집 인형이 너무 귀여워요</a></th>
                    <td><a href="${rootPath}/board/detail?no=2" class="black-noline">우리집 수리가 더 귀여워요</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=2'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=2'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=3" class="black-noline">집 가고 싶어요</a></th>
                    <td><a href="${rootPath}/board/detail?no=3" class="black-noline">동감..ㅠㅠ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=3'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no='"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=4" class="black-noline">겜 한판 할 사람??</a></th>
                    <td><a href="${rootPath}/board/detail?no=4" class="black-noline">잇츠미 ㅎㅎ 닉네임 불러주세요~!!...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=4'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=4'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=5" class="black-noline">내일부터 운동 시작한다</a></th>
                    <td><a href="${rootPath}/board/detail?no=5" class="black-noline">?? 갑자기요??</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=5'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=5'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=6" class="black-noline">내일부터 운동 시작한다</a></th>
                    <td><a href="${rootPath}/board/detail?no=6" class="black-noline">혹시 헬스장 이쪽에서 다니세요? 강...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=6'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=6'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=7" class="black-noline">앵무새 키우고 싶어요 ㅠ...</a></th>
                    <td><a href="${rootPath}/board/detail?no=7" class="black-noline">언젠가는 랜선집사 졸업하고 꼭 분...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=7'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=7'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=8" class="black-noline">Gloria Tells - Grow  들...</a></th>
                    <td><a href="${rootPath}/board/detail?no=8" class="black-noline">글로리아 텔스가 부른 그로우 들어...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=8'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=8'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=9" class="black-noline">아.. 출근하기 싫다 ㅋㅋㅋ</a></th>
                    <td><a href="${rootPath}/board/detail?no=9" class="black-noline">집은 또 언제가냐 ㅋㅋㅋㅋ ㅜㅠㅠ</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=9'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=9'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
                <tr>
                    <input type="hidden" value="">
                    <th><a href="${rootPath}/board/detail?no=10" class="black-noline">저희 회사 좋은 회산가요?</a></th>
                    <td><a href="${rootPath}/board/detail?no=10" class="black-noline">아까 검색해봤는데 잡플래닛 평...</a></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/update?no=10'"><img src="${imgPath}/update_icon.png" alt="해당 글 수정" width="27px"></div></td>
                    <td><div class="mp-board-btn" onclick="location.href='${rootPath}/reply/delete?no=10'"><img src="${imgPath}/delete_icon.png" alt="해당 글 삭제" width="27px"></div></td>
                </tr>
            </table>
            <div class="mpr-page-bottom">
                <div id="reply-page-zone">
                    <!-- <a href="${rootPath}/member/board/?before">&lt;</a> -->
                    <a href="${rootPath}/member/reply?p=1" class="board-selected">1</a>
                    <a href="${rootPath}/member/reply?p=2">2</a>
                    <a href="${rootPath}/member/reply?p=3">3</a>
                    <a href="${rootPath}/member/reply?p=4">4</a>
                    <a href="${rootPath}/member/reply?p=5">5</a>
                    <a href="${rootPath}/member/reply?next">&gt;</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>