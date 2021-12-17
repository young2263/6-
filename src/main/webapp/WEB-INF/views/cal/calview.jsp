<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>계산기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<script language="JavaScript">
/* 원리금균등상환 계산기(monthly 일정) */ 
function calculate() {
  
    var principal = document.loandata.principal.value;
    var interest = document.loandata.interest.value / 100 / 12;
    var payments = (document.loandata.years.value * 12;

  /* tyears * 12 => 거치기간개월수  */
   
    var monthly = (principal * interest * Math.pow(( 1+ interest ), payments) / Math.pow((1+interest), payments)- 1);	//월상환금액

  
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
}
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
	  return Math.round(x*100)/100;
	}
</script>
</head>
<body>

</body>
</html>

<form name="loandata">
	<table>
		<tr>
			<td colspan="3"><b>대출 금액 및 이자율 입력</b></td>
		</tr>
		<tr>
			<td>1)</td>
			<td>대출 금액입력</td>
			<td><input type="text" name="principal" size="12"
				onchange="calculate();"> 원</td>
		</tr>
		<tr>
			<td>2)</td>
			<td>이자율(%)</td>
			<td><input type="text" name="interest" size="12"
				onchange="calculate();"> %</td>
		</tr>
		<tr>
			<td>3)</td>
			<td>대출기간(년)</td>
			<td><input type="text" name="years" size="12"
				onchange="calculate();"> 년</td>
		</tr>
		<tr>
			<td colspan="3"><input type="button" value="계산"
				onclick="calculate();"><input type="button" value="다시입력"
				onclick="reset();"></td>
		</tr>
		<tr>
			<td colspan="3"><b>상환내역:</b></td>
		</tr>
		<tr>
			<td>4)</td>
			<td>월상환금</td>
			<td><input type="text" name="payment" size="12"> 원</td>
		</tr>
		<tr>
			<td>5)</td>
			<td>원금 및 이자합계</td>
			<td><input type="text" name="total" size="12"> 원</td>
		</tr>
		<tr>
			<td>6)</td>
			<td>이자금액</td>
			<td><input type="text" name="totalinterest" size="12"> 원</td>
		</tr>
		
		
	</table>
</form>

</body>
</html>