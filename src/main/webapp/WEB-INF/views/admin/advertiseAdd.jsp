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
			<!-- <img src="resources/img/logo.png" width="100px" height="100px" /> -->
		</div>
		<div class="admin">관리자 정보</div>
	</header>
	<div class="body">
		<div class="navbar">
			<div class="navbarItem">사용자관리</div>
			<div class="navbarItem">대출상품관리</div>
			<div class="navbarItem">광고관리</div>
		</div>
		<div class="content">
            <div class="title">
                <h3>광고 추가</h3>
            </div>

            <form action="#" method="post" class="tableBox">
                <table>
					<tr>
						<th>광고 제목</th>
						<td><input type="text"></td>
					</tr>
						<tr>
							<th>광고 내용</th>
							<td><textarea name="" id="" cols="62" rows="5"></textarea></td>
						</tr>
                        <tr>
							<th>광고 이미지</th>
                            <td><input type="file"></td>
						</tr>

                        <tr>
                            <th>광고 URL</th>
                            <td><input type="text"></td>
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