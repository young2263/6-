<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>인증</title>
<style>
#content_box {
	width: 460px;
	margin: 0 auto;
}

.logoImg {
	width: 460px;
	margin: 0 auto;
	margin-top: 35px;
	max-height: 280px;
	overflow: hidden;
}

.logoImg img {
	max-height: initial;
	margin-top: -15%;
	margin-bottom: -15%;
}

.logoImg img {
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

.phn {
	border: 1px solid #ccc;
	border-radius: 10px;
	height: 250px;
	text-align: center;
	line-height: 45px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.email {
	border: 1px solid #ccc;
	border-radius: 10px;
	height: 250px;
	line-height: 45px;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}

.nextBtn {
	width: 250px;
	height: 40px;
	background-color: rgb(75, 200, 168);
	border: none;
	border-radius: 10px;
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

.imo {
	font-size: 40px;
}

#modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

#modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
<script>
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	function ajaxm1(){
	var email = $("#m_email").html()
	var json = {
		"m_email": email
	}
	console.log($("#m_email").html());
	$.ajax({
		url: "<%=request.getContextPath()%>/auth",
			type: "post",
			 // data : 서버(컨트롤러)로 보내는 데이터.
			 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
			data: JSON.stringify(json),
			//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
			contentType : "application/json; charset=utf-8",
			success: function(result){
				console.log(result);
				var date = new Date();
				var minutes = 5;
				date.setTime(date.getTime() + (minutes * 60 * 1000));
				$.cookie("email",result, { expires: date }); //쿠키이름, 쿠키값, 언제끝날지
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
		});
	}
	//member테이블에 이메일 인증 YN - N이면 서비스를 주면 안됨. -> 인터셉터 프리핸들에서 처리!(로그인 막기)
	function lastCheck(){
		if($("#lastChk").val() == $.cookie("email")){
			alert("이메일 인증에 성공했습니다.");
			location.href="<%=request.getContextPath()%>/member/information";
		}else {
			alert("이메일 인증 실패");
		}
	
	}
	 $("#lastChkBtn").submit(function(event){
	        event.preventDefault();
	        ajaxPostRequest();
	   });
</script>
</head>
<%@include file="../header.jsp"%>
<body>
	<div id="content_box">
		<div class="logoImg">
			<img src="resources/img/logo.png">
		</div>
		<div>
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
				<div class="yet circle">04 가입완료</div>
			</li>
		</ul>
		<div>
			<p>추가 인증 페이지입니다. 이메일 인증을 완료해주세요.</p>
		</div>
		<div class="phn">
			<p class="imo">&#128241;</p>
			<p>핸드폰</p>
			<button class="nextBtn">인증하기</button>
		</div>
		<div class="email">
			<p class="imo">&#128231;</p>
			<p>이메일</p>
			<button class="nextBtn" id="email-popup">인증하기</button>
		</div>
		<div id="modal">
			<div class="modal_body">
				<h3>LOGO</h3>
				<p>이메일 인증을 진행해주세요</p>
					<p>이메일</p>
					<input type="email" id="m_email" name="m_email">
					${vo.m_email}
					<button type="button" id="mailcheck" onclick="ajaxm1()">인증</button>
					<p>인증번호 입력</p>
					<input type="text" id="lastChk">
					<button type="button" id="lastChkBtn" onclick="lastCheck()">확인</button>
			</div>
		</div>
		
		<!-- modal 이벤트 -->
		<script>
            const body = document.querySelector('body');
            const modal = document.querySelector('#modal');
            const btnOpenPopup = document.querySelector('#email-popup');
      
            btnOpenPopup.addEventListener('click', () => {
              modal.classList.toggle('show');
      
              if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
            });
      
            modal.addEventListener('click', (event) => {
              if (event.target === modal) {
                modal.classList.toggle('show');
      
                if (!modal.classList.contains('show')) {
                  body.style.overflow = 'auto';
                }
              }
            });
          </script>
          
	</div>
	<%@include file="../footer.jsp"%>
</body>

</html>