<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
		</div>
        <table id="m_table">
        	<tr>
                <td>이름</td>
                <td>${vo.m_name}</td>
            </tr>
            <tr>
                <td>아이디</td>
                <td>${vo.m_id}</td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td>${vo.m_phn}</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${vo.m_email}</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>${vo.m_gender}</td>
            </tr>
            <tr>
                <td>직업</td>
                <td>${vo.m_job}</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${vo.m_address}</td>
            </tr>
            <tr>
                <td>(예상) 연봉</td>
                <td>${vo.m_asset}</td>
            </tr>
            <tr>
                <td>(예상) 부채</td>
                <td>${vo.m_debt}</td>
            </tr>
            <tr>
                <td>차량 소지 여부</td>
                <td>${vo.m_car}</td>
            </tr>
            <tr>
                <td>주택 소지 여부</td>
                <td>${vo.m_house}</td>
            </tr>
        </table>
    </div>
</body>
<%@include file="../footer.jsp"%>
</html>