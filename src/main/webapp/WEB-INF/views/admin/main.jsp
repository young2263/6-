<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/adminMain.css" type="text/css" rel="stylesheet"/> 
</head>
<body>

<header>

        <div class="logo"> logo </div>
        <div class="admin">
            관리자 정보
        </div>
    </header>
    <div class="body">
        <div class="navbar">
            <div class="navbarItem">사용자관리</div>
            <div class="navbarItem">대출상품관리</div>
            <div class="navbarItem">광고관리</div>
        </div>
        <div class="content">
            <div class="listTitle">대출 상품 관리</div>
            <div class="loanBox"> 
                <input type="text">
                <button>확인</button>
                <select name="loan">
                    <option value="prop">대출 종류</option>
                    <option value="학생">전세자금대출</option>
                    <option value="회사원">주택담보대출</option>
                    <option value="기타">개인신용대출</option>
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
                    <tr>
                       <td>${vo.RL_CATEGORY}</td>
                       <td>${vo.KOR_CO_NM}</td>
                       <td>${vo.FIN_PRDT_NM}</td>
                       <td>${vo.LEND_RATE_TYPE_NM}</td>
                       <td>${vo.RPAY_TYPE_NM}</td>
                    </tr>
                    </c:forEach>
           
                </div>
                <div class="addBtn">
                    <button>추가</button>
                </div>
            </div>
        </div>
        
        <script>
        	
        </script>
</body>
</html>