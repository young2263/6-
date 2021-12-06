<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/admin/loanAdd.css">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="logo">
			<!-- <img src="resources/img/logo.png" width="100px" height="100px" /> -->
		</div>
		<div class="admin">관리자 정보</div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">사용자관리</div>
			<div class="navbarItem">
				<a href="admin">대출상품관리</a>
			</div>
			<div class="navbarItem">
				<a href="advertise">광고관리</a>
			</div>
			<div class="navbarItem">댓글관리</div>
		</div>
		<div class="content">
			<div class="title">
				<h2>대출 수정</h2>
			</div>
			<div class="inputBox">
				<form action="loanModify.do" method="post" class="guar_inputBox">
					<!-- 담보대출 input -->
					<table>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr class="num">
							<td><input type="text" name="RL_NUM" value="${vo.RL_NUM}" /></td>
						</tr>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" name="FIN_PRDT_NM" value="${vo.FIN_PRDT_NM}" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><input type="text" name="KOR_CO_NM" value="${vo.KOR_CO_NM}" /></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="text" name="DCLS_MONTH" value="${vo.DCLS_MONTH}" /></td>
						</tr>
						<tr>
							<th>대출금리유형</th>
							<td><input type="text" name="LEND_RATE_TYPE_NM" value="${vo.LEND_RATE_TYPE_NM}" /></td>
						</tr>
						<tr>
							<th>대출상환유형</th>
							<td><input type="text" name="RPAY_TYPE_NM" value="${vo.RPAY_TYPE_NM}" /></td>
						</tr>
						<tr>
							<th>중도상환수수료</th>
							<td><textarea rows="8" cols="85" name="ERLY_RPAY_FEE">${vo.ERLY_RPAY_FEE}</textarea></td>
						</tr>
						<tr>
							<th>연체이자율</th>
							<td><textarea rows="8" cols="85" name="DLY_RATE">${vo.DLY_RATE}</textarea></td>
						</tr>
						<tr>
							<th>대출한도</th>
							<td><input type="text" name="LOAN_LMT" value="${vo.LOAN_LMT}" /></td>
						</tr>
						<tr>
							<th>관련 URL</th>
							<td><input type="text" name="RL_URL" value="${vo.RL_URL}" /></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input class="fileInput" type="text" value="${vo.RL_IMG}" name="RL_IMG" /></td>
						</tr>
						<tr>
							<td colspan="2"><input class="addBtn" type="submit"></input></td>
						</tr>
					</table>
					</c:forEach>
				</form>
			</div>

		</div>
	</div>

	<script>
		
	</script>
</body>
</html>