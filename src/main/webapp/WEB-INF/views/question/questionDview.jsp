<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">

</head>
<body>
<%@include file="../header.jsp"%>
	<h2>게시글 상세보기</h2>
	<form action="question/questiondt" method="get">
		<h1>자주묻는질문</h1>
		<br><br><br><br>
		<ul>
			 <li class="item">
        		    <div class="description">
						<b>제목</b>
                        <br><br><p><font size="5em">${question.QUESTION_TITLE }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>내용</b>	
						<br><br><p><font size="5em">${question.QUESTION_CONTENT}</font></p>
                    </div>
                </li>
		</ul>
		</form>
		</div>
		
	</form>
	<%@include file="../footer.jsp"%>
</body>
</html>