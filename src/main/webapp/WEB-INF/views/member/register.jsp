<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>회원 가입 - 약관 동의</title>
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
	margin-left : -0.5%;
	margin-top: 10%;
	margin-bottom: 0%;
}

.logo img {
	width: 200px;
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

button {
	margin: 0 auto;
	height: 50px;
	width: 416px;
	margin-top: 15px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
}

.nextBtn {
	background: #4bc8a8;
	color: #ffffff;
	font-size: 20px;
}

.nextBtn:hover {
	background: #62cfb4;
}

.nextBtn:active {
	background: #88e0ca;
	top: 2px;
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
		<div id="comment">
			<p style="color: #656a6e;">회원가입</p>
		</div>
		<ul id="nav_ul">
			<li>
				<div class="circle">01 약관동의</div>
			</li>
			<li id="rcl">
				<div class="yet circle">02 정보입력</div>
			</li>
			<li id="rcl">
				<div class="yet circle">03 추가인증</div>
			</li>
			<li id="rcl">
				<div class="yet circle">04 가입완료</div>
			</li>
		</ul>
		<br>
		<p>회원가입 약관 동의</p>
		<div id="content">
		<form id="terms_form" method="get" action="/loanplan/information">
			<div class="checkbox">
				<input type="checkbox" name="dummy" id="termAll"> <label
					for="termAll">전체 동의</label>
				<hr>
				
				<ul>
					<li>
						<input type="checkbox" name="terms" id="term1">
						<label for="term1">개인회원 약관에 동의 (필수)</label>
					</li>
					<li>
						<input type="checkbox" name="terms" id="term2">
						<label for="term2">개인회원 약관에 동의 (필수)</label>
					</li>
					<li>
						<input type="checkbox" name="terms" id="term3">
						<label for="term3">마케팅 정보수신 동의(SMS/이메일) (선택)</label>
					</li>
				</ul>
			</div>
			<div>
				<button class="nextBtn" onclick="location.href='./auth'">회원가입</button>
			</div>
		</form>
		<script>
               var $termAll = $('#termAll');
               $termAll.change(function () {
                   var $this = $(this);
                   var checked = $this.prop('checked');
                   $('input[name="terms"]').prop('checked', checked);

               });

               var boxes = $('input[name="terms"]');
               boxes.change(function () {

                   var boxLength = boxes.length;
                   var checkedLength = $('input[name="terms"]:checked').length;
                   var selectAll = (boxLength == checkedLength);

                   $termAll.prop('checked', selectAll);
               });
               
               if($("#term1").is(":checked")){
                   console.log("is 체크 됨");
               }else{
                   console.log("is 체크 안됨");
               }
               $(document).ready(function(){
                   $(".nextBtn").click(function(){    
                       if($("#term1").is(":checked") == false){
                           alert("필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                           return;
                       }else if($("#term2").is(":checked") == false){
                           alert("필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                           return;
                       }else{
                           $("#terms_form").submit();
                       }
                   });    
               });
             
		</script>
			<hr>
			<div>
				<span>또는 아래 계정 인증을 통한 회원가입<span><br>
				<button>
					<img src="resources/img/naver.png">
				</button>
				<br>
				<button>
					<img src="resources/img/kakao.png">
				</button>
				<br>
				<button>
					<img src="resources/img/google.png">
				</button>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="../footer.jsp"%>
</html>