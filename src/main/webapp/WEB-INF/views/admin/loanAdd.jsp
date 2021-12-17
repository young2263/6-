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
			<img src="resources/img/loanplan.png" width="200px" height="100px" /> 
		</div>
		<div class="admin"><a href="/loanplan">메인페이지</a></div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">
				<a href="member">사용자관리</a>
			</div>
			<div class="navbarItem" style="background-color:white;">
				<a href="admin">대출상품관리</a>
			</div>
			<div class="navbarItem">
				<a href="advertise">광고관리</a>
			</div>
			<div class="navbarItem">
				<a href="comment">공지사항관리</a>
			</div>
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
				<form action="guarAdd" method="post" class="guar_inputBox" enctype="multipart/form-data">
					<!-- 담보대출 input -->
					<table>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" name="FIN_PRDT_NM" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><input type="text" name="KOR_CO_NM" /></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="date" name="DCLS_MONTH" /></td>
						</tr>
						<tr>
							<th>대출금리유형</th>
							<td><input type="text" name="LEND_RATE_TYPE_NM" /></td>
						</tr>
						<tr>
							<th>대출상환유형</th>
							<td><input type="text" name="RPAY_TYPE_NM" /></td>
						</tr>
						<tr>
							<th>중도상환수수료</th>
							<td><textarea rows="8" cols="85" name="ERLY_RPAY_FEE"></textarea></td>
						</tr>
						<tr>
							<th>연체이자율</th>
							<td><textarea rows="8" cols="85" name="DLY_RATE"></textarea></td>
						</tr>
						<tr>
							<th>대출한도</th>
							<td><input type="text" name="LOAN_LMT" /></td>
						</tr>
						<tr>
							<th>관련 URL</th>
							<td><input type="text" name="RL_URL" /></td>
						</tr>
						<tr>
							<td colspan="2"><input class="addBtn" type="submit"></input></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input class="fileInput" type="file" name="RL_IMG" /></td>
						</tr>
					</table>
				</form>


				<!-- <form action="upload" method="post" enctype="multipart/form-data">
				<input type="text" name="test" />
					Select File : <input type="file" name="uploadFile" />
					<button type="submit">Upload</button>
				</form> -->
				<script>
					/* $(".fileInput").change(
							function() {
								console.log("test");
								var form = $(".fileInput");
								console.log(form);
								var formData = new FormData(form[0]);
								console.log(typeof (formData));

								$.ajax({
									type : "post",
									enctype : "multipart/form-data",
									url : "upload",
									data : formData,
									processData : false,
									contentType : false,
									success : function(result) {
										alert("사진 업로드 완료" + result)
									},
									error : function(request, status, error) {
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								})
							}) */
				</script>


				<form class="credit_inputBox" action="creditAdd" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<th>금융회사명</th>
							<td><select name="KOR_CO_NM">
									<option value="shin">신한</option>
									<option value="kuk">국민</option>
									<option value="woori">우리</option>
									<option value="newct">새마을</option>
							</select></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="date" name="DCLS_MONTH" /></td>
						</tr>
						<tr>
							<th>대출종류명</th>
							<td><input type="text" name="CRDT_PRDT_TYPE_NM" /></td>
						</tr>
						<tr>
							<th>900점초과 금리</th>
							<td><select id="loanrate1" name="CRDT_GRAD_1">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect1" name="CRDT_GRAD_1" /></td>
						</tr>
						<tr>
							<th>801~900점 금리</th>
							<td><select id="loanrate2" name="CRDT_GRAD_4">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect2" name="CRDT_GRAD_4" /></td>
						</tr>
						<tr>
							<th>701~800점 금리</th>
							<td><select id="loanrate3" name="CRDT_GRAD_5">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect3" name="CRDT_GRAD_5" /></td>
						</tr>
						<tr>
							<th>601~700점 금리</th>
							<td><select id="loanrate4" name="CRDT_GRAD_6">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect4" name="CRDT_GRAD_6" /></td>
						</tr>
						<tr>
							<th>401~500점 금리</th>
							<td><select id="loanrate5" name="CRDT_GRAD_10">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect5" name="CRDT_GRAD_10" /></td>
						</tr>
						<tr>
							<th>301~400점 금리</th>
							<td><select id="loanrate6" name="CRDT_GRAD_12">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect6" name="CRDT_GRAD_12" /></td>
						</tr>
						<tr>
							<th>300점 이하 금리</th>
							<td><select id="loanrate7" name="CRDT_GRAD_13">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect7" name="CRDT_GRAD_13" /></td>
						</tr>
						<tr>
							<th>평균 금리</th>
							<td><select id="loanrate8" name="CRDT_GRAD_AVG">
									<option value="2.17">2.17</option>
									<option value="1.7">1.7</option>
									<option value="1.22">1.22</option>
									<option value="direct">직접입력</option>
							</select> <input type="text" id="selboxDirect8" name="CRDT_GRAD_AVG" /></td>
						</tr>
						<tr>
							<th>관련 URL</th>
							<td><input type="text" name="RL_CR_URL" /></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="RL_CR_IMG" /></td>
						</tr>
						<tr>
							<td colspan="2"><input class="addBtn" type="submit"></input></td>
						</tr>
					</table>
				</form>
				<form class="jeon_inputBox" action="jeonAdd" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<th>금융상품명</th>
							<td><input type="text" name="FIN_PRDT_NM" /></td>
						</tr>
						<tr>
							<th>금융회사명</th>
							<td><input type="text" name="KOR_CO_NM" /></td>
						</tr>
						<tr>
							<th>공시제출월</th>
							<td><input type="date" name="DCLS_MONTH" /></td>
						</tr>
						<tr>
							<th>대출금리유형</th>
							<td><input type="text" name="LEND_RATE_TYPE_NM" /></td>
						</tr>
						<tr>
							<th>대출상환유형</th>
							<td><input type="text" name="RPAY_TYPE_NM" /></td>
						</tr>
						<tr>
							<th>중도상환수수료</th>
							<td><textarea rows="8" cols="85" name="ERLY_RPAY_FEE"></textarea></td>
						</tr>
						<tr>
							<th>연체이자율</th>
							<td><textarea rows="8" cols="85" name="DLY_RATE"></textarea></td>
						</tr>
						<tr>
							<th>대출한도</th>
							<td><input type="text" name="LOAN_LMT" /></td>
						</tr>
						<tr>
							<th>관련 URL</th>
							<td><input type="text" name="RL_CH_URL" /></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="RL_CH_IMG" /></td>
						</tr>
						<tr>
							<td colspan="2"><input class="addBtn" type="submit"></input></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>

	<script>
		$(".credit_btn").css("opacity", "1.2");
		$(".guar_btn").css("opacity", "0.5");
		$(".jeon_btn").css("opacity", "0.5");

		$("#selboxDirect").hide();
		for (let i = 1; i < 9; i++) {
			$("#selboxDirect" + i).hide();
		}
		for (let i = 1; i < 9; i++) {
			$("#loanrate" + i).change(function() {
				if ($("#loanrate" + i).val() == "direct") {
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
			$(".guar_inputBox").hide();
			$(".credit_inputBox").show();
			$(".credit_btn").css("opacity", "1.2");
			$(".guar_btn").css("opacity", "0.5");
			$(".jeon_btn").css("opacity", "0.5");
		});
		$(".guar_btn").click(function() {
			$(".jeon_inputBox").hide();
			$(".guar_inputBox").show();
			$(".credit_inputBox").hide();
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