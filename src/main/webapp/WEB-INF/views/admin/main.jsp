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
			<div class="navbarItem">사용자관리</div>
			<div class="navbarItem">
				<a href="admin">대출상품관리</a>
			</div>
			<div class="navbarItem">
				<a href="advertise">광고관리</a>
			</div>
			<div class="navbarItem">댓글관리</div>
		</div>
		<div class="content">
			<div class="listTitle">대출 상품 관리</div>
			<div class="loanBox">
				<input type="text">
				<button>확인</button>
				<select name="loan" class="loanSelectBox">
					<option value="대출 종류">대출 종류</option>
					<option value="전세자금대출">전세자금대출</option>
					<option value="주택담보대출">주택담보대출</option>
					<option value="개인신용대출">개인신용대출</option>
				</select>
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
							<td>${vo.FIN_PRDT_NM }</td>
							<td>${vo.LEND_RATE_TYPE_NM }</td>
							<td>${vo.RPAY_TYPE_NM }</td>
							<td>${vo.DLY_RATE }</td>
							<td>${vo.KOR_CO_NM }</td>
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
		$(".loanSelectBox").on(
				"change",
				function() {
					var job = new Object();
					job.text = $(".loanSelectBox").val()
					$.ajax({
						url : "loanSelect",
						data : JSON.stringify(job),
						type : "post",
						contentType : "application/json; charset=utf-8",
						dataType: "json",
						success : function(data) {
							for(let i in data){
								let text ="<tr>"+
								"<td>"+data[i]["FIN_PRDT_NM"]+"</td>"+
							"</tr>";
							$(".loanBox1").html(text)
							text=null;
							console.log(data[i])
							console.log(data[i]["FIN_PRDT_NM"])
							}
							

						},
						error : function(request, status, errorData) {
							console.log("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "error : " + errorData);
						}
					})
				})
	</script>
</body>
</html>