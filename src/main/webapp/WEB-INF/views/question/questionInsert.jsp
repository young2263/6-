<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
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