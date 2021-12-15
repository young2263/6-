<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/admin/advertiseMain.css">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="logo">
		<img src="resources/img/loanplan.png" width="200px" height="100px" /> 
		</div>
		<div class="admin"><a href="/loanplan">메인페이지</a></div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">
				<a href="member">사용자관리</a>
			</div>
			<div class="navbarItem">
				<a href="admin">대출상품관리</a>
			</div>
			<div class="navbarItem">
				<a href="advertise">광고관리</a>
			</div>
			<div class="navbarItem">
				<a href="comment">공지사항관리</a>
			</div>
		</div>
		<div class="content">
			<div class="title">
				<h2>공지사항 관리</h2>
			</div>

			<div class="tableBox">
				<table>
					<tr>
						<th>공지사항 번호</th>
						<th>공지사항 제목</th>
						<th>공지사항 내용</th>
					</tr>
					<c:forEach var="vo" items="${commentlist }" varStatus="status">
						<tr>
							<td>${vo.QUESTION_NUM }</td>
							<td>${vo.QUESTION_TITLE }</td>
							<td>${vo.QUESTION_CONTENT }</td>
							<td class="deleteBtn"><a
								href="deleteQuestion?QUESTION_NUM=${vo.QUESTION_NUM}">
									<button>삭제</button>
							</a></td>
						</tr>
					</c:forEach>
				</table>
				<a href="questionAdd">
					<div class="addBtn">추가</div>
				</a>
			</div>
		</div>
	</div>
	</div>

	<script>
		
	</script>
</body>
</html>