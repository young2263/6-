<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 상세보기</h2>
	<form action="question/questiondt" method="get">
		<h1>자주묻는질문</h1>
		<br><br><br><br>
		<ul>
			 <li class="item">
        		    <div class="description">
						<b>제목</b>
                        <br><br><p><font size="5em">${question.Q_TITLE }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>내용</b>	
						<br><br><p><font size="5em">${question.Q_CONTENT}</font></p>
                    </div>
                </li>
		</ul>
		</form>
		</div>
		
	</form>
</body>
</html>