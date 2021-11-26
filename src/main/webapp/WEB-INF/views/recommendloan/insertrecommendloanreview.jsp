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
			
			document.for1.submit();
		});
	});	
</script>
</head>
<body>
	<h2>게시글 작성하기</h2>
	<form name="form1" method="post" action="${path}/recommendloan/insertrecommendloanreview">
		<div>
			제목
			<input name="title" id="title" size="80" placeholder="제목을 입력해주세요">			
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div style="width:650px; text-align:center;">
			<button type="button" id="btnSave">등록</button>
			<button type="reset">취소</button>
		</div>
	</form>

</body>
</html>