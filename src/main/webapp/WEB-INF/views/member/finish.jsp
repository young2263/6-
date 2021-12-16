<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>가입 성공</title>
<style>
#content_box {
	width: 460px;
	margin: 0 auto;
	height : 1100px;
}

#nav_ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

#nav_ul li {
	position: relative;
	display: inline-block;
}

#nav_ul #rcl::after {
	position: absolute;
	content: "";
	top: 53px;
	left: -6px;
	width: 6px;
	height: 3px;
	background: rgb(75, 200, 168);
}

.circle {
	background-color: #4bc8a8;
	width: 106px;
	height: 106px;
	border-radius: 100%;
	position: relative;
	text-align: center;
	line-height: 106px;
	color: #FFFFFF;
	font-weight: bold;
}

.yet {
	background-color: #ffffff;
	border: 1px solid #ccc;
	width: 106px;
	height: 106px;
	border-radius: 100%;
	position: relative;
	text-align: center;
	line-height: 106px;
	color: #c0c4c9;
	font-weight: bold;
}

#content {
	border: 1px solid #dae1e6;
	padding: 20px;
	margin-top: 20px;
	text-align: center;
}

#content p {
	color: #9da0a5;
	font-weight: bold;
	font-size: 16px;
}

.btn {
	margin: 0 auto;
	height: 50px;
	width: 200px;
	margin-top: 15px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
	background: #4bc8a8;
	color: #ffffff;
	font-size: 20px;
	font-weight: bold;
}

.btn:hover {
	background: #62cfb4;
}

.btn:active {
	background: #88e0ca;
	top: 2px;
}
</style>
</head>
<%@include file="../header.jsp"%>
<body>
	<div id="content_box">
		<div>
			<h1>LOGO</h1>
			<p style="color: #656a6e;">LOGO에 가입하고 즐거움을 누리세요!</p>
		</div>
		<ul id="nav_ul">
			<li>
				<div class="circle">01 약관동의</div>
			</li>
			<li id="rcl">
				<div class="circle">02 정보입력</div>
			</li>
			<li id="rcl">
				<div class="circle">03 추가인증</div>
			</li>
			<li id="rcl">
				<div class="circle">04 가입완료</div>
			</li>
		</ul>
		<div id="content">
			<h1>
				가입이 <span style="color: #4bc8a8">완료</span>되었습니다.
			</h1>
			<p>
				가입을 환영합니다.
			</p>
			<p>다양하고 즐거운 컨텐츠를 경험해보세요.</p>
			<button class="btn" onclick="location.href='./login.do'">로그인하기</button>
			<button class="btn" onclick="location.href='./'">메인페이지</button>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>