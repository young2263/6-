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
			<div class="listTitle">주택 담보 대출</div>
			<div>
				<table class="tableBox">
					<tr>
						<th></th>
						<br>
						<th>대출상품명</th>
						<br>
						<th>은행</th>
						<br>
						<th>은행 사이트</th>
						<br>
						<th>공시 제출월</th>
						<br>
						<th>대출 금리 유형</th>
						<br>
						<th>대출 상환 유형</th>
						<br>
						<th>중도 상환 수수료</th>
						<br>
						<th>연체 이자율</th>
						<br>
						<th>대출 한도</th>
					</tr>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr>
							<td>${vo.RL_IMG }</td>
							<td>${vo.FIN_PRDT_NM }</td>
							<td>${vo.KOR_CO_NM }</td>
							<td>${vo.RL_URL }</td>
							<td>${vo.DCLS_MONTH }</td>
							<td>${vo.LEND_RATE_TYPE_NM }</td>
							<td>${vo.RPAY_TYPE_NM }</td>
							<td>${vo.ERLY_RPAY_FEE }</td>
							<td>${vo.DLY_RATE }</td>
							<td>${vo.LOAN_LMT }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>


</body> 
</html>