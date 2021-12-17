<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>주택담보대출</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/templatemo.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="resources/css/fontawesome.min.css">


<style>
	* {
    	padding: 0;
    	margin: 0;
    	box-sizing: border-box;
	}
	
	header{
		padding-bottom: 100px;
	}

	.listTitle{
		text-align: center;
	}

	table {
		width: 80%;
		text-align: center;
		padding-left: 50px;
		font-size: 20px;
		margin: auto;
		padding-bottom: 40px;
		border-collapse: separate;
		border-spacing: 30px 40px;
		border-bottom: 1px solid gray;
    }
    
    tr:first-of-type {
    	font-size: 25px;
    }
   
   td {
   		white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        border-right : 1px solid gray;
   }
   
   a {
   		text-decoration-line: none;
   }
   
   .paging {
   		padding: 50px 20px;
   		text-align:center;
   }
</style>

</head>
<body>
<%@include file="../header.jsp"%>
<br><br><br><br>
	
	<div class="body">
		
		<div class="content">
			<div class="listTitle" style="color: green"><h1 style="font-size: 30px">주택 담보 대출</h1></div>
			<br><br>
			<div>
				<table class="tableBox" >
					<tr>
						<th>로고</th>
						<th>은행</th>
						<th>대출상품명</th>
						<th>대출 금리 유형</th>
					</tr>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr>
							<td><a href="recommendloandt?rlnum=${vo.RL_NUM}" style="color: black;"><img class="img-fluid" src="../${vo.RL_IMG }" alt="test" width="100px" height="100px"></a></td>
							<td><a href="recommendloandt?rlnum=${vo.RL_NUM}" style="color: black;"><font size="3px">${vo.KOR_CO_NM}</font></a></td>
							<td><a href="recommendloandt?rlnum=${vo.RL_NUM}" style="color: black;"><font size="3px">${vo.FIN_PRDT_NM }</font></a></td>
							<td><a href="recommendloandt?rlnum=${vo.RL_NUM}" style="color: black;"><font size="3px">${vo.LEND_RATE_TYPE_NM }</font></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br><br><br>
			
			<div class="paging">
				<c:if test="${currentPage<=1}">
                	이전&nbsp;&nbsp;
                </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="blistST" value="recommendloanlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}" style="color:black;">이전</a>&nbsp;
				</c:if>
				<c:set var="endPage" value="${maxPage}" />
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="white" size="4"><b style="background-color:green; border-radius: 10px 10px 10px 10px; width:30px; text-align:center;" >${p}</b></font>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="recommendloanlist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}" style="color:black;">${p}</a>&nbsp;&nbsp;&nbsp;
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}"> 
 다음
 </c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="recommendloanlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}" style="color:black;">다음</a>&nbsp;&nbsp;&nbsp;
				</c:if>

			</div>
		</div>
	</div>
	<br><br><br><br>
	
<%@include file="../footer.jsp"%>

</body> 
</html>