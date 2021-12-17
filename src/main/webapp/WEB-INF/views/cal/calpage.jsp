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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<script language="JavaScript">

/* 원리금 상환*/
function calculateA() {
	console.log("test")
    var principal = $(".principalInput2").val();
    var interest =  $(".interestInput2").val() /100;
    var payments = $(".yearsInput2").val();
	
    var monthly = (principal * interest * Math.pow(( 1+ interest ), payments) / Math.pow((1+interest), payments)- 1);
    if (!isNaN(monthly) && 
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {
    	
    	var rPayment2 = round(monthly);
    	var rtotal2 = round(Number(principal) + Number(principal * interest / 12 * payments));
    	var rtotalinterest2 = round(principal * interest * payments);
    	
    	$(".payment2").val(rPayment2.toLocaleString());
		$(".totalinterest2").val(rtotalinterest2.toLocaleString());
		$(".total2").val(rtotal2.toLocaleString());
    }
    else {
    	
    }
}


	function round(x) {
	  return Math.round(x*100)/100;
	}


	
	/* 만기일시상환 계산기  */
	function calculateB() {
	
	var principal = $(".principalInput").val();
	var interest =  $(".interestInput").val() /100;
	var payments = $(".yearsInput").val();
	 var monthly = round(principal * interest / 12);	//월상환금액
	 if (!isNaN(monthly) && 
	 (monthly != Number.POSITIVE_INFINITY) &&
	 (monthly != Number.NEGATIVE_INFINITY)) {
		var rpayment = round(monthly);
		var rtotalinterest = principal * interest * payments;  //총이자
		var rtotal = Number(principal) + Number(principal * interest / 12 * payments);   //원금및이자합계
		$(".payment").val(rpayment.toLocaleString());
		$(".totalinterest").val(rtotalinterest.toLocaleString());
		$(".total").val(rtotal.toLocaleString());
	 }
	
	 else {
	 }
	 } 
	/* 목돈 계산기 */
	function calculateC() {
		
	    var principal = document.loandata.principal.value;
	    var interest = document.loandata.interest.value /100;
	    var payments = document.loandata.years.value * 12;
		
	    var smonthly =principal * (1+interest) * payments; //단리
	    var pmonthly = principal * (1+interest) * payments;	//복리
	    
	    if (!isNaN(monthly) && 
	        (monthly != Number.POSITIVE_INFINITY) &&
	        (monthly != Number.NEGATIVE_INFINITY)) {
			
	        document.loandata.payment.value = (principal * ( 1+ interest ) * payments  - principal) / payments ;
	        document.loandata.total.value = principal * ( 1+ interest ) * payments / 12;	//총원금
	        document.loandata.totalinterest.value = principal * ( 1+ interest ) * (payments / 12)  - ( principal / 12); //총이자
	    }
	    else {
	        document.loandata.payment.value = "";
	        document.loandata.total.value = "";
	        document.loandata.totalinterest.value = "";
	    }
	}


</script>
</head>
<body>
	<%@include file="../header.jsp"%>


	<div class="body">
		<div class="calBox">
			<button class="man">만기일시상환</button>
			<button class="won">원리금균등상환</button>
			<button class="mok">목돈계산기</button>
		</div>
		<div class="manBox">

			<table>
				<tr>
					<td colspan="3"><h3>만기일시상환</h3></td>
				</tr>
				<tr>
					<td><h4>대출 금액</h4></td>
					<td><input class="principalInput" type="text" name="principal"
						size="12" onchange="calculateB();">
						<h4>원</h4></td>
				</tr>
				<tr>
					<td><h4>연 이자율(%)</h4></td>
					<td><input class="interestInput" type="text" name="interest"
						value=0 size="12" onchange="calculateB();">
						<h4>%</h4></td>
					<td><button class="iReset">초기화</button>
						<button class="i1">+1</button>
						<button class="i3">+3</button>
						<button class="i5">+5</button></td>
				</tr>
				<tr>
					<td><h4>상환기간(월)</h4></td>
					<td><input class="yearsInput" type="text" value=0 name="years"
						size="12" onchange="calculateB();">
						<h4>개월</h4></td>
					<td><button class="yReset">초기화</button>
						<button class="p1">+1</button>
						<button class="p3">+3</button>
						<button class="p5">+5</button></td>
				</tr>
				<tr>
					<td colspan="3"><input class="btn" type="button" value="계산"
						onclick="calculateB();"> <input class="btn" type="button"
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
						<td><input class="payment" type="text" name="payment" size="12">
							<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>원금 및 이자합계</h4></td>
						<td><input class="total" type="text" name="total" size="12">
							<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>총 이자액</h4></td>
						<td><input class="totalinterest" type="text" name="totalinterest" size="12">
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
					<td><input class="principalInput2" type="text" name="principal" size="12"
						onchange="calculateA();">
						<h4>원</h4></td>
				</tr>
				<tr>
					<td><h4>연 이자율(%)</h4></td>
					<td><input class="interestInput2" type="text" name="interest"
						value=0 size="12" onchange="calculateA();">
						<h4>%</h4></td>
					<td><button class="iReset">초기화</button>
						<button class="i1">+1</button>
						<button class="i3">+3</button>
						<button class="i5">+5</button></td>
				</tr>
				<tr>
					<td><h4>상환기간(월)</h4></td>
					<td><input class="yearsInput2" type="text" value=0 name="years"
						size="12" onchange="calculateA();">
						<h4>개월</h4></td>
					<td><button class="yReset">초기화</button>
						<button class="p1">+1</button>
						<button class="p3">+3</button>
						<button class="p5">+5</button></td>
				</tr>
				<tr>
					<td colspan="3"><input class="btn" type="button" value="계산"
						onclick="calculateA();"> <input class="btn" type="button"
						value="초기화" onclick="reset();"></td>
				</tr>
			</table>
			<div class="resultBox">
				<table>
					<tr>
						<td colspan="3"><h3>상환 내역</h3></td>
					</tr>
					<tr>
						<td><h4>월상환금</h4></td>
						<td><input class="payment2" type="text" name="payment" size="12">
							<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>원금 및 이자합계</h4></td>
						<td><input class="total2" type="text" name="total" size="12">
							<h4>원</h4></td>
					</tr>
					<tr>
						<td><h4>총 이자액</h4></td>
						<td><input class="totalinterest2" type="text" name="totalinterest" size="12">
							<h4>원</h4></td>
					</tr>
				</table>
			</div>

		</div>
		<div class="mokBox">
			<table>
				<tr>
					<td colspan="3"><h3>목돈계산기</h3></td>
				</tr>
				<tr>
					<td><h4>목표 금액</h4></td>
					<td><input type="text" name="principal" size="12"
						onchange="calculateC();">
						<h4>원</h4></td>
				</tr>
				<tr>
					<td><h4>연 이자율(%)</h4></td>
					<td><input class="interestInput" type="text" name="interest"
						value=0 size="12" onchange="calculateC();">
						<h4>%</h4></td>
					<td><button class="iReset">초기화</button>
						<button class="i1">+1</button>
						<button class="i3">+3</button>
						<button class="i5">+5</button></td>
				</tr>
				<tr>
					<td><h4>적립 기간(년)</h4></td>
					<td><input class="yearsInput" type="text" value=0 name="years"
						size="12" onchange="calculateC();">
						<h4>년</h4></td>
					<td><button class="yReset">초기화</button>
						<button class="p1">+1</button>
						<button class="p3">+3</button>
						<button class="p5">+5</button></td>
				</tr>
				<tr>
					<td><h4>금리 방식</h4></td>
					<h4>방식</h4>
					</td>
					<td><select name="selinterest">
							<option value="단리">단리</option>
							<option value="복리">복리</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="4"><input class="btn" type="button" value="계산"
						onclick="calculateC();"> <input class="btn" type="button"
						value="초기화" onclick="reset();"></td>
				</tr>
			</table>
			<div class="resultBox">
				<table>
					<tr>
						<td colspan="3"><h3>목돈 예상</h3></td>
					</tr>
					<tr>
						<td><h4>예상 목돈 :</h4></td>
						<td><input type="text" name="payment" size="12">
							<h4>원</h4></td>
					</tr>

				</table>
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp"%>
	<script>
		$(".wonBox").hide();
		$(".mokBox").hide();
		$(".won").css("opacity", "0.4");
		$(".man").click(function() {
			$(".manBox").show();
			$(".wonBox").hide();
			$(".mokBox").hide();
			$(".won").css("opacity", "0.4");
			$(".man").css("opacity", "1");
			$(".mok").css("opacity", "0.4");

		});
		$(".won").click(function() {
			$(".wonBox").show();
			$(".manBox").hide();
			$(".mokBox").hide();
			$(".man").css("opacity", "0.4");
			$(".won").css("opacity", "1");
			$(".mok").css("opacity", "0.4");
		});
		$(".mok").click(function() {
			$(".mokBox").show();
			$(".manBox").hide();
			$(".wonBox").hide();
			$(".man").css("opacity", "0.4");
			$(".mok").css("opacity", "1");
			$(".won").css("opacity", "0.4");
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