<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">

<style>

	.questiondt {
		width: 100%;
	}
	h2 {
		margin-top: 30px;
		text-align: center;
	}
	
	h1 {
		text-align: center;
	}
</style>

</head>
<body>
<%@include file="../header.jsp"%>
<br><br>

	<div class="questiondt">
	<h2 style="color:green;"><font size="15px">게시글 상세보기</font></h2>
	<form action="question/questionDview" method="get">
		<br><br><br><br>
		<ul>
			 <li class="item">
        		    <div class="description">
						<p style="text-align:center;"><font size="5px">제목</font></p>
                        <br><br><p style="text-align:center; font-weight:bold;"><font size="5em">${question.QUESTION_TITLE }</font></p>
                    </div>
             </li><br><br><br>
             <li class="item">
        		    <div class="description">
						<p style="text-align:center;"><font size="5px">내용</font></p>
						<br><br><p style="border: 5px solid #C9C9C9; padding:0.3em 1em; border-radius:2px; font-weight:bold;"><font size="5em">${question.QUESTION_CONTENT}</font></p>
                    </div>
             </li>
		</ul>
		</form>
	</div>
		
	<%@include file="../footer.jsp"%>
</body>
</html>