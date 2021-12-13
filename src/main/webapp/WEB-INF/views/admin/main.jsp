<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/admin/adminMain.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<header>
		<div class="logo">
			logo <img src="resources/img/logo.png" width="100px" height="100px" />
		</div>
		<div class="admin">관리자 정보</div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">
				<a href="member">사용자관리</a>
			</div>
			<div class="navbarItem">
				<a href="admin">대출상품관리</a>
			</div>
			<div class="navbarItem">
				<a href="advertise">광고관리</a>
			</div>
			<div class="navbarItem">
				<a href="comment">공지사항관리</a>
			</div>
		</div>
		<div class="content">
			<div class="listTitle">대출 상품 관리</div>
			<div class="searchBox">
				<input type="text">
				<button>확인</button>
			</div>
			<div class="button">
				<div class="guar_btn">
					<a href="admin">담보</a>
				</div>
				<div class="credit_btn">
					<a href="creditLoan">신용</a>
				</div>
				<div class="jeon_btn">
					<a href="charterLoan">전세자금</a>
				</div>
			</div>

			<div>
				<table class="tableBox">
					<tr>
						<th>대출상품명</th>
						<th>대출 유형</th>
						<th>대출 상환 방식</th>
						<th>이자율</th>
						<th>은행</th>
					</tr>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr class="loanBox1">
							<td><a href="loanModify?NUM=${vo.RL_NUM}">${vo.FIN_PRDT_NM }</a></td>
							<td>${vo.LEND_RATE_TYPE_NM }</td>
							<td>${vo.RPAY_TYPE_NM }</td>
							<td>${vo.DLY_RATE }</td>
							<td>${vo.KOR_CO_NM }</td>
							<td class="deleteBtn"><a
								href="deleteLoan?RL_NUM=${vo.RL_NUM}">
									<button>삭제</button>
							</a></td>
						</tr>
					</c:forEach>
					</div>
				</table>
			</div>
			<div>
				<c:if test="${currentPage<=1}">
                [이전]&nbsp;
                </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="blistST" value="admin">
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
						<c:url var="blistchk" value="admin">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}"> 
 [다음] 
 </c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="admin">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if>

			</div>
			<a href="loanAdd">
				<div class="addBtn">추가</div>
			</a>
		</div>
	</div>

	<script>
		$(".credit_btn").css("opacity", "0.5");
		$(".guar_btn").css("opacity", "1.2");
		$(".jeon_btn").css("opacity", "0.5");
	</script>
</body>
</html>