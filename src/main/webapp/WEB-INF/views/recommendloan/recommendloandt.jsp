<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name='viewpoint' content='width=device-width, initial-scale=1'>
<title>주택담보대출</title>
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
	
	.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
	}
	
	.rating .rate_radio:checked + label {
    	background-color: #ff8;
	}
	
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
    	max-width: 480px;
    	margin: 0 auto; /* 화면 가운데로 */
    	background-color: #fff;
    	height: 100%;
    	padding: 20px;
    	box-sizing: border-box;
	}

	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	
	.rating .rate_radio {
    	position: relative;
    	display: inline-block;
    	z-index: 20;
    	opacity: 0.001;
    	width: 60px;
    	height: 60px;
    	background-color: #fff;
    	cursor: pointer;
    	vertical-align: top;
    	display: none;
	}
	
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('./img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	
	.rating .rate_radio:checked + label {
	    background-color: #ff8;
	}

	.warning_msg {
    	display: none;
    	position: relative;
    	text-align: center;
    	background: #ffffff;
    	line-height: 26px;
    	width: 100%;
    	color: red;
    	padding: 10px;
    	box-sizing: border-box;
    	border: 1px solid #e0e0e0;
	}
	
</style>

<script type="text/javascript">
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
//상품평 작성 글자수 초과 체크 이벤트 리스너
document.querySelector('.review_textarea').addEventListener('keydown',function(){
    //리뷰 400자 초과 안되게 자동 자름
    let review = document.querySelector('.review_textarea');
    let lengthCheckEx = /^.{400,}$/;
    if(lengthCheckEx.test(review.value)){
        //400자 초과 컷
        review.value = review.value.substr(0,400);
    }
});

//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
    //리뷰 5자 미만이면 메시지 표시
    if(document.querySelector('.review_textarea').value.length < 5){
        rating.showMessage('review');
        return false;
    }
    //폼 서밋
});
Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
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
        <div class="logo">logo</div>
        <c:forEach items="${voList}" var="vo">
        	${vo.M_ID }님
        </c:forEach>
        </c:when>
    </c:choose>
	</header>
	
	
<div class="body">
	<table align="center" cellpadding="10" cellspacing="0" border="1" width="100%" class="tableBox">
		<tr align="center" valign="middle">
			<th colspan="2">${recommendloan.RL_NUM}</th>
		</tr>
		<tr><td height="15" width="100"></td>
			<td>${recommendloan.RL_IMG }</td>
		</tr>
		<tr><td height="15" width="100">대출상품명</td>
			<td>${recommendloan.FIN_PRDT_NM }</td>
		</tr>
		<tr><td height="15" width="100">은행명</td>
			<td>${recommendloan.KOR_CO_NM }</td>
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
                        <br><p>${recommendloan.DCLS_MONTH }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 금리 유형</b>	
						<br><p>${recommendloan.LEND_RATE_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 상환 유형</b>	
						<br><p>${recommendloan.RPAY_TYPE_NM }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>중도 상환 수수료</b>	
						<br><p>${recommendloan.ERLY_RPAY_FEE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>연체 이자율</b>	
						<br><p>${recommendloan.DLY_RATE }</p>
                    </div>
                </li>
                <li class="item">
        		    <div class="description">
						<b>대출 한도</b>
						<br><p>${recommendloan.LOAN_LMT }</p>
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
        	<form action="recommendloanreview" method="get">
            <div class="content">
            	<h1>리뷰</h1>
    <form name="reviewform" class="reviewform" method="get" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
        <div class="review_contents">
            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
            <textarea rows="10" class="review_textarea"></textarea>
        </div>   
        <div class="cmd">
            <input type="button" name="save" id="save" value="등록">
        </div>
    </form>
</div>
        
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