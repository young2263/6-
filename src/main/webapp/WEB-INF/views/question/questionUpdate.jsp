<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="inputBox">
		<form action="#" method="post" class="q_inputBox">
			<table>
				<c:forEach var="vo" items="${qlist}" varStatus="status">
				<tr>
					<th>��ȣ</th>
					<td><input type="text" name="Q_NUM" value="${Q_NUM}"/></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="Q_TITLE" value="${Q_TITLE}"/></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="Q_CONTENT" value="${Q_CONTENT}"/></td>
				</tr>
				<tr>
					<td colspan="2"><input class="addBtn" type="submit"></input></td>
				</tr>				
			</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>