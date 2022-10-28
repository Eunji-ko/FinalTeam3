<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/adminCommon/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHECKMINE 사원관리</title>
<style>


    main > div {
        width: 1389px;
        margin: 10px auto;
    }
    
    #area1{
        height: 65px;
        display: flex;
        justify-content:left;
        align-items: center;
    }
    
    #header{
        font-size: 20px;
        font-weight: bolder;
    }
    #area2{
        margin: 100px auto;
    }
    #chart_div{
        height: 400px;
        margin: 200px auto;
    }
    #chart_div *{
        line-height: 50px;
    }
    .google-visualization-orgchart-node{
        width: 100px;
    }
    

    

</style>
</head>
<body>
	<div class="d-flex">
        <%@ include file="/WEB-INF/views/adminCommon/adminSide-nav.jsp" %>
        
        <main class="shadow">
            <div id="area1">
                <span id="header">조직도</span>
            </div>
            <div id="area2">
                <div id="chart_div"></div>
            </div>
          
        </main>
    </div>

    <!--구글 OrgChart 적용-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {packages:["orgchart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');

        data.addRows([
          [{'v':'김사장', 'f':'김사장<div style="color:red; font-style:italic">President</div>'},
           '', 'The President'],
          ['인사부', '김사장', ''],
          ['총무부', '김사장', ''],
          ['회계부', '김사장', ''],
          ['영업부', '김사장', ''],
          ['마케팅부', '김사장', ''],
          

          [{'v':'사원', 'f':'사원<div style="color:blue; font-style:italic">${chart.get(0).get("CNT")}명</div>'}, '', ''],
          [{'v':'주임', 'f':'주임<div style="color:blue; font-style:italic">${chart.get(1).get("CNT")}명</div>'}, '', ''],
          [{'v':'대리', 'f':'대리<div style="color:blue; font-style:italic">${chart.get(2).get("CNT")}명</div>'}, '', ''],
          [{'v':'과장', 'f':'과장<div style="color:blue; font-style:italic">${chart.get(3).get("CNT")}명</div>'}, '', ''],
          [{'v':'차장', 'f':'차장<div style="color:blue; font-style:italic">${chart.get(4).get("CNT")}명</div>'}, '', ''],
          [{'v':'부장', 'f':'부장<div style="color:blue; font-style:italic">${chart.get(5).get("CNT")}명</div>'}, '', ''],
        ]);

        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        chart.draw(data, {allowHtml:true});
      }
   </script>        
</body>
</html>