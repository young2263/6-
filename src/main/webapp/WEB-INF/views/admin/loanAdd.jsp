<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/admin/loanAdd.css">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="logo">
			<img src="resources/img/logo.png" width="100px" height="100px" />
		</div>
		<div class="admin">관리자 정보</div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">사용자관리</div>
			<div class="navbarItem">대출상품관리</div>
			<div class="navbarItem">광고관리</div>
		</div>
		<div class="content">
			<div class="title">
				<h2>대출 추가</h2>
			</div>
			<div class="button">
				<div class="credit_btn">신용</div>
				<div class="guar_btn">담보</div>
				<div class="jeon_btn">전세자금대출</div>
			</div>
			<div class="inputBox">
				<div class="credit_inputBox">
					<table>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출금리유형</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출상환유형</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>중도상환수수료</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>연체이자율</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출한도</th>
							<td><input type="text" /></td>
						</tr>
					</table>
				</div>
				<div class="guar_inputBox">
					<table>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><select name="loan">
									<option value="shi">신한</option>
									<option value="kuk">국민</option>
									<option value="woori">우리</option>
									<option value="newct">새마을</option>
							</select></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="date" /></td>
						</tr>
						<tr>
							<th>900점초과 금리</th>
							<td><select id="loanrate1" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect1" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>801~900점 금리</th>
							<td><select id="loanrate2" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect2" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>701~800점 금리</th>
							<td><select id="loanrate3" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect3" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>601~700점 금리</th>
							<td><select id="loanrate4" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect4" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>401~500점 금리</th>
							<td><select id="loanrate5" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect5" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>301~400점 금리</th>
							<td><select id="loanrate6" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect6" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>300점 이하 금리</th>
							<td><select id="loanrate7" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect7" name="selboxDirect" /></td>
						</tr>
						<tr>
							<th>평균 금리</th>
							<td><select id="loanrate8" name="loanrate">
									<option value="">2.17</option>
									<option value="">1.7</option>
									<option value="">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect8" name="selboxDirect" /></td>
						</tr>
					</table>
				</div>
				<div class="jeon_inputBox">
					<table>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출금리유형</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출상환유형</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>중도상환수수료</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>연체이자율</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>대출한도</th>
							<td><input type="text" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="addBtn">추가</div>
		</div>
	</div>

	<script>
		$("#selboxDirect").hide();
		for (let i = 1; i < 9; i++) {
			$("#selboxDirect" + i).hide();
		}
		for (let i = 1; i < 9; i++) {
			$("#loanrate" + i).change(function() {
				if ($("#loanrate"+ i).val() == "direct") {
					$("#selboxDirect" + i).show();
				} else {
					$("#selboxDirect" + i).hide();
				}
			});
		}

		$(".guar_inputBox").hide();
		$(".jeon_inputBox").hide();
		$(".credit_btn").click(function() {
			$(".jeon_inputBox").hide();
			$(".guar_inputBox").show();
			$(".credit_inputBox").hide();
			$(".credit_btn").css("opacity", "1.2");
			$(".guar_btn").css("opacity", "0.5");
			$(".jeon_btn").css("opacity", "0.5");
		});
		$(".guar_btn").click(function() {
			$(".jeon_inputBox").hide();
			$(".guar_inputBox").hide();
			$(".credit_inputBox").show();
			$(".guar_btn").css("opacity", "1.2");
			$(".credit_btn").css("opacity", "0.5");
			$(".jeon_btn").css("opacity", "0.5");
		});
		$(".jeon_btn").click(function() {
			$(".guar_inputBox").hide();
			$(".credit_inputBox").hide();
			$(".jeon_inputBox").show();
			$(".jeon_btn").css("opacity", "1.2");
			$(".guar_btn").css("opacity", "0.5");
			$(".credit_btn").css("opacity", "0.5");
		});
	</script>
</body>
</html>