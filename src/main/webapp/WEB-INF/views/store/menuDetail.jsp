<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<div class="tagline2">메뉴상세</div>
				</div>

				<form action="/store/modifyMenu" method="get" id="login-button">
					<input type="hidden" name="id" value="<c:out value="${menu.id}"/>">
					<input type="hidden" name="store_id" value="<c:out value="${menu.store_id}"/>">
					<div class="form-group">
						<label for="name">메뉴 이름</label> <input type="text"
							class="login-input" id="menuname" name="menuname"
							value="<c:out value="${menu.menuname}"/>" readonly="readonly">
					</div>

					<div class="form-group">
						<label for="price">가격</label> <input type="text"
							class="login-input" id="price" name="price"
							value="<c:out value="${menu.price}"/>" readonly="readonly">
					</div>

					<div class="form-group">
						<label for="discountRate">할인율</label> <input type="text"
							class="login-input" id="discountrate" name="discountrate"
							value="<c:out value="${menu.discountrate}"/>" readonly="readonly">
					</div>

					<div class="form-group">
						<label for="image">이미지</label>
						<img src="/user/display?fileName=${menu.uploadPath}/s_${menu.uuid}_${menu.fileName}">
					</div>

					 <input type="submit" value="메뉴수정"></input>
						<a href="/store/menuList"> <input type="button" value="돌아가기"></input>
					</a>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function() {
			//저장하기 버튼(저장하기 기능 작동)
			$(".join_button").click(function() {
				alert("저장완료");
			});
		});
	</script>
</body>
</html>