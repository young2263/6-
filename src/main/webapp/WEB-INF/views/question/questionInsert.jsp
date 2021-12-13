<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/admin/adminMain.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="logo">
			logo <img src="resources/img/logo.png" width="100px" height="100px" />
		</div>
		<div class="admin">관리자 정보</div>
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
			<div class="navbarItem">댓글관리</div>
		</div>
		<div class="content">
			<div class="listTitle">공지사항 관리</div>
			<div class="searchBox">
				<input type="text">
				<button>확인</button>
			</div>
	<h2>게시글 작성하기</h2>
	<form action="questionInsert" method="post" class="tableBox">

	<table>

		<tr>
			<th>제목명</th>
			<td><textarea name="Q_TITLE" type="text"></textarea></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="Q_CONTENT" type="text" id="question_content" cols="62" rows="5"></textarea></td>
		</tr>	
		<tr>
			<td colspan="2"><input class="addBtn" type="submit"></input></td>
		</tr>	
			

	</table>
	</form>

</body>
</html>