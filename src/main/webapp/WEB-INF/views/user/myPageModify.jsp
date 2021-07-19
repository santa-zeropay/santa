<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../top-var.jsp" flush="false" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<div class="tagline2">내 정보 수정하기</div>
				</div>

				<form action="/user/myPageUpdate" method="post" id="login-button">
					<input type="hidden" name="id" value="<c:out value="${user.id}"/>">
					<div class="form-group">
						<label for="email">이메일</label> <input type="text"
							class="login-input" id="email" name="email"
							value="<c:out value="${user.email}"/>">
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="login-input" id="password" name="password"
							value="<c:out value="${user.password}"/>">
					</div>

					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="login-input" id="name" name="name"
							value="<c:out value="${user.name}"/>">
					</div>

					<div class="form-group">
						<label for="phonenum">핸드폰번호</label> <input type="text"
							class="login-input" id="phonenum" name="phonenum"
							value="<c:out value="${user.phonenum}"/>" />
					</div>

					<div class="form-group">
						<label for="role">역할</label>
						<div class="login-input">
								<c:if test="${user.role == 1}">
							<input type="radio" disabled="true" name="role" id="role"
								value=0> 고객 <input type="radio"
								name="role" id="role" value=1 checked="checked">사장님
						</c:if>
							<c:if test="${user.role == 0}">
							<input type="radio" disabled="true" name="role" id="role"
								value=0 checked="checked"> 고객 <input type="radio"
								name="role" id="role" value=1 >사장님
						</c:if>
						</div>

					</div>
					<input type="submit" class="join_button" value="저장하기"></input>
				</form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			//저장하기 버튼(저장하기 기능 작동)
			$(".join_button").click(function() {
				alert("저장완료");
			});
		});
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>