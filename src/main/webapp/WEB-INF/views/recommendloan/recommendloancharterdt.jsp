<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name='viewpoint' content='width=device-width, initial-scale=1'>
<title>전세자금대출</title>
<!-- <link rel="stylesheet" href="./resources/css/admin/templatemo.css">   -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
    *{margin:0; padding:0;}
    
</style>

<style>
/*
	.body > aside {
		float:left;
		width: 100%;
	}
	
	input:nth-of-type(1) {display:none;}
	input:nth-of-type(1) ~ div:nth-of-type(1) {display:none;}
	input:nth-of-type(1):checked ~ div:nth-of-type(1) {display:block;}
	
	input:nth-of-type(2) {display:none;}
	input:nth-of-type(2) ~ div:nth-of-type(2) {display:none;}
	input:nth-of-type(2):checked ~ div:nth-of-type(2) {display:block;}
	
	input:nth-of-type(3) {display:none;}
	input:nth-of-type(3) ~ div:nth-of-type(3) {display:none;}
	input:nth-of-type(3):checked ~ div:nth-of-type(3) {display:block;}
*/
/* 탭 모양 */
/*
	aside > label {
		display : block;
		float: left;
		width: 100%; height:30px;
		text-align: center;
		line-height: 30px;
		
		border: 1px solid black;
		box-sizing: border-box;
		
		background-color:white;
		color:blue;
	}
	input:nth-of-type(1):checked ~ label:nth-of-type(1) {
		background-color: blue;
		color: white;
	}
	input:nth-of-type(2):checked ~ label:nth-of-type(2) {
		background-color: blue;
		color: white;
	}
	input:nth-of-type(3):checked ~ label:nth-of-type(3) {
		background-color: blue;
		color: white;
	}
*/
	
	/* 탭 목록 */
/*
	.tab_item .item {
		overflow: hidden;
		padding: 10px;
		border: 1px solid black;
		border-top: none;
	}
	.item .description {
		float:left;
		margin-left: 10px;
		width: 100%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: eclipsis;
	} 
*/	
	
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
	.star_rating a.on {color:rgb(217, 255, 0);}
	
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
	<!-- Open Top Nav -->
<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="#">
                LOANPLAN
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">추천 대출</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">계산기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">내 대출 관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">공지사항</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <div class="nav-icon d-none d-lg-inline" >
                        	<p> 내 정보 관리 </p>
                    </div>
                </div>
            </div>

        </div>
    </nav>


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
			<td>${recommendloancharter.RL_CH_IMG }</td>
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
    <!-- 
        <input type="radio" id="detail" name="tab" checked>
        <input type="radio" id="calculation" name="tab">
        <input type="radio" id="review" name="tab">
        
        <label for="detail">세부 정보</label><label for="calculation">계산기</label><label for="review">리뷰</label>
     -->    
        
        <!-- 세부정보 -->
        <div class="tab_item">
        	<h1>세부정보</h1>
            <ul>
                <li class="item">
        		    <div class="description">
						<b>공시 제출월</b>
                        <br><p>${recommendloancharter.DCLS_MONTH }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 금리 유형</b>	
						<br><p>${recommendloancharter.LEND_RATE_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 상환 유형</b>	
						<br><p>${recommendloancharter.RPAY_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>중도 상환 수수료</b>	
						<br><p>${recommendloancharter.ERLY_RPAY_FEE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>연체 이자율</b>	
						<br><p>${recommendloancharter.DLY_RATE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 한도</b>
						<br><p>${recommendloancharter.LOAN_LMT }</p>
                    </div>
                </li>
            </ul>
		</div>


		<!-- 계산기 -->
        <div class="tab_item">
           <form name="loandata">
           <h1>계산기</h1>
	<table>
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
        	<form action="recommendloancharterreview" method="get">
            	<div class="content">
            		<h1>리뷰</h1>
				<input type="hidden" name="rl_ch_num" value=${rl_ch_num }>
				
			<table border="1" style="width: 80%">
	  			<tr>
	  				<td>내용</td>
	  				<td>
	  					<textarea rows="5" cols="50" name="rlr_comment"></textarea>
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
		</div>
      </form>  
	</div>
</aside>
</div>


<!-- footer -->
	<footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            123 Consectetur at ligula 10660
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                        <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                        <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 Company Name 
                            | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>

</body> 
</html>