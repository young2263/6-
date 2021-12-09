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
<title>LOANPLAN</title>
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
			<div class="title">
				<h3>광고 관리</h3>
			</div>

			<div class="tableBox">
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>핸드폰 번호</th>
						<th>성별</th>
						<th>나이</th>
						<th>자산</th>
						<th>부채</th>
						<th>자산 소유물</th>
					</tr>
					<c:forEach var="vo" items="${memberlist}" varStatus="status">
						<tr>
							<td>${vo.m_id }</td>
							<td>${vo.m_name }</td>
							<td>${vo.m_email }</td>
							<td>${vo.m_phn }</td>
							<td>${vo.m_gender }</td>
							<td>${vo.m_age }</td>
							<td>${vo.m_address }</td>
							<td>${vo.m_asset }</td>
							<td>${vo.m_debt }</td>
							<td>${vo.m_car }${vo.m_house }</td>
							<%-- <td class="deleteBtn"><a href="deleteAdvertise?AD_NUM=${vo.AD_NUM}">
									<button>삭제</button>
								</a></td> --%>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</div>

	<script>
		
	</script>
</body>
</html>