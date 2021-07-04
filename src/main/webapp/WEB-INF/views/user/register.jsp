<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	>


</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<img class="logo" src="../../../resources/images/wp_logo.png">
					<div class="tagline">
						Welcome Package ! <br> 회원가입 감사합니다 ♡
					</div>
				</div>

				<form method="post" id="login-button">

					<div class="form-group">
						<label for="email">이메일</label> <input type="text"
							class="login-input" id="email" name="email"
							placeholder="아이디(이메일)를 입력해주세요">
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="login-input" id="password" name="password"
							placeholder="비밀번호를 입렵해주세요">
					</div>

					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="login-input" id="name" name="name"
							placeholder="이름을 입력해주세요">
					</div>

					<div class="form-group">
						<label for="phonenum">핸드폰번호</label> <input type="text"
							class="login-input" id="phonenum" name="phonenum"
							placeholder="핸드폰번호를 입력해주세요">
					</div>

					<div class="form-group">
						<label for="role">역할</label>
						<div class="login-input">
							<input type="radio" name="role" id="role" value="0"
								checked="checked"> 고객 <input type="radio" name="role"
								id="role" value="1">사장님
						</div>

					</div>

					<input type="submit" class="join_button" value="회원가입"></input>

				</form>
			</div>
		</div>
	</div>

	<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$("#login-button").attr("action", "/user/register");
		$("#login-button").submit();
	});
});

</script>
</body>
</html>