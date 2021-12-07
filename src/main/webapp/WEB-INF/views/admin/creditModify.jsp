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
				<h2>대출 추가</h2>
			</div>
			
				<form class="credit_inputBox" action="creditModify.do" method="post">
					<table>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr>
							<th>번호</th>
							<td><input type="text" name="RL_CR_NUM"
								value="${vo.RL_CR_NUM}" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><select name="KOR_CO_NM">
									<option value="신한은행">신한은행</option>
									<option value="국민은행">국민은행</option>
									<option value="우리은행">우리은행</option>
									<option value="새마을은행">새마을은행</option>
									<option value="광주은행">광주은행</option>
									<option value="제주은행">제주은행</option>
									<option value="부산은행">부산은행</option>
									<option value="경남은행">경남은행</option>
							</select></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="text" name="DCLS_MONTH" value="${vo.DCLS_MONTH}" /></td>
						</tr>
						<tr>
							<th>대출종류명</th>
							<td><input type="text" name="CRDT_PRDT_TYPE_NM" value="${vo.CRDT_PRDT_TYPE_NM}"/></td>
						</tr>
						<tr>
							<th>900점초과 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_1}"/>
							</td>
						</tr>
						<tr>
							<th>801~900점 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_4}"/>
							</td>
						</tr>
						<tr>
							<th>701~800점 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_5}"/>
							</td>
						</tr>
						<tr>
							<th>601~700점 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_6}"/>
							</td>
						</tr>
						<tr>
							<th>401~500점 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_10}"/>
							</td>
						</tr>
						<tr>
							<th>301~400점 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_12}"/>
							</td>
						</tr>
						<tr>
							<th>300점 이하 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_13}"/>
							</td>
						</tr>
						<tr>
							<th>평균 금리</th>
							<td>
							<input type="text" name="CRDT_GRAD_1" value="${vo.CRDT_GRAD_AVG}"/>
							</td>
						</tr>
						<tr>
							<th>관련 URL</th>
							<td><input type="text" name="RL_CR_URL" value="${vo.RL_CR_URL}" /></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="text" name="RL_CR_IMG" value="${vo.RL_CR_IMG}"/></td>
						</tr>
						<tr>
							<td colspan="2"><input class="addBtn" type="submit"></input></td>
						</tr>
						</c:forEach>
					</table>
				</form>
				
			</div>

		</div>
	</div>

	<script>
		$(".credit_btn").css("opacity", "1.2");
		$(".guar_btn").css("opacity", "0.5");
		$(".jeon_btn").css("opacity", "0.5");

		$("#selboxDirect").hide();
		for (let i = 1; i < 9; i++) {
			$("#selboxDirect" + i).hide();
		}
		for (let i = 1; i < 9; i++) {
			$("#loanrate" + i).change(function() {
				if ($("#loanrate" + i).val() == "direct") {
					$("#selboxDirect" + i).show();
				} else {
					$("#selboxDirect" + i).hide();
				}
			});
		}
	</script>
</body>
</html>