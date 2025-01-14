<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<html lang="ko">
<head>
<title>LOANPLAN</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="apple-touch-icon" href="resources/img/apple-icon.png">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="resources/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->

</head>

<body>
	<!-- Start Top Nav -->
	<%@include file="./header.jsp"%>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Start Banner Hero -->

	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
         <c:forEach var="vo" items="${advertiseList}" varStatus="status">
            <c:choose>
            <c:when test="${status.count ==1 }">
               <li data-bs-target="#template-mo-zay-hero-carousel"
                  data-bs-slide-to="${vo.AD_NUM}" class="active"></li>
            </c:when>
            <c:otherwise>
               <li data-bs-target="#template-mo-zay-hero-carousel"
                  data-bs-slide-to="${vo.AD_NUM}"></li>
            </c:otherwise>
            </c:choose>
         </c:forEach>
      </ol>
      <div class="carousel-inner">
         <c:forEach var="vo" items="${advertiseList}" varStatus="status">
            <c:choose>
            <c:when test="${status.count ==1 }">
            <div class="carousel-item active">
               <div class="container">
                  <div class="row p-5">
                     <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <a href="${vo.AD_SRC}"><img class="img-fluid"
                           src="${vo.AD_IMG}" alt=""></a>
                     </div>
                     <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                           <h1 class="h1">${vo.AD_TITLE}</h1>
                           <p>${vo.AD_CONTENT}</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </c:when>
            <c:otherwise>
            <div class="carousel-item">
               <div class="container">
                  <div class="row p-5">
                     <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <a href="${vo.AD_SRC}"><img class="img-fluid"
                           src="${vo.AD_IMG}" alt=""></a>
                     </div>
                     <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                           <h1 class="h1">${vo.AD_TITLE}</h1>
                           <p>${vo.AD_CONTENT}</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </c:otherwise>
            </c:choose>
         </c:forEach>
      </div>


		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-angle-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-angle-right"></i>
		</a>
	</div>

	<!-- End Banner Hero -->


	<!-- Start Categories of The Month -->
	<section class="container py-5">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">언론과 대출플랜</h1>

			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="https://www.finda.co.kr/post/allnew/7353"><img
					src="./resources/img/howtoloan.png"
					class="rounded-circle img-fluid border"></a>
				<h5 class="text-center mt-3 mb-3">똑똑하게 대출받기</h5>
				<p class="text-center">
					<a href="https://www.finda.co.kr/post/allnew/7353"
						class="btn btn-success">Go Site</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="https://www.finda.co.kr/post/allnew/6920"><img
					src="./resources/img/creditplan.png"
					class="rounded-circle img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">신용등급관리</h2>
				<p class="text-center">
					<a href="https://www.finda.co.kr/post/allnew/6920"
						class="btn btn-success">Go Site</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="https://www.finda.co.kr/post/allnew/6062"><img
					src="./resources/img/howtohouse.png"
					class="rounded-circle img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">현명한 주택담보대출</h2>
				<p class="text-center">
					<a href="https://www.finda.co.kr/post/allnew/6062"
						class="btn btn-success">Go Site</a>
				</p>
			</div>
		</div>
	</section>
	<!-- End Categories of The Month -->


	<!-- Start Featured Product -->
	<section class="bg-light">
		<div class="container py-5">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">
						회원님에게<br>알맞은대출을<br>추천해드립니다
					</h1>
					<p>이 사이트에서는 회원님의 연봉, 자차/자택유무에 따라 주택담보대출, 전세자금대출, 그리고 개인신용대출 세
						가지 중 회원님께 알맞은 대출을 안내해 드립니다.</p>
				</div>
			</div>
			<div class="row" style="margin: 0 auto;">
				<c:set var="m_house" scope="session" value="${m_house}" />
				<c:set var="m_asset" scope="session" value="${m_asset}" />
				<c:choose>
					<c:when test="${member != null &&  member.m_house == 300 && member.m_asset == 300}">
						<div class="col-12 col-md-4 mb-4"
							style="margin: 0 auto; width: 500px">
							<div class="card h-100">
								<a href="recommendloan/recommendloanlist"> <img
									src="./resources/img/loann.png" class="card-img-top" alt="...">
								</a>
								<div class="card-body">
									<ul class="list-unstyled d-flex justify-content-between">
										<li><i class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i></li>
									</ul>
									<a href="recommendloan/recommendloanlist"
										class="h2 text-decoration-none text-dark">주택담보대출</a>
									<p class="card-text">주택담보대출 종류와 상세정보를 보여드립니다.</p>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${member != null && member.m_house == 0 && member.m_asset == 200}">
						<div class="col-12 col-md-4 mb-4"
							style="margin: 0 auto; width: 500px">
							<div class="card h-100">
								<a href="recommendloan/recommendloancharterlist"> <img
									src="./resources/img/charterloann.png" class="card-img-top"
									alt="...">
								</a>
								<div class="card-body">
									<ul class="list-unstyled d-flex justify-content-between">
										<li><i class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i></li>
									</ul>
									<a href="recommendloan/recommendloancharterlist"
										class="h2 text-decoration-none text-dark">전세자금대출</a>
									<p class="card-text">전세자금대출 종류와 상세정보를 보여드립니다.</p>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${member != null && member.m_asset == 100}">
						<div class="col-12 col-md-4 mb-4"
							style="margin: 0 auto; width: 500px">
							<div class="card h-100">
								<a href="recommendloan/recommendloancreditlist"> <img
									src="./resources/img/creditloann.png" class="card-img-top"
									alt="...">
								</a>
								<div class="card-body">
									<ul class="list-unstyled d-flex justify-content-between">
										<li><i class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i></li>
									</ul>
									<a href="recommendloan/recommendloancreditlist"
										class="h2 text-decoration-none text-dark">개인신용대출</a>
									<p class="card-text">개인신용대출 종류와 상세정보를 보여드립니다.</p>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${member == null }">
						<div class="col-12 col-md-4 mb-4"
							style="margin: 0 auto; width: 500px">
							<div class="card h-100"
								style="text-align: center; padding: 10px 0">
								<a href="register">
									<button
										style="border: none; background-color: green; width: 400px; height: 40px; color: white;">회원가입하고
										대출 추천받기</button>
								</a>
								<div class="card-body">

									<p class="h2 text-decoration-none text-dark">회원가입을 해주세요.</p>
									<p class="card-text">회원가입을 하시면 자산, 자차/자택유무에 맞게 대출을 추천해드립니다.</p>
								</div>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="col-12 col-md-4 mb-4"
							style="margin: 0 auto; width: 500px">
							<div class="card h-100"
								style="text-align: center; padding: 10px 0">
								<a href="question/questionView">
									<button
										style="border: none; background-color: green; width: 400px; height: 40px; color: white;">궁금한점
										알아보기</button>
								</a>
								<div class="card-body">

									<p class="h2 text-decoration-none text-dark">궁금한 것이 있으신가요?</p>
									<p class="card-text">공지사항을 통해 내용을 확인해주세요!</p>
								</div>
							</div>
						</div>
					</c:otherwise>

				</c:choose>

			</div>
		</div>
	</section>
	<!-- End Featured Product -->


	<!-- Start Footer -->
	<%@include file="./footer.jsp"%>
	<!-- End Footer -->

	<!-- Start Script -->
	<!-- <script src="resources/js/jquery-1.11.0.min.js"></script>
    <script src="resources/js/jquery-migrate-1.2.1.min.js"></script>
     -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/templatemo.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- End Script -->
</body>
</html>
