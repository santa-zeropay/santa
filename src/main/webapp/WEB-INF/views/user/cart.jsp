<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<link rel="stylesheet" href="/resources/css/cart.css">
</head>
<body>
	<jsp:include page="../top-var.jsp" flush="false" />

	<div class="cart-title">CART</div>


	<div class="container">

		<div class="item">
			<div class="item_list">이미지</div>
			<div class="item_list">상품이름</div>
			<div class="item_list">판매가</div>
			<div class="item_list">수량</div>
		</div>
		<div class="item">
			<div class="item_list">#</div>
			<div class="item_list">#</div>
			<div class="item_list">#</div>
			<div class="item_list">#</div>
		</div>
		<div class="item">
			<div class="item_list">@</div>
			<div class="item_list">@</div>
			<div class="item_list">@</div>
			<div class="item_list">@</div>
		</div>

	</div>

	<div class="total-item">총상품금액:()</div>

	<div class="pay">
		<input type="submit" value="결제하기"></input>
	</div>



	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

</body>
</html>