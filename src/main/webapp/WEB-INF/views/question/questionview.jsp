<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
글보기 페이지 입니다.
	<table border="1" width="500px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
		
			<td>${view.q_num}</td>
		</tr>
		<c:forEach var="row" items="${questionlist}">
		<tr>
			<td>${row.Q_NUM}</td>
			<td><a href="${path}/question/questionDview?Q_NUM=${row.Q_NUM}">${row.Q_TITLE}</a></td>			
		</tr>
		</c:forEach>	
		<tr>
			<td colspan="2">
				<button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>