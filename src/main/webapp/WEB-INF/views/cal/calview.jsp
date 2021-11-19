<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script language="JavaScript">
function calculate() {
  
    var principal = document.loandata.principal.value;
    var interest = document.loandata.interest.value / 100 / 12;
    var payments = document.loandata.years.value * 12;

  
    var x = Math.pow(1 + interest, payments);
    var monthly = (principal*x*interest)/(x-1);

  
    if (!isNaN(monthly) && 
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {

        document.loandata.payment.value = round(monthly);
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
		<!-- <tr>
			<td>4)</td>
			<td>거치기간(년)</td>
			<td><input type="text" name="tyears" size="12"
				onchange="calculate();"> 년</td>
		</tr> -->
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