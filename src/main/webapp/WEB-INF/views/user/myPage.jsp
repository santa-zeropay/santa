<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" href="/resources/css/form.css">
</head>
<body>
	<jsp:include page="../header.jsp" flush="false" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<div class="tagline2">내 정보</div>
				</div>

				<form action="/user/myPageModify" method="get" id="login-button">
					<input type="hidden" name="id" value="<c:out value="${user.id}"/>">
					<div class="form-group">
						<label for="email">이메일</label> <input type="text"
							class="login-input" readonly="readonly" id="email" name="email"
							value="<c:out value="${user.email}"/>">
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="login-input" id="password" readonly="readonly"
							name="password" value="<c:out value="${user.password}"/>">
					</div>

					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="login-input" readonly="readonly" id="name" name="name"
							value="<c:out value="${user.name}"/>">
					</div>

					<div class="form-group">
						<label for="phonenum">핸드폰번호</label> <input type="text"
							class="login-input" readonly="readonly" id="phonenum"
							name="phonenum" value="<c:out value="${user.phonenum}"/>">
					</div>

					<div class="form-group">
						<label for="role">역할</label>
						<div class="login-input">
						<c:if test="${user.role == 1}">
							<input type="radio" disabled="true" name="role" id="role"
								value="User"> 고객 <input type="radio"
								name="role" id="role" value="Admin" checked="checked">사장님
						</c:if>
							<c:if test="${user.role == 0}">
							<input type="radio" disabled="true" name="role" id="role"
								value="User" checked="checked"> 고객 <input type="radio"
								name="role" id="role" value="Admin" >사장님
						</c:if>
						
						</div>

					</div>

					<input type="submit" class="join_button" value="수정하기"></input>
				</form>
			</div>
		</div>
	</div>

	<script>
		
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>


</body>
</html>