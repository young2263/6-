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
		width: 700px;
		text-align: center;
		padding-left: 50px;
		font-size: 20px;
		margin: auto;
		padding-bottom: 40px;
		border-spacing: 0 40px;
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

	aside > label {
		display : inline-block;
		width: 100%; line-height:30px;
		background-color:white;
		color:blue;
	}

	.tabtab {
		font-size: 20px;
	}

	.tabb:nth-of-type(1):checked ~ label:nth-of-type(1) {
		background-color: blue;
		color: white;
	}
	.tabb:nth-of-type(2):checked ~ label:nth-of-type(2) {
		background-color: blue;
		color: white;
	}
	.tabb:nth-of-type(3):checked ~ label:nth-of-type(3) {
		background-color: blue;
		color: white;
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
		margin: auto;
	}

	.tab_item .reviewtable {
        margin: auto;
        border: none;
    }
    
    .reviewlist {
    	margin: auto;
    	border: none;
    	border-spacing: 200px;
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
	
	
<div class="body">
	<table>
		<tr><td height="15" width="100"></td>
			<td><img class="img-fluid" src="${recommendloancharter.RL_CH_IMG }" alt="test"></td>
		</tr>
		<tr><td height="15" width="100">대출상품명</td>
			<td>${recommendloancharter.FIN_PRDT_NM }</td>
		</tr>
		<tr><td height="15" width="100">은행명</td>
			<td>${recommendloancharter.KOR_CO_NM }</td>
		</tr>
	</table>
	
<aside>		
	<div class="bodyunder">
    
        <input type="radio" id="detail" class="tabb" name="tab" checked>
        <input type="radio" id="calculation" class="tabb" name="tab">
        <input type="radio" id="review" class="tabb" name="tab">
        
        <label class="tabtab" for="detail">세부 정보</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="tabtab" for="calculation">계산기</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="tabtab" for="review">리뷰</label>
     	 <br><br><br><br>
        
        <!-- 세부정보 -->
        <div class="tab_item">
        	<h1>세부정보</h1>
        	<br><br><br><br>
            <ul>
                <li class="item">
        		    <div class="description">
						<b>공시 제출월</b>
                        <br><br><p>${recommendloancharter.DCLS_MONTH }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 금리 유형</b>	
						<br><br><p>${recommendloancharter.LEND_RATE_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 상환 유형</b>	
						<br><br><p>${recommendloancharter.RPAY_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>중도 상환 수수료</b>	
						<br><br><p>${recommendloancharter.ERLY_RPAY_FEE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>연체 이자율</b>	
						<br><br><p>${recommendloancharter.DLY_RATE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 한도</b>
						<br><br><p>${recommendloancharter.LOAN_LMT }</p>
                    </div>
                </li>
            </ul>
		</div>


		<!-- 계산기 -->
        <div class="tab_item">
           <form name="loandata">
           <h1>계산기</h1>
           <br><br><br><br>
	<table class="loancalcul">
		<tr>
			<td colspan="3"><b>대출 금액 및 이자율 입력</b></td>
		</tr>
		<tr>
			<td>1)</td>
			<td>대출 금액입력</td>
			<td><input type="text" name="principal" size="12" onchange="calculate();"> 원</td>
		</tr>
		<tr>
			<td>2)</td>
			<td>이자율(%)</td>
			<td><input type="text" name="interest" size="12" onchange="calculate();"> %</td>
		</tr>
		<tr>
			<td>3)</td>
			<td>대출기간(년)</td>
			<td><input type="text" name="years" size="12" onchange="calculate();"> 년</td>
		</tr>
		<!-- <tr>
			<td>4)</td>
			<td>거치기간(년)</td>
			<td><input type="text" name="tyears" size="12" onchange="calculate();"> 년</td>
		</tr> -->
		<tr>
			<td colspan="3"><input type="button" value="계산" onclick="calculate();">
			<input type="button" value="다시입력" onclick="reset();"></td>
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
        </div>
        
        
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
	  				<td>내용</td>
	  				<td>
	  					<textarea style="resize:none;" rows="10" cols="120" name="rlr_comment" placeholder="내용을 작성해주세요"></textarea>
	  				</td>
	  			</tr>
	  			<tr>
					<td>별점</td>
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
	  					<input type="submit" value="등록">
	  				</td>
	  			</tr>
			</table>
			</form>
			
		</div> 
	</div>
</div>
</aside>
</div>


<%@include file="../footer.jsp"%>

</body> 
</html>