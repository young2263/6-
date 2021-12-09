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
						<th>공지사항 번호</th>
                        <th>공지사항 제목</th>
                        <th>공지사항 내용</th>
					</tr>
					<c:forEach var="vo" items="${commentlist }" varStatus="status">
						<tr>
							<td>${vo.Q_NUM }</td>
							<td>${vo.Q_TITLE }</td>
                            <td>${vo.Q_CONTENT }</td>
             </tr>
                        </c:forEach>
				</table>
                <a href="advertiseAdd">
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