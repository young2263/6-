<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#iii i {
		font-size:50px;
	}
</style>
</head>
<body>
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">LOANPLAN</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> 서울특별시 중구 남대문로
							120 대일빌딩 2F, 3F</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-020-0340">010-0000-0000</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">info@loanplan.company</a>
						</li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none"
							href="recommendloan/recommendloanlist">주택담보대출</a></li>
						<li><a class="text-decoration-none"
							href="recommendloan/recommendloancharterlist">전세자금대출</a></li>
						<li><a class="text-decoration-none"
							href="recommendloan/recommendloancreditlist">개인신용대출</a></li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Further
						Info</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="">Home</a></li>
						<li><a class="text-decoration-none" href="${pageContext.request.contextPath}/question/questionView">FAQs</a></li>
						<li><a class="text-decoration-none" href="${pageContext.request.contextPath}/calview">Calculator</a></li>
					</ul>
				</div>

			</div>

			<div class="row text-light mb-4">
				<div class="col-12 mb-3">
					<div class="w-100 my-3 border-top border-light"></div>
				</div>
				<div class="col-auto me-auto">
					<ul class="list-inline text-left footer-icons">
						<li id="iii"
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://github.com/young2263/"><i
								class="fab fa-github" style="font-size:50px;"></i></a>
						</li>
						<li id="iii"
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://github.com/asdlfkjasldf/"><i
								class="fab fa-github" style="font-size:50px;"></i></a>
						</li>
						<li id="iii"
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://github.com/yongjaejo/"><i
								class="fab fa-github" style="font-size:50px;"></i></a>
						</li>
						<li id="iii"
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://github.com/ByungJun1/"><i
								class="fab fa-github" style="font-size:50px;"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-auto">
					<label class="sr-only" for="subscribeEmail">Email address</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control bg-dark border-light"
							id="subscribeEmail" placeholder="Email address">
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
							Copyright &copy; 2021 LOANPLAN | Designed by <a rel="sponsored"
								href="" target="_blank">LOANPLAN</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
</body>
</html>