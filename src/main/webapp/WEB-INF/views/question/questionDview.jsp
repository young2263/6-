<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document.ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${path}/question/deleteQuestion";
				document.form1.submit();
			}		
	});
		
		$("#btnUpdate").click(function(){
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
			document.form1.action="${path}/question/questionUpdate"
			document.for1.submit();
		});
	});	
</script>
</head>
<body>
	<h2>게시글 상세보기</h2>
	<form name="form1" method="post">
		<div>
			제목
			<input name="title" id="title" size="80" value="${Question.q_title }" >			
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80">${Question.q_CONTENT} </textarea>
		</div>
		<div style="width:650px; text-align:center;">
			<input type="hidden" name="Q_NUM" value="${Question.Q_NUM}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</div>
	</form>
</body>
</html>