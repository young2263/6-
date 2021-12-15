<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/templatemo.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>Insert title here</title>
<style>
	#nav_ul ul{
		list-style-type : none;
		text-align : center;
		margin : 0 auto;
	}
	
	#nav_ul li {
		display : inline-block;
	}
	
</style>

<script>
$(document).ready(function(){
		$("#editBtn").click(function(){ //수정완료 클릭 시
		console.log("수정완료버튼 클릭");
	var uid2 = $("#uid2").html();
		console.log("id: "+uid2);
		var json = {
				'm_id':$("#m_id").html(),
				'm_phn':$("#m_phn").val(),
				'm_email':$("#m_email").val()
			};
		
		console.log(json);
		$.ajax({
			url: "${pageContext.request.contextPath}/member",
			type: "put",
			data: JSON.stringify(json),
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(result == ""){
					alert("회원정보 수정 실패");
				} else {
					alert("회원정보 수정 성공");
					location.href ="${pageContext.request.contextPath}/members/mypage"
				}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
		});
	})
});
</script>

</head>
<%@include file="../header.jsp"%>
<body>
	<h1>마이 페이지</h1>
	<ul id="nav_ul">
		<li><a href="/loanplan/myPage">내 정보</a></li>
		<li><a href="/loanplan/updateMyPage">개인정보 수정</a></li>
		<li><a href="/loanplan/updatePwd">비밀번호 변경</a></li>
		<li><a href="/loanplan/deleteMember">회원 탈퇴</a></li>
	</ul>
	<div id="content">
		<div>
			<h3>${vo.m_name} 님의 정보입니다.</h3>
			<h3>개인정보 수정 페이지입니다.</h3>
			<h4>아이디, 이름, 생년월일, 성별 정보는 고객센터를 통해 수정하실 수 없습니다.</h4>
		</div>
		<form method="post" name="update_frm" action="updateMember">
	        <table id="m_table">
	        	<tr>
	                <td>이름</td>
	                <td id="m_id">${vo.m_name}</td>
	            </tr>
	            <tr>
	                <td>아이디</td>
	                <td>${vo.m_id}</td>
	            </tr>
	            <tr>
	                <td>성별</td>
	                <td>${vo.m_gender}</td>
	            </tr>
	            <tr>
	                <td>휴대폰</td>
	                <td ><input id="m_phn" type="text" value="${vo.m_phn}"></td>
	            </tr>
	            <tr>
	                <td>이메일</td>
	                <td ><input id="m_email" type="text" value="${vo.m_email}"></td>
	            </tr>
	            <tr>
	                <td>직업</td>
	                <td ><input id="m_job" type="text" value="${vo.m_job}"></td>
	            </tr>
	            <tr>
	                <td>주소</td>
	                <td ><input id="m_address" type="text" value="${vo.m_address}"></td>
	            </tr>
	            <tr>
	                <td>(예상) 연봉</td>
	                <td>
	                	<select name = "m_asset">
							<option value="0">없음</option>
							<option value="100">1500 ~ 2500 만원</option>
							<option value="200">2500 ~ 3500 만원</option>
							<option value="300">3500 ~ 5000 만원</option>
							<option value="500">5000만원 이상</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <td>(예상) 부채</td>
	                <td>
	                	<select name = "m_debt">
							<option value="300">없음</option>
							<option value="200">1000만원 이하</option>
							<option value="100">1000 만원 이상 5000 만원 이하</option>
							<option value="0">5000 만원 이상</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <td>차량 소지 여부</td>
	                <td>
	                	<select name = "m_house">
							<option value="0">없음 </option>
							<option value="100">월세</option>
							<option value="200">전세</option>
							<option value="300">매매(자가)</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <td>주택 소지 여부</td>
	                <td>
	                	<select name = "m_house">
							<option value="0">없음 </option>
							<option value="100">월세</option>
							<option value="200">전세</option>
							<option value="300">매매(자가)</option>
						</select>
					</td>
	            </tr>
	        </table>
	        <div class="search-buttons">
	          <button type="submit">수정완료</button>
	     	</div>
        </form>
    </div>
</body>
<%@include file="../footer.jsp"%>
</html>