<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/admin/advertiseAdd.css">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="logo">
		<img src="resources/img/loanplan.png" width="200px" height="100px" /> 
		</div>
		<div class="admin"><a href="/loanplan">메인페이지</a></div>
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
            <div class="title">
                <h2>광고 추가</h2>
            </div>

            <form action="advertiseAdd.do" method="post" class="tableBox" enctype="multipart/form-data">
                <table>
					<tr>
						<th>광고 제목</th>
						<td><input name="AD_TITLE" type="text"></td>
					</tr>
						<tr>
							<th>광고 내용</th>
							<td><textarea name="AD_CONTENT" name="" id="" cols="62" rows="5"></textarea></td>
						</tr>
                        <tr>
							<th>광고 이미지</th>
                            <td><input name="AD_IMG" type="file"></td>
						</tr>

                        <tr>
                            <th>광고 URL</th>
                            <td><input name="AD_SRC" type="text"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="addBtn" type="submit"></input></td>
                        </tr>
				</table>
                </form>
            </div>
			

            
			
		</div>
	</div>

	<script>
           
	</script>
</body>
</html>