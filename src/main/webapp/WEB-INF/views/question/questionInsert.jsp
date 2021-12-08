<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	$(document.ready(function(){
		$("#btnSave").click(function(){
			
			var title = $("#title").val();	
			var content = $("#title").val();	
			if(title ==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}	
			if(content ==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			
			
		});
	});	
</script>
</head>
<body>
	<h2>게시글 작성하기</h2>
	<form class="inputBox" method="post" action="questionInsert">
	<table>
	<c:forEach var="vo" items="${volist}" varStatus="status">
		<tr>
			<th>제목명</th>
			<td><input type="text" name="Q_TITLE" value="vo.QUESTION_TITLE}" placeholder="제목을 입력해주세요"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="Q_CONTENT" value="vo.QUESTION_CONTENT}" placeholder="내용을 입력해주세요"/></td>
		</tr>		
			<button type="submit" id="btnSave">등록</button>
			<button type="reset">취소</button>
		</div>
	</c:forEach>
	</table>
	</form>

</body>
</html>