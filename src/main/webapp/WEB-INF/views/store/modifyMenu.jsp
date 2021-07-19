<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
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
					<div class="tagline2">메뉴수정</div>
				</div>

				<form action="/store/UpdateMenu" method="post" id="login-button">

					<input type="hidden" name="id" value="<c:out value="${menu.id}"/>" />
					<div class="form-group">
						<label for="name">메뉴 이름</label> <input type="text"
							class="login-input" id="name" name="menuname" readonly="readonly"
							value="<c:out value="${menu.menuname}"/>">
					</div>

					<div class="form-group">
						<label for="price">가격</label> <input type="text"
							class="login-input" id="price" name="price"
							value="<c:out value="${menu.price}"/>">
					</div>

					<div class="form-group">
						<label for="discountRate">할인율</label> <input type="text"
							class="login-input" id="discountrate" name="discountrate"
							value="<c:out value="${menu.discountrate}"/>">
					</div>

					<div class="form-group">
						<label for="image">이미지</label> 
						<img src="/user/display?fileName=${menu.uploadPath}/s_${menu.uuid}_${menu.fileName}"
						class="login-input" id="imageList">
					</div>

					<input class="input_button modify_button" type="submit"
						value="수정완료"></input> <input class="input_button delete_button"
						type="button" onclick="location.href='deleteMenu?id=${menu.id}'"
						value="삭제"></input>

				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var operForm = $("#operForm");
			//저장하기 버튼(저장하기 기능 작동)
			$(".modify_button").click(function() {
				alert("수정완료");
			});

			
		});
	</script>

</body>
</html>