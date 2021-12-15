<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<link rel="apple-touch-icon" href="resources/img/apple-icon.png">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">


<title>로그인</title>
<style>
#bg {
	background-color : rgb(247, 250, 249);
}

#content_box {
	width: 460px;
	margin: 0 auto;
	height : 1100px;
}


.logo {
	width: 460px;
	margin: 0 auto;
	margin-top: 0px;
	max-height: 280px;
	overflow: hidden;
}

.logo img {
	max-height: initial;
	margin-top: 10%;
	margin-bottom: 0%;
}

.logo img {
	width: 460px;
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

.checkbox ul {
	list-style-type: none;
	padding: 0;
}

.checkbox ul li {
	margin-bottom: 10px;
}

#content {
	border: 1px solid #dae1e6;
	padding: 20px;
	background-color : #ffffff;
}

.span {
	text-align: center;
	color: #8F9194;
	font-size: 14px;
	margin-bottom: 0px;
}

button {
	margin: 0 auto;
	height: 60px;
	width: 416px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
}

.nextBtn {
	background: #D4472F;
	color: #ffffff;
	font-size: 20px;
}

.nextBtn:hover {
	background: #F65736;
}

.nextBtn:active {
	background: #872210;
	top: 2px;
}

.input {
	margin: 0 auto;
	height: 50px;
	width: 410px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid rgb(237, 237, 237);
}

.session ul {
	display: inline;
}

.session ul li {
	list-style-type: none;
	float: left;
	color: #8F9194;
}

#menu {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

#menu li {
	position: relative;
	display: inline-block;
	margin-right: 20px;
}

#menu li::before {
	content: "|";
	display: block;
	width: 1px;
	height: 12px;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto 0;
}

#menu #rcl::after {
	position: absolute;
	content: "";
	top: 53px;
	left: -6px;
	width: 6px;
	height: 3px;
	background: rgb(75, 200, 168);
}

#ctn {
	padding-bottom: 30px;
	margin: 0 auto;
}

.text li {
	float: left;
	margin-left: 10px;
	list-style: none
}

.text li::before {
	content: "|";
	padding-right: 10px;
	color: #8F9194;
}

.text li:first-child::before {
	content: none
}

.text li a {
	text-decoration: none;
	color: #8F9194;
}
</style>
</head>
<%@include file="../header.jsp"%>
<body>
<div id="bg">
	<div id="content_box">
		<div class="logo">
			<img src="resources/img/loanplan.png">
		</div>
		<div id="content">
			<form method="post" name="login_frm">
				<div>
					<input class="input" type="text" id="m_id" name="m_id" placeholder="아이디">
					<br>
					<input class="input" type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호">
					<button id="login_submit" class="nextBtn" onclick="loginChk()">로그인</button>
					<c:if test="${msg == 'failure'}">
						<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
				</div>
			</form>
			<div class="session">
				<ul>
					<li>
						<input type="checkbox" name="terms" id="term1">
						<label for="term1">로그인 상태 유지</label>
					</li>
					<li>
						<input type="checkbox" name="terms" id="term2">
						<label for="term2">아이디 저장</label>
					</li>
				</ul>
			</div>
			<br>
			<hr>
			<br>
			<div class="login-box">
				<p class="span">또는 아래 계정 인증을 통한 회원가입</p>
				<br>
				<div class="naver_id_login">
					<button>
						<a href="${url}">
							<img src="resources/img/naver.png">
						</a>
					</button>
					<br>
				</div>

				<div class="kakaobtn">
					<button onclick="kakaoLogin();">
						<a href="javascript:void(0)">
							<img src="resources/img/kakao.png">
						</a>
					</button>
					<br>
				</div>
				<button>
					<img src="resources/img/google.png">
				</button>
			</div>
			<script>
		            function loginChk() {
		                var form = document.login_frm;
		                if (!form.m_id.value) {
		                    alert("아이디를 입력해 주십시오.");
		                    form.m_id.focus();
		                    return false;
		                }
		             
		                if (!form.m_pwd.value) {
		                    alert("비밀번호를 입력해 주십시오.");
		                    form.m_pwd.focus();
		                    return;
		                }
		                form.action="/loanplan/login";
		                form.submit();
		            }
	        </script>
			<script>
					Kakao.init('506da0d75242102b7265d18af802837d'); //발급받은 키 중 javascript키를 사용해준다.
					console.log(Kakao.isInitialized()); // sdk초기화여부판단
					//카카오로그인
					function kakaoLogin() {
					    Kakao.Auth.login({
					      success: function (response) {
					        Kakao.API.request({
					          url: '/v2/user/me',
					          success: function (response) {
					        	  const email = 
					        	  console.log(response)
					          },
					          fail: function (error) {
					            console.log(error)
					          },
					        })
					      },
					      fail: function (error) {
					        console.log(error)
					      },
					   })
					 }
					
					//카카오로그아웃  
					function kakaoLogout() {
					    if (Kakao.Auth.getAccessToken()) {
					      Kakao.API.request({
					        url: '/v1/user/unlink',
					        success: function (response) {
					        	console.log(response)
					        },
					        fail: function (error) {
					          console.log(error)
					        },
					      })
					      Kakao.Auth.setAccessToken(undefined)
					    }
					  }  
			</script>
			
			<div id="ctn">
				<ul class="text">
					<li><a href="/loanplan/findId">아이디 찾기</a></li>
					<li><a href="/loanplan/findPwd">비밀번호 찾기</a></li>
					<li><a href="./register">회원가입</a></li>
				</ul>
			</div>
			<!--</form>-->
		</div>
	</div>
</div>
</body>
<%@include file="../footer.jsp"%>
</html>