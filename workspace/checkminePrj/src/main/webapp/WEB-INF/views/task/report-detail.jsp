<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /*카테고리*/
    .nav-tabs{
        margin-top: 40px;
        border-bottom: 1px solid #B0D9D1;
    }
    
    .nav-link {
    	border-top: 1px solid lightgray !important;
    	border-left: 1px solid lightgray !important;
    	border-right: 1px solid lightgray !important;
    	color: lightgray;
    }
    
    /*활성화 카테고리 색상 변경*/
    .active	{
    	margin-left: 40px;
    	border-top: 1px solid #B0D9D1 !important;
    	border-left: 1px solid #B0D9D1 !important;
    	border-right: 1px solid #B0D9D1 !important;
    	color: #B0D9D1 !important;
    }

    #report{
        border: 3px solid #B0D9D1;
        border-bottom: none;
        margin-left: 20px;

        color: #B0D9D1;
        font-weight: bold;
    }

    #table{
        display: grid;
        grid-template-columns: 100px 2fr 100px 2fr 100px 1fr;
        grid-template-rows: 30px 30px 30px 30px 600px;

        margin: 10px auto;
        width:95%;
        height: 90%;
        display: grid;

		border: 1px solid #5D736F;
        border-radius: 10px;
        line-height: 30px;
    }

    .division{
        background-color: #f0f0f0;
        line-height: 30px;
        border-bottom: 1px solid #5D736F;
        
        text-align: center;
        font-weight: 700;
    }

    #title{
        grid-column-start: 2;
        grid-column-end: 5;
    }

    .title{
        border-radius: 10px 0 0 0 ;
    }

    .content{
        grid-column-start: 1;
        grid-column-end: 7;
    }

    .value{
        border-bottom: 1px solid #5D736F;
        padding-left: 10px;
    }

    /*스크롤바 설정*/
    .bot{
        border-bottom: none !important;
        overflow: auto;
    }

    .bot::-webkit-scrollbar {
        width: 8px;  /* 스크롤바의 너비 */
    }

    .bot::-webkit-scrollbar-thumb {
        height: 30%; /* 스크롤바의 길이 */
        background: #D9D9D9; /* 스크롤바의 색상 */
        
        border-radius: 10px;
    }

    .bot::-webkit-scrollbar-track {
        background: white;  /*스크롤바 뒷 배경 색상*/
        border-radius: 0 0 10px;
    }

    /*수정-삭제-목록 버튼*/
    .btn-area {
        display: flex;
        justify-content: right;
        margin-right: 40px;
    }

    .btn-area a {
        margin-left: 10px;
        background-color: #5D736F;
        color: white;
        width: 70px;
        height: 40px;
        border-radius: 30px;
        line-height: 40px;
        text-decoration: none;
        text-align: center;
    }

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/common/side-nav.jsp" %>
        
        <main class="shadow">
			<div id="wrap">
                <!--카테고리-->
				<ul class="nav nav-tabs">
			        <li class="nav-item">
			          <a class="nav-link active" href="${root}/task/report/list">보고</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${root}/task/order/list/1">지시</a>
			        </li>
			    </ul>
                
                <div id="table">
                    <div class="division title">제　목</div><div class="value" id="title">테스트 진행 상황</div>
                    <div class="division">중요도</div>
                    <div class="value">긴급</div>
                    <div class="division">작성자</div><div class="value">테스트 사원</div>
                    <div class="division">부서 / 직위</div><div class="value">영업부 / 대리</div>
                    <div class="division">작성 일시</div><div class="value">2022-10-13 19:40:21</div>
                    <div class="division">수신처</div><div class="value">김 부장, 서 대리</div>
                    <div class="division">참　조</div><div class="value">인사부</div>
                    <div class="division">첨부 파일</div><div class="value"><a href="" download="">테스트 문서 다운로드</a></div>
                    <div class="division content">내용</div>
                    <div class="content value bot">
                        두손을 피에 생의 운다. 낙원을 가슴에 밥을 행복스럽고 하여도 있을 착목한는 칼이다. 넣는 길지 창공에 품었기 것이다. 힘차게 목숨을 가슴이 희망의 있는가? 싹이 곳이 천자만홍이 것이다. 풀이 보배를 이성은 무엇이 희망의 우리는 이것이다. 황금시대를 두손을 보이는 가슴이 방황하여도, 아니더면, 어디 것이 보이는 뿐이다. 미인을 천자만홍이 별과 대고, 행복스럽고 풍부하게 불러 꽃이 보라. 만천하의 불러 주는 인생의 동산에는 피부가 약동하다. 이성은 방황하였으며, 주는 타오르고 있을 이 것이다.

                        구하기 주며, 청춘 것이다. 있으며, 평화스러운 바이며, 목숨이 불러 방지하는 새가 있는가? 인간의 그와 황금시대를 인생을 듣기만 이상, 인생에 이상이 커다란 황금시대다. 용기가 싶이 그와 몸이 이상의 영락과 수 교향악이다. 투명하되 없는 이 그러므로 아름답고 심장은 것이다. 전인 천지는 인생에 우리는 속에서 투명하되 곳이 가슴이 쓸쓸하랴? 공자는 많이 싸인 이상의 그림자는 자신과 우는 불어 듣는다. 따뜻한 현저하게 불어 피가 그들을 있음으로써 듣는다. 우리 싶이 사라지지 그러므로 것이다. 동력은 품으며, 용감하고 가장 얼음이 아니다.
                        
                        불어 황금시대의 새 이상은 전인 착목한는 부패뿐이다. 못할 그들에게 따뜻한 풍부하게 위하여, 운다. 열매를 대중을 방황하였으며, 황금시대의 인간의 관현악이며, 무엇을 갑 사막이다. 대한 내려온 튼튼하며, 얼마나 살 뿐이다. 따뜻한 풀이 얼음에 것이다. 인간은 천고에 아름답고 아니한 우리는 속에서 교향악이다. 얼마나 속에서 청춘의 예가 약동하다. 새가 때까지 있는 하였으며, 설레는 청춘은 기쁘며, 것이 위하여서. 앞이 얼음 싶이 것은 착목한는 넣는 새가 사막이다.
                        
                        오직 웅대한 희망의 튼튼하며, 같이, 칼이다. 못할 우는 더운지라 우리 몸이 품었기 사람은 주며, 그리하였는가? 방지하는 충분히 그들의 칼이다. 동력은 뼈 모래뿐일 힘차게 가슴이 앞이 것이다. 작고 위하여 인생에 밥을 소금이라 있는가? 눈이 충분히 찬미를 하는 곳이 생명을 약동하다. 인간이 거친 청춘은 풍부하게 따뜻한 불어 되는 칼이다. 소담스러운 현저하게 더운지라 속에 봄바람이다. 고동을 하는 노년에게서 가슴에 하여도 예수는 봄바람이다. 같이 않는 없는 유소년에게서 전인 위하여서 놀이 그러므로 사막이다. 그들은 것은 우리 몸이 거선의 미인을 천하를 때문이다.
                        
                        원대하고, 가는 봄날의 때에, 같은 부패를 공자는 아름다우냐? 설산에서 장식하는 따뜻한 대중을 그러므로 말이다. 곧 피고, 되려니와, 튼튼하며, 있는가? 봄바람을 용기가 곧 이상의 용감하고 봄바람이다. 이상 피가 가는 있으랴? 이것이야말로 무한한 간에 자신과 싸인 동력은 인도하겠다는 그리하였는가? 싹이 찾아 이상, 가는 눈이 이성은 있다. 그것을 눈이 따뜻한 같이 이상의 주며, 쓸쓸하랴? 찬미를 충분히 되는 피가 위하여서 부패뿐이다.
                        
                        그들에게 평화스러운 가슴에 놀이 오직 말이다. 미인을 인생을 낙원을 그들의 청춘의 주며, 품에 피다. 몸이 크고 같이 따뜻한 힘차게 아니다. 싹이 불어 커다란 대한 착목한는 피에 열락의 부패뿐이다. 가지에 못할 속잎나고, 충분히 영원히 피부가 들어 것이다. 아름답고 같이, 얼마나 원질이 긴지라 대고, 이것이다. 황금시대를 눈이 되려니와, 능히 하는 같으며, 하여도 피어나기 것이다. 풍부하게 날카로우나 밝은 있다. 그들의 고행을 찾아 인간의 이상은 말이다. 가슴에 얼음에 꽃이 거선의 속에서 피고, 맺어, 얼마나 이 것이다.
                        두손을 피에 생의 운다. 낙원을 가슴에 밥을 행복스럽고 하여도 있을 착목한는 칼이다. 넣는 길지 창공에 품었기 것이다. 힘차게 목숨을 가슴이 희망의 있는가? 싹이 곳이 천자만홍이 것이다. 풀이 보배를 이성은 무엇이 희망의 우리는 이것이다. 황금시대를 두손을 보이는 가슴이 방황하여도, 아니더면, 어디 것이 보이는 뿐이다. 미인을 천자만홍이 별과 대고, 행복스럽고 풍부하게 불러 꽃이 보라. 만천하의 불러 주는 인생의 동산에는 피부가 약동하다. 이성은 방황하였으며, 주는 타오르고 있을 이 것이다.

                        구하기 주며, 청춘 것이다. 있으며, 평화스러운 바이며, 목숨이 불러 방지하는 새가 있는가? 인간의 그와 황금시대를 인생을 듣기만 이상, 인생에 이상이 커다란 황금시대다. 용기가 싶이 그와 몸이 이상의 영락과 수 교향악이다. 투명하되 없는 이 그러므로 아름답고 심장은 것이다. 전인 천지는 인생에 우리는 속에서 투명하되 곳이 가슴이 쓸쓸하랴? 공자는 많이 싸인 이상의 그림자는 자신과 우는 불어 듣는다. 따뜻한 현저하게 불어 피가 그들을 있음으로써 듣는다. 우리 싶이 사라지지 그러므로 것이다. 동력은 품으며, 용감하고 가장 얼음이 아니다.

                        불어 황금시대의 새 이상은 전인 착목한는 부패뿐이다. 못할 그들에게 따뜻한 풍부하게 위하여, 운다. 열매를 대중을 방황하였으며, 황금시대의 인간의 관현악이며, 무엇을 갑 사막이다. 대한 내려온 튼튼하며, 얼마나 살 뿐이다. 따뜻한 풀이 얼음에 것이다. 인간은 천고에 아름답고 아니한 우리는 속에서 교향악이다. 얼마나 속에서 청춘의 예가 약동하다. 새가 때까지 있는 하였으며, 설레는 청춘은 기쁘며, 것이 위하여서. 앞이 얼음 싶이 것은 착목한는 넣는 새가 사막이다.

                        오직 웅대한 희망의 튼튼하며, 같이, 칼이다. 못할 우는 더운지라 우리 몸이 품었기 사람은 주며, 그리하였는가? 방지하는 충분히 그들의 칼이다. 동력은 뼈 모래뿐일 힘차게 가슴이 앞이 것이다. 작고 위하여 인생에 밥을 소금이라 있는가? 눈이 충분히 찬미를 하는 곳이 생명을 약동하다. 인간이 거친 청춘은 풍부하게 따뜻한 불어 되는 칼이다. 소담스러운 현저하게 더운지라 속에 봄바람이다. 고동을 하는 노년에게서 가슴에 하여도 예수는 봄바람이다. 같이 않는 없는 유소년에게서 전인 위하여서 놀이 그러므로 사막이다. 그들은 것은 우리 몸이 거선의 미인을 천하를 때문이다.

                        원대하고, 가는 봄날의 때에, 같은 부패를 공자는 아름다우냐? 설산에서 장식하는 따뜻한 대중을 그러므로 말이다. 곧 피고, 되려니와, 튼튼하며, 있는가? 봄바람을 용기가 곧 이상의 용감하고 봄바람이다. 이상 피가 가는 있으랴? 이것이야말로 무한한 간에 자신과 싸인 동력은 인도하겠다는 그리하였는가? 싹이 찾아 이상, 가는 눈이 이성은 있다. 그것을 눈이 따뜻한 같이 이상의 주며, 쓸쓸하랴? 찬미를 충분히 되는 피가 위하여서 부패뿐이다.

                        그들에게 평화스러운 가슴에 놀이 오직 말이다. 미인을 인생을 낙원을 그들의 청춘의 주며, 품에 피다. 몸이 크고 같이 따뜻한 힘차게 아니다. 싹이 불어 커다란 대한 착목한는 피에 열락의 부패뿐이다. 가지에 못할 속잎나고, 충분히 영원히 피부가 들어 것이다. 아름답고 같이, 얼마나 원질이 긴지라 대고, 이것이다. 황금시대를 눈이 되려니와, 능히 하는 같으며, 하여도 피어나기 것이다. 풍부하게 날카로우나 밝은 있다. 그들의 고행을 찾아 인간의 이상은 말이다. 가슴에 얼음에 꽃이 거선의 속에서 피고, 맺어, 얼마나 이 것이다.
                    </div>
                </div>
                <div class="btn-area">
                    <a href="${root}/task/report/edit">수정</a>
                    <a href="">삭제</a>
                    <a href="${root}/task/report/list/1">목록</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>