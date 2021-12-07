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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>정보 입력</title>
<style>
#content_box {
	width: 460px;
	margin: 0 auto;
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

.section_form {
	border: 1px solid #dae1e6;
	padding: 20px;
}

.btn {
	text-align: center;
}

.nextBtn {
	background: #4bc8a8;
	color: #ffffff;
	font-size: 20px;
	width: 200px;
	height: 40px;
	border: none;
	text-align: center;
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
				<div class="circle">02 본인인증</div>
			</li>
			<li id="rcl">
				<div class="circle">03 정보입력</div>
			</li>
			<li id="rcl">
				<div class="yet circle">04 가입완료</div>
			</li>
		</ul>
		<h3>회원가입을 위해 가입정보를 입력해주세요.</h3>
		<div class="section_form">
			<section class="must">
				<form name="login" action="signUp" method="post">
					아이디<br> <input type="text" class="form-control" name="m_id"
						id="m_id" placeholder="아이디를 입력해주세요." required>
					<div class="check_font" id="id_check"></div>
					<br> 비밀번호<br> <input type="password" name="m_pwd"
						id="m_pwd" placeholder="비밀번호를 입력해주세요." required> <br>
					<br> 비밀번호 확인<br> <input type="password" name="pwd_check"
						placeholder="비밀번호 확인을 위해 한번 더 입력해주세요." required> <br>
					<br> 이름<br> <input type="text" name="m_name"
						placeholder="성함을 입력해주세요." required> <br> <br>
					이메일<br> <input type="email" name="m_email"
						placeholder="이메일을 입력해주세요." required> <br> <br>
					전화번호<br> <input type="text" name="m_phn"
						placeholder="전화번호를 입력해주세요." required> <br> <br>
					나이<br> <input type="text" name="m_age"
						placeholder="나이를 입력해주세요." required> <br> <br> 직업<br>
					<input type="text" name="m_job" placeholder="직업을 입력해주세요." required>
					<br> <br> 생년월일<br> <input type='date' id="m_age" /><br>
					<br> 주소 검색<br> <input type="text" id="sample4_postcode"
						name="m_address" placeholder="우편번호"> <input type="button"
						onclick="searchAddress()" name="m_address" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="m_address"
						placeholder="도로명주소"> <input type="text"
						id="sample4_detailAddress" name="m_address" placeholder="상세주소">
					<br> <br>
			</section>
			<script>
				//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				function searchAddress() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
									var extraRoadAddr = ''; // 참고 항목 변수

									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraRoadAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraRoadAddr += (extraRoadAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraRoadAddr !== '') {
										extraRoadAddr = ' (' + extraRoadAddr
												+ ')';
									}
									// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
									if (fullRoadAddr !== '') {
										fullRoadAddr += extraRoadAddr;
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample4_postcode').value = data.zonecode;
									document
											.getElementById("sample4_roadAddress").value = fullRoadAddr;
								}
							}).open();
				}
			</script>
			<script>
				$('#m_id')
						.blur(
								function() {
									// id = "id_reg" / name = "userId"
									var m_id = $('#m_id').val();
									$
											.ajax({
												url : '${pageContext.request.contextPath}/idCheck?m_id='
														+ m_id,
												type : 'get',
												success : function(data) {
													console
															.log("1 = 중복o / 0 = 중복x : "
																	+ data);

													if (data == 1) {
														// 1 : 아이디가 중복되는 문구
														$("#id_check").text(
																"사용중인 아이디입니다");
														$("#id_check").css(
																"color", "red");
														$("#reg_submit").attr(
																"disabled",
																true);
													} else {
														if (data == 0) {
															// 0 : 아이디 길이 / 문자열 검사
															$("#id_check")
																	.text(
																			"사용 가능한 아이디입니다");
															$("#id_check").css(
																	'color',
																	'green');
															$("#reg_submit")
																	.attr(
																			"disabled",
																			false);

														} else if (m_id == "") {
															$('#id_check')
																	.text(
																			'아이디를 입력해주세요 :)');
															$('#id_check').css(
																	'color',
																	'red');
															$("#reg_submit")
																	.attr(
																			"disabled",
																			true);

														} else {
															$('#id_check')
																	.text(
																			"아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
															$('#id_check').css(
																	'color',
																	'red');
															$("#reg_submit")
																	.attr(
																			"disabled",
																			true);
														}
													}
												},
												error : function() {
													console.log("실패");
												}
											});
								});
			</script>
			<section class="select">
				관심사<br> 주택청약<input type="checkbox" name="check" value="hobby1">
				대출<input type="checkbox" name="check" value="hobby2"> 재테크<input
					type="checkbox" name="check" value="hobby3"> 기타<input
					type="checkbox" name="check" value="hobby4"> <br>
				<div>
					<br> 성별<br> <input type="radio" id="man" name="m_gender"
						value="M" checked> <label for="man">남자</label> <input
						type="radio" id="woman" name="m_gender" value="W"> <label
						for="woman">여자</label> <input type="radio" id="Private"
						name="m_gender" value="N"> <label for="Private">비공개</label>

					<br>
					<br> 차량 소지 여부<br> <input type="radio" id="yes"
						name="m_car" value="M" checked> <label for="yes">YES</label>

					<input type="radio" id="no" name="m_car" value="W"> <label
						for="no">NO</label> <br>
					<br> 주택 소지 여부<br> <input type="radio" id="yes"
						name="m_house" value="M" checked> <label for="yes">YES</label>

					<input type="radio" id="no" name="m_house" value="W"> <label
						for="no">NO</label> <br>
					<br>
				</div>
			</section>
			<div class="btn">
				<button class="nextBtn" id="cancel" onclick="location.href='./'">취소</button>
				<button class="nextBtn" type="submit">가입하기</button>
			</div>

			<script>
				$("#cancel").click(function() {
					if (confirm("취소하시겠습니까? 취소하시면 메인페이지로 돌아갑니다.")) {
						return "redirect:/";
					} else {
						return false;
					}
				});
			</script>
			</form>
		</div>
	</div>
</body>

</html>