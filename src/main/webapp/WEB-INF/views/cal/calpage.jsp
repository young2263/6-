<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>계산기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/templatemo.css">
<link rel="stylesheet" href="./resources/css/custom.css">
<link rel="stylesheet" href="./resources/css/calpage.css">


<script language="JavaScript">
	/* 원리금균등상환 계산기(monthly 일정)  
	 function calculate() {
	
	 var principal = document.loandata.principal.value;
	 var interest = document.loandata.interest.value / 100 / 12;
	 var payments = (document.loandata.years.value * 12;

	 /* tyears * 12 => 거치기간개월수  */

	/*    var monthly = (principal * interest * Math.pow(( 1+ interest ), payments) / Math.pow((1+interest), payments)- 1);	//월상환금액

	
	 if (!isNaN(monthly) && 
	 (monthly != Number.POSITIVE_INFINITY) &&
	 (monthly != Number.NEGATIVE_INFINITY)) {

	 document.loandata.monthly.value = round(monthly);
	 document.loandata.total.value = round(monthly * payments);
	 document.loandata.totalinterest.value = 
	 round((monthly * payments) - principal);
	 }
	 // 잘못된값 입력시 아무값도 나오지않게
	 else {
	 document.loandata.payment.value = "";
	 document.loandata.total.value = "";
	 document.loandata.totalinterest.value = "";
	 }
	 }
	 }*/
	/* 원금균등상환계산기 (납입원금일정) (미완)*/
	/* function calculate() {
	
	 var principal = document.loandata.principal.value;	//원금
	 var interest = document.loandata.interest.value / 100 / 12;	//이자
	 var payments = document.loandata.years.value * 12;	//대출상환개월수

	 var x = principal-monthly;
	 var monthly = principal / payments;	//매월갚을 원금금액(fix)
	 var interest = document.loandata.interest.value / 12;
	 var payment = (principal-monthly) / payments;
	 /* 첫달      이자금액 principal * interest /12 
	 두번쨰달 이자금액 (principal-monthly) * interest / 12 */

	/*
	   if (!isNaN(monthly) && 
	       (monthly != Number.POSITIVE_INFINITY) &&
	       (monthly != Number.NEGATIVE_INFINITY)) {
	monthly = tyears * 12 -
	       document.loandata.payment.value = round(monthly+interest);	//매월상환금
	       document.loandata.total.value = round(monthly * payments);
	       document.loandata.totalinterest.value = 
	           round((monthly * payments) - principal);
	   }
	// 잘못된값 입력시 아무값도 나오지않게
	   else {
	       document.loandata.payment.value = "";
	       document.loandata.total.value = "";
	       document.loandata.totalinterest.value = "";
	   }
	} */
	/* 만기일시상환 계산기  */
	/* function calculate() {
	
	 var principal = document.loandata.principal.value;
	 var interest = document.loandata.interest.value / 100 / 12;
	 var payments = document.loandata.years.value * 12;
	
	
	
	 var monthly = (principal * ( 1+ interest ) * payments  - principal) / payments ;	//월상환금액

	
	 if (!isNaN(monthly) && 
	 (monthly != Number.POSITIVE_INFINITY) &&
	 (monthly != Number.NEGATIVE_INFINITY)) {
	
	 document.loandata.payment.value = round(monthly);
	 document.loandata.total.value = principal * ( 1+ interest ) * payments;	//총원금
	 document.loandata.totalinterest.value = principal * ( 1+ interest ) * payments  - principal; //총이자
	 }
	 // 잘못된값 입력시 아무값도 나오지않게
	 else {
	 document.loandata.payment.value = "";
	 document.loandata.total.value = "";
	 document.loandata.totalinterest.value = "";
	 }
	 } */

	function round(x) {
		return Math.round(x * 100) / 100;
	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>

	<div class="body">
		<div class="calBox">
			<button class="man">만기일시상환</button>
			<button class="won">원리금균등상환</button>
		</div>
		<div class="manBox">
			<table>
				<tr>
					<td colspan="3"><h3>만기일사상환</h3></td>
				</tr>
				<tr>
					<td><h4>대출 금액</h4></td>
					<td><input type="text" name="principal" size="12"
						onchange="calculate();">
					<h4>원</h4></td>
				</tr>
				<tr>
					<td><h4>연 이자율(%)</h4></td>
					<td><input class="interestInput" type="text" name="interest"
						value=0 size="12" onchange="calculate();">
						<h4>%</h4></td>
					<td><button class="iReset">초기화</button>
						<button class="i1">+1</button>
						<button class="i3">+3</button>
						<button class="i5">+5</button></td>
				</tr>
				<tr>
					<td><h4>상환기간(년)</h4></td>
					<td><input class="yearsInput" type="text" value=0 name="years"
						size="12" onchange="calculate();">
					<h4>년</h4></td>
					<td><button class="yReset">초기화</button>
						<button class="p1">+1</button>
						<button class="p3">+3</button>
						<button class="p5">+5</button></td>
				</tr>
				<tr>
					<td colspan="3"><input class="btn" type="button" value="계산"
						onclick="calculate();"> <input class="btn" type="button"
						value="초기화" onclick="reset();"></td>
				</tr>
			</table>
			<div class="resultBox">
				<table>
					<tr>
						<td colspan="3"><h3>상환내역</h3></td>
					</tr>
					<tr>
						<td><h4>월상환금</h4></td>
						<td><input type="text" name="payment" size="12">
						<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>원금 및 이자합계</h4></td>
						<td><input type="text" name="total" size="12">
						<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>총 이자액</h4></td>
						<td><input type="text" name="totalinterest" size="12">
						<h4>원</h4></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="wonBox">
			<table>
				<tr>
					<td colspan="3"><h3>원리금균등상환</h3></td>
				</tr>
				<tr>
					<td><h4>대출 금액</h4></td>
					<td><input type="text" name="principal" size="12"
						onchange="calculate();">
					<h4>원</h4></td>
				</tr>
				<tr>
					<td><h4>연 이자율(%)</h4></td>
					<td><input class="interestInput" type="text" name="interest"
						value=0 size="12" onchange="calculate();">
						<h4>%</h4></td>
					<td><button class="iReset">초기화</button>
						<button class="i1">+1</button>
						<button class="i3">+3</button>
						<button class="i5">+5</button></td>
				</tr>
				<tr>
					<td><h4>상환기간(년)</h4></td>
					<td><input class="yearsInput" type="text" value=0 name="years"
						size="12" onchange="calculate();">
					<h4>년</h4></td>
					<td><button class="yReset">초기화</button>
						<button class="p1">+1</button>
						<button class="p3">+3</button>
						<button class="p5">+5</button></td>
				</tr>
				<tr>
					<td colspan="3"><input class="btn" type="button" value="계산"
						onclick="calculate();"> <input class="btn" type="button"
						value="초기화" onclick="reset();"></td>
				</tr>
			</table>
			<div class="resultBox">
				<table>
					<tr>
						<td colspan="3"><h3>상환내역</h3></td>
					</tr>
					<tr>
						<td><h4>월상환금</h4></td>
						<td><input type="text" name="payment" size="12">
						<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>원금 및 이자합계</h4></td>
						<td><input type="text" name="total" size="12">
						<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>총 이자액</h4></td>
						<td><input type="text" name="totalinterest" size="12">
						<h4>원</h4></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
	<script>
		$(".wonBox").hide();
		$(".won").css("opacity", "0.4");
		$(".man").click(function() {
			$(".manBox").show();
			$(".wonBox").hide();
			$(".won").css("opacity", "0.4");
			$(".man").css("opacity", "1");

		});
		$(".won").click(function() {
			$(".wonBox").show();
			$(".manBox").hide();
			$(".man").css("opacity", "0.4");
			$(".won").css("opacity", "1");
		});
		$(".i1").click(function() {
			$(".interestInput").val(Number($(".interestInput").val()) + 1)
		})
		$(".i3").click(function() {
			$(".interestInput").val(Number($(".interestInput").val()) + 3)
		})
		$(".i5").click(function() {
			$(".interestInput").val(Number($(".interestInput").val()) + 5)
		})
		$(".iReset").click(function() {
			$(".interestInput").val(0)
		})
		$(".p1").click(function() {
			$(".yearsInput").val(Number($(".yearsInput").val()) + 1)
		})
		$(".p3").click(function() {
			$(".yearsInput").val(Number($(".yearsInput").val()) + 3)
		})
		$(".p5").click(function() {
			$(".yearsInput").val(Number($(".yearsInput").val()) + 5)
		})
		$(".yReset").click(function() {
			$(".yearsInput").val(0)
		})
	</script>
</body>
</html>