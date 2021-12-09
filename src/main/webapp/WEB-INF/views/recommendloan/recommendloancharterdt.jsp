<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>전세자금대출</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">

<style>
    *{margin:0; padding:0;}
    
</style>

<style>

	.bodyunder{
		background-color: white;
	}

	.body > aside {
		float:left;
		width: 100%;
	}

	.loandt {
		width: 80%;
		text-align: center;
		padding-left: 50px;
		font-size: 20px;
		margin: auto;
		padding-bottom: 40px;
		border-collapse: separate;
		border-spacing: 30px 40px;
	}
	
	.loandt td {
		font-size: 25px;
		font-weight: bold;
	}
	
	td {
   		white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
   }
   
   b {
   		font-size: 30px;
   }
	
   .description p {
   		font-size: 25px;
   }

	
	.tabb:nth-of-type(1) {display:none;}
	.tabb:nth-of-type(1) ~ div:nth-of-type(1) {display:none;}
	.tabb:nth-of-type(1):checked ~ div:nth-of-type(1) {display:block;}
	
	.tabb:nth-of-type(2) {display:none;}
	.tabb:nth-of-type(2) ~ div:nth-of-type(2) {display:none;}
	.tabb:nth-of-type(2):checked ~ div:nth-of-type(2) {display:block;}
	
	.tabb:nth-of-type(3) {display:none;}
	.tabb:nth-of-type(3) ~ div:nth-of-type(3) {display:none;}
	.tabb:nth-of-type(3):checked ~ div:nth-of-type(3) {display:block;}

/* 탭 모양 */

	.bodyunder{
		text-align: center;
	}
	
	h1 {
		text-align: center;
	}

	aside > label {
		display : inline-block;
		width: 100%; line-height:30px;
		background-color:white;
		color: #59ab6e;
	}

	.tabtab {
		font-size: 20px;
		text-decoration: underline;
	}

	.tabb:nth-of-type(1):checked ~ label:nth-of-type(1) {
		font-style: italic;
		color: #59ab6e;
	}
	.tabb:nth-of-type(2):checked ~ label:nth-of-type(2) {
		font-style: italic;
		color: #59ab6e;
	}
	.tabb:nth-of-type(3):checked ~ label:nth-of-type(3) {
		font-style: italic;
		color: #59ab6e;
	}
	
	/* 탭 목록 */

	.tab_item .item {
		overflow: hidden;
		padding: 30px;
		border: 1px solid black;
		border-top: none;
		border-bottom: none;
	}
	
	.tab_item h1 {
        width: 100%;
        text-align: center;
    }
	
	.item .description {
		float:left;
		margin-left: 10px;
		width: 100%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: eclipsis;
		text-align: center;	
	}
	
	.description {
		font-size: 20px;
	}
	
	.tab_item .loancalcul {
		width: 80%;
		margin: auto;
		border-collapse: separate;
		border-spacing: 0 20px;
	}
	
	.loancalcul tr {
		border-bottom: 10px solid;
	}
	
	.loancalcul td {
		border-right: 10px;
	}
	
	.need {
		border: 0;
		border-bottom: 1px solid gray;
	}

	.result {
		border-style: none;
	}

	.tab_item .reviewtable {
		width: 80%;
        margin: auto;
        border: none;
    }
    
    .reviewlist {
    	border-spacing:50px;
    	border-collapse: separate;
    }
    
    .reviewlist .rvn {
    	width: 700px;
    	background-color: #59ab6e;
    	border-radius: 30%;
    }
    
    .reviewlist td {
    	width: 700px;
    	background: #59ab6e;
    }
    
     .reviewtable {
    	border-spacing:50px;
    	border-collapse: separate;
    }
    
    .reviewlist tr {
    	width: 700px;
    	background: #ccc;
    }
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
      font-size:22px;
      letter-spacing:0;
      display:inline-block;
      margin-left:5px;
      color:#ccc;
      text-decoration:none;
  	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:rgb(255, 251, 0);}
	
	.star_rating a {
		display: inline-block;
		width: 30px; height: 30px;
		font-size: 20px;
	}
	
	.btnrv {
		border: 1px solid #59ab6e;
		background-color: #59ab6e;
		font: 20px;
		font-weight: bold;
		color: black;
		width: 150px; height: 40px; 
	}
	
</style>

<script type="text/javascript">
$( document ).ready(function() {
	$( ".star_rating a" ).click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		 var starRate = $(this).attr('id');
		$("#review_star").val(starRate);
		     return false;
		});
	});
	
	
	
<script language="JavaScript">
/* 원리금균등상환 계산기(monthly 일정) */ 
function calculate() {
  
    var principal = document.loandata.principal.value;
    var interest = document.loandata.interest.value / 100 / 12;
    var payments = (document.loandata.years.value - tyears * 12) * 12;

  /* tyears * 12 => 거치기간개월수  */
    var x = Math.pow(1 + interest, payments- tyears*12);
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
/* 원금균등상환계산기 (납입원금일정) (미완)*/
function calculate() {
  
   var principal = document.loandata.principal.value;	//원금
   var interest = document.loandata.interest.value / 100 / 12;	//이자
   var payments = document.loandata.years.value * 12;	//대출상환개월수

  	var x = principal-monthly;
	var monthly = principal / payments;	//매월갚을 원금금액(fix)
	var interest = document.loandata.interest.value / 12;
 	var payment = (principal-monthly) / payments;
	/* 첫달      이자금액 principal * interest /12 
	두번쨰달 이자금액 (principal-monthly) * interest / 12 */
    

 
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
}
/* 만기일시상환 계산기  */
function calculate() {
	
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
}

	function round(x) {
	  return Math.round(x*100)/100;
	}
</script>

</head>
<body>
	
<%@include file="../header.jsp"%>

	<header>
		<c:choose>
        <c:when test="${voList != null }">
        <div class="logo">
        logo<img src="resources/img/logo.png" width="100px" height="100px" />
        </div>
        <c:forEach items="${voList}" var="vo">
        	${vo.M_ID }님
        </c:forEach>
        </c:when>
    </c:choose>
	</header>
	<br><br><br><br>
	
<div class="body">
	<table class="loandt">
		<tr>
			<td rowspan="2"><img class="img-fluid" src="../${recommendloancharter.RL_CH_IMG }" alt="test" width="300px" height="300px"></td>
			<td>대출상품명</td>
			<td>${recommendloancharter.FIN_PRDT_NM }</td>
		</tr>
		<tr>
			<td>은행명</td>
			<td>${recommendloancharter.KOR_CO_NM }</td>
		</tr>
	</table>
	
<aside>		
	<div class="bodyunder">
    
        <input type="radio" id="detail" class="tabb" name="tab" checked>
        <input type="radio" id="calculation" class="tabb" name="tab">
        <input type="radio" id="review" class="tabb" name="tab">
        
        <label class="tabtab" for="detail"><font size="5em">세부 정보</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="tabtab" for="calculation"><font size="5em">계산기</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="tabtab" for="review"><font size="5em">리뷰</font></label>
     	 <br><br><br><br>
        
        <!-- 세부정보 -->
        <div class="tab_item">
        	<h1>세부정보</h1>
        	<br><br><br><br>
            <ul>
                <li class="item">
        		    <div class="description">
						<b>공시 제출월</b>
                        <br><br><p><font size="5em">${recommendloancharter.DCLS_MONTH }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 금리 유형</b>	
						<br><br><p><font size="5em">${recommendloancharter.LEND_RATE_TYPE_NM }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 상환 유형</b>	
						<br><br><p><font size="5em">${recommendloancharter.RPAY_TYPE_NM }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>중도 상환 수수료</b>	
						<br><br><p><font size="5em">${recommendloancharter.ERLY_RPAY_FEE }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>연체 이자율</b>	
						<br><br><p><font size="5em">${recommendloancharter.DLY_RATE }</font></p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 한도</b>
						<br><br><p><font size="5em">${recommendloancharter.LOAN_LMT }</font></p>
                    </div>
                </li>
            </ul>
		</div>
		<br><br><br><br>

		<!-- 계산기 -->
        <div class="tab_item">
           <form name="loandata">
           <h1>계산기</h1>
            <br><br><br><br>
		<table class="loancalcul">
		<tr>
			<td colspan="2" style="font-size:30px; font-weight: bold;">대출 금액 및 이자율 입력</td>
		</tr>
		<tr>
			<td style="font-size:30px;">대출 금액입력</td>
			<td><input type="text" name="principal" class="need" size="12" style="text-align:center" onchange="calculate();"> 원</td>
		</tr>
		<tr>
			<td style="font-size:30px;">이자율(%)</td>
			<td><input type="text" name="interest" class="need" size="12" style="text-align:center" onchange="calculate();"> %</td>
		</tr>
		<tr>
			<td style="font-size:30px;">대출기간(년)</td>
			<td><input type="text" name="years" class="need" size="12" style="text-align:center" onchange="calculate();"> 년</td>
		</tr>
		<!-- <tr>
			<td>4)</td>
			<td>거치기간(년)</td>
			<td><input type="text" name="tyears" size="12" onchange="calculate();"> 년</td>
		</tr> -->
		<tr>
			<td colspan="2"><input type="button" class="calcal" value="계산" onclick="calculate();">
			<input type="button" value="다시입력" class="calcal" onclick="reset();"></td>
		</tr>
		<tr>
			<td colspan="2" style="font-size:30px; font-weight: bold;">상환내역:</td>
		</tr>
		<tr>
			<td style="font-size:30px;">월상환금은</td>
			<td><input type="text" name="payment" class="result" size="15" style="text-align:center"> 원씩 갚으면 되며</td>
		</tr>
		<tr>
			<td style="font-size:30px;">원금 및 이자합계는</td>
			<td><input type="text" name="total" class="result" size="15" style="text-align:center"> 원 이고</td>
		</tr>
		<tr>
			<td style="font-size:30px;">총 이자금액은</td>
			<td><input type="text" name="totalinterest" class="result" size="15" style="text-align:center"> 원 입니다.</td>
		</tr>
	</table>
</form>
        </div>
        <br><br><br><br>
        
        <!-- 리뷰 -->
        <div class="tab_item">
            	<div class="content">
            		<h1>리뷰</h1>
            		 <br><br>
			
			
			<!-- 리뷰 리스트 -->
			<div>
			<form action="recommendloan/recommendloanreview" method="get">
			<div class="reviewinsert">
			<table class="reviewlist" >
					<tr>
						<td>아이디</td>
						<td>별점</td>
						<td>내용</td>
					</tr>
					
					<c:if test="${listCount eq 0}">
						<tr>
							<td colspan="3" align="center"><br>
								<br>작성된 리뷰가 없습니다.<br><br>
							</td>
							</tr>
					</c:if>
					<c:if test="${listCount ne 0}">
						<tr>
							<td align="center">${recommendloanreview.M_ID }</td>
							<td align="center">${recommendloanreview.RLR_AST_ }</td>
							<td align="center">${recommendloanreview.RLR_COMMENT }</td>
						</tr>
					</c:if>
				</table>
				</div>
				
				<div class="paging">
				<c:if test="${currentPage<=1}">
                [이전]&nbsp; 
                </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="blistST" value="recommendloanlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}">[이전]</a>
				</c:if>
				<c:set var="endPage" value="${maxPage}" />
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="recommendloanlist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}"> 
 [다음] 
 </c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="recommendloanlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if>

			</div>
			</form> 
			</div>
			
			
			<!-- 리뷰 작성 -->
			
			<form action="recommendloan/recommendloanreviewinsert" method="get">
			<input type="hidden" id="rlr_num" name="rlr_num" value="${recommendloanreview.rlr_num}" readonly>
			<input type="hidden" id="page" value="${currentPage}">
			<input type="hidden" id="reviews" name="reviews" value>
			<table class="reviewtable" border="1" style="width: 70%">
	  			<tr>
	  				<td style="font-size:25px">내용</td>
	  				<td>
	  					<textarea style="width:700px; resize:none;" rows="10" cols="120" name="rlr_comment" placeholder="내용을 작성해주세요"></textarea>
	  				</td>
	  			</tr>
	  			<tr>
					<td style="font-size:25px">별점</td>
				  	<td class="star_rating">
     					<a href="#" class="on" id="1">★</a>
						<a href="#" class="on" id="2">★</a>
						<a href="#" class="on" id="3">★</a>
						<a href="#" id="4">★</a>
						<a href="#" id="5">★</a>
   						<input type="hidden" id="rlr_ast" name="rlr_ast" value="3">
					</td>
				</tr>
	  			
	  			<tr>
	  				<td colspan="2" style="text-align: center;">
	  					<input class="btnrv" type="submit" value="등록">
	  				</td>
	  			</tr>
			</table>
			<br><br><br><br>
			</form>
			
		</div> 
	</div>
</div>
</aside>
</div>


<%@include file="../footer.jsp"%>

</body> 
</html>