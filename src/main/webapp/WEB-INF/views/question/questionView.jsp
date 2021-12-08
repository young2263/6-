<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		
		<div class="content">
			<div class="listTitle" style="color: green">자주 묻는 질문</div>
			<br><br>
			<div>
				<table class="tableBox" >
					<tr>
						<th>글번호</th>
						<th>글제목</th>
					</tr>
					<c:forEach var="vo" items="${volist}" varStatus="status">
						<tr>
							<td><a href="questiondt?no=${vo.q_NUM}" style="color: black">${row.q_TITLE}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<td colspan="2">
				<button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
			</td>
			<br><br><br>
			
			<div class="paging">
				<c:if test="${currentPage<=1}">
                [이전]&nbsp; 
                </c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="qlistST" value="questionlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${qlistST}">[이전]</a>
				</c:if>
				<c:set var="endPage" value="${maxPage}" />
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="qlistchk" value="questionlist">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${qlistchk}">${p}</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}"> 
				 [다음] 
				 </c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="qlistEND" value="questionlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${qlistEND}">[다음]</a>
				</c:if>

			</div>
		</div>
	</div>
	<br><br><br><br>
<%@include file="../footer.jsp"%>
		
</body>
</html>