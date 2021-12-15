<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>Insert title here</title>
<style>
	#nav_ul ul{
		list-style-type : none;
		text-align : center;
		margin : 0 auto;
	}
	
	#nav_ul li {
		display : inline-block;
	}
	
</style>
</head>
<%@include file="../header.jsp"%>
<body>
	<h1>마이 페이지</h1>
	<ul id="nav_ul">
		<li><a href="/loanplan/myPage">내 정보</a></li>
		<li><a href="/loanplan/updateMyPage">개인정보 수정</a></li>
		<li><a href="/loanplan/updatePwd">비밀번호 변경</a></li>
		<li><a href="/loanplan/deleteMember">회원 탈퇴</a></li>
	</ul>
	<div id="content">
		<div>
			<h3>${vo.m_name} 님의 정보입니다.</h3>
			<h3>회원 탈퇴 페이지입니다.</h3>
		</div>
        <table id="m_table">
        	<button>삭제</button>
        </table>
    </div>
</body>
<%@include file="../footer.jsp"%>
</html>