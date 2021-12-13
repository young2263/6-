<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>질문</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

header {
	padding-bottom: 100px;
}

.listTitle {
	text-align: center;
}

table {
	width: 80%;
	text-align: center;
	padding-left: 50px;
	font-size: 20px;
	margin: auto;
	padding-bottom: 40px;
	border-collapse: separate;
	border-spacing: 30px 40px;
	border-bottom: 1px solid gray;
}

tr:first-of-type {
	font-size: 25px;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	border-right: 1px solid gray;
}

a {
	text-decoration-line: none;
}

.paging {
	padding: 50px 20px;
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>

	<header>
		<c:choose>
			<c:when test="${voList != null }">
				<div class="logo">
					logo<img src="resources/img/logo.png" width="100px" height="100px" />
				</div>
				<c:forEach items="${voList}" var="vo">
        	${vo.M_ID }님
        </c:forEach>
			</c:when>
		</c:choose>
	</header>
	<div class="body">

		<div class="content">
			<div class="listTitle" style="color: green"><font size="15px">자주 묻는 질문</font></div>
			<br>
			<br>
			<div>
				<table class="tableBox">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
					</tr>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr>
							<td><a href="questionDview?qnum=${vo.QUESTION_NUM}"
								style="color: black"><font size="5px">${vo.QUESTION_NUM}</font></a></td>
							<td><a href="questionDview?qnum=${vo.QUESTION_NUM}"
								style="color: black"><font size="5px">${vo.QUESTION_TITLE}</font></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<br>
			<br>
			<div class="paging">
				<c:if test="${currentPage<=1}">
                	이전&nbsp;&nbsp;
                </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="qlistST" value="questionlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${qlistST}">이전</a>&nbsp;
				</c:if>
				<c:set var="endPage" value="${maxPage}" />
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="white" size="4"><b style="background-color:green; border-radius: 10px 10px 10px 10px; width:30px; text-align:center;">${p}</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="qlistchk" value="questionlist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${qlistchk}" style="color:black;">${p}</a>&nbsp;&nbsp;&nbsp;
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}"> 
				 다음 
				 </c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="qlistEND" value="questionlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${qlistEND}" style="color:black;">다음</a>&nbsp;&nbsp;&nbsp;
				</c:if>

			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>