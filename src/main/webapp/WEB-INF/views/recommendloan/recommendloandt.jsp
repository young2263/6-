<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name='viewpoint' content='width=device-width, initial-scale=1'>
<title>주택담보대출</title>
<!-- <link rel="stylesheet" href="./resources/css/admin/templatemo.css">   -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
    *{margin:0; padding:0;}
    
</style>

<style>
	.body > aside {
		float:left;
		width: 100%;
	}
	
	input:nth-of-type(1) {display:none;}
	input:nth-of-type(1) ~ div:nth-of-type(1) {display:none;}
	input:nth-of-type(1):checked ~ div:nth-of-type(1) {display:block;}
	
	input:nth-of-type(2) {display:none;}
	input:nth-of-type(2) ~ div:nth-of-type(2) {display:none;}
	input:nth-of-type(2):checked ~ div:nth-of-type(2) {display:block;}
	
	input:nth-of-type(3) {display:none;}
	input:nth-of-type(3) ~ div:nth-of-type(3) {display:none;}
	input:nth-of-type(3):checked ~ div:nth-of-type(3) {display:block;}

/* 탭 모양 */
	aside > label {
		display : block;
		float: left;
		width: 100%; height:30px;
		text-align: center;
		line-height: 30px;
		
		border: 1px solid black;
		box-sizing: border-box;
		
		background-color:white;
		color:blue;
	}
	input:nth-of-type(1):checked ~ label:nth-of-type(1) {
		background-color: blue;
		color: white;
	}
	input:nth-of-type(2):checked ~ label:nth-of-type(2) {
		background-color: blue;
		color: white;
	}
	input:nth-of-type(3):checked ~ label:nth-of-type(3) {
		background-color: blue;
		color: white;
	}
	
	/* 탭 목록 */
	.tab_item .item {
		overflow: hidden;
		padding: 10px;
		border: 1px solid black;
		border-top: none;
	}
	.item .description {
		float:left;
		margin-left: 10px;
		width: 100%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: eclipsis;
	}
</style>
</head>
<body>

	<header>
		<c:choose>
        <c:when test="${voList != null }">
        <div class="logo">logo</div>
        <c:forEach items="${voList}" var="vo">
        	${vo.M_ID }님
        </c:forEach>
        </c:when>
    </c:choose>
	</header>
	
	
	<div class="body">
	
		<div class="content">
			<div class="listTitle">${vo.FIN_PRDT_NM }</div>
			<div>
				<table class="tableBox">
					<c:forEach var="vo" items="${volist }" varStatus="status">
						<tr>
							<td>${vo.RL_IMG }</td>
							<td>${vo.FIN_PRDT_NM }</td>
							<td>${vo.KOR_CO_NM }</td>
							<td>${vo.RL_URL }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
			
<aside>		
	<div class="bodyunder">
        <input type="radio" id="detail" name="tab" checked>
        <input type="radio" id="calculation" name="tab">
        <input type="radio" id="review" name="tab">
        
        <label for="detail">세부 정보</label><label for="calculation">계산기</label><label for="review">리뷰</label>
        
        
        <!-- 세부정보 -->
        <div class="tab_item">
            <ul>
                <li class="item">
        		    <div class="description">
						<b>공시 제출월</b>
                        <br><p>${vo.DCLS_MONTH }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 금리 유형</b>	
						<br><p>${vo.LEND_RATE_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 상환 유형</b>	
						<br><p>${vo.RPAY_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>중도 상환 수수료</b>	
						<br><p>${vo.ERLY_RPAY_FEE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>연체 이자율</b>	
						<br><p>${vo.DLY_RATE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 한도</b>
						<br><p>${vo.LOAN_LMT }</p>
                    </div>
                </li>
            </ul>
		</div>


		<!-- 계산기 -->
        <div class="tab_item">
           <form name="loandata">
	<table>
		<tr>
			<td colspan="3"><b>대출 금액 및 이자율 입력</b></td>
		</tr>
		<tr>
			<td>1)</td>
			<td>대출 금액입력</td>
			<td><input type="text" name="principal" size="12"
				onchange="calculate();"> 원</td>
		</tr>
		<tr>
			<td>2)</td>
			<td>이자율(%)</td>
			<td><input type="text" name="interest" size="12"
				onchange="calculate();"> %</td>
		</tr>
		<tr>
			<td>3)</td>
			<td>대출기간(년)</td>
			<td><input type="text" name="years" size="12"
				onchange="calculate();"> 년</td>
		</tr>
		<!-- <tr>
			<td>4)</td>
			<td>거치기간(년)</td>
			<td><input type="text" name="tyears" size="12"
				onchange="calculate();"> 년</td>
		</tr> -->
		<tr>
			<td colspan="3"><input type="button" value="계산"
				onclick="calculate();"><input type="button" value="다시입력"
				onclick="reset();"></td>
		</tr>
		<tr>
			<td colspan="3"><b>상환내역:</b></td>
		</tr>
		<tr>
			<td>4)</td>
			<td>월상환금</td>
			<td><input type="text" name="payment" size="12"> 원</td>
		</tr>
		<tr>
			<td>5)</td>
			<td>원금 및 이자합계</td>
			<td><input type="text" name="total" size="12"> 원</td>
		</tr>
		<tr>
			<td>6)</td>
			<td>이자금액</td>
			<td><input type="text" name="totalinterest" size="12"> 원</td>
		</tr>
	</table>
</form>
        </div>
        
        
        <!-- 리뷰 -->
        <div class="tab_item">
            <ul>
                <li class="item"><a href="#">
                    <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                    <div class="description"><b>CSS3 Transition</b><p>2021-09-10</p></div></a></li>
                <li class="item"><a href="#">
                    <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                    <div class="description"><b>CSS3 Animation</b><p>2021-09-10</p></div></a></li>
                <li class="item"><a href="#">
                    <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                    <div class="description"><b>CSS3 Border</b><p>2021-09-10</p></div></a></li>
                <li class="item"><a href="#">
                    <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                    <div class="description"><b>CSS3 Box</b><p>2021-09-10</p></div></a></li>
            </ul>
        </div>
        
        
        
	</div>
</aside>
</div>

</body> 
</html>