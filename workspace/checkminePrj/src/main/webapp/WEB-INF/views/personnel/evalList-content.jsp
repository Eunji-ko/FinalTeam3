<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    #evalList-area {
        width: 1000px;
        padding-top: 20px;
        height: 800px;
        margin: 0 auto;
    }
    .eval-name-zone {
        text-align: center;
        vertical-align: middle;
        top: 50%;
        font-size: 20px;
        color: #5D736F;
    }
    .container::-webkit-scrollbar {
        width: 10px;
    }
    .container::-webkit-scrollbar-thumb {
        background-color: #769791;
        border-radius: 10px;
    }
    .container::-webkit-scrollbar-track {
        background-color: #bddbd5;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
    }
</style>
<div style="text-align:center; padding-top: 20px;">
    <h1 style="color:#5D736F; font-size: 25px;">'${empName}' 님 사원평가</h1>
</div>
<div id="evalList-area" style="overflow:auto;" class="container">
    <table class="table psn-acc-table">
        <thead>
            <tr>
                <th></th>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="eval" items="${evalList}">
                <tr>
                    <th class="eval-name-zone">* * *</th>
                    <td><textarea class="form-control" rows="3" style="background-color: #B0D9D1; color: #5D736F;" disabled>${eval.content}</textarea></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>