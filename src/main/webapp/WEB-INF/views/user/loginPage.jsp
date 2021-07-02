<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page~~</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<img class="logo" src="../../../resources/images/wp_logo.png">
					<div class="tagline">Welcome Package ! <br> 로그인 하고 이용부탁드려요</div>
				</div>
				
					<form action="/user/login" method="get" id="login-button">
					<div class="form-group">
						<label for="email">아이디</label>     
						<input type="text" class="login-input" id="email" name="email" placeholder="아이디(이메일)를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> 
						<input type="password"	class="login-input" id="password" name="password" placeholder="비밀번호를 입렵해주세요">
					</div>				
					<input type="submit" value="로그인"></input>	
					<input type="submit" value="회원가입"></input>				
					</form>
			</div>
		</div>
		</div>


</body>
</html>