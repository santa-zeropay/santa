<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<input type="hidden" name="id" value="<c:out value="${menu.id}"/>">

		<div class="item">
			<div class="item_list">check</div>
			<div class="item_list">상품이름</div>
			<div class="item_list">판매가</div>
			<div class="item_list">수량</div>
			<div class="item_list">x</div>
		</div>
		<div class="menu-cart" id="tempCartList">
			<c:forEach items="${carts}" var="cart">
				<div class="menu-cart-list">
					<i class="far fa-check-square"></i>
					<div class="item_list">
						<c:out value="${cart.menuname}" />
					</div>
					<div class="item_list">
						<c:out value="${cart.price}" />
					</div>
					<div class="item_list">
						<c:out value="${cart.count}" />
					</div>
					<i class="far fa-times-circle"><input type='hidden' name="id"
						value='<c:out value="${cart.id}" />'></i>
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="total-item">
		총상품금액:(
		<c:out value="${total}" />
		)
	</div>
	<form action="/user/order" class="submitbutton">
	<div class="pay">
		<input type="submit" id="submitbutton" value="주문하기"></input>
	</div>
	</form>
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function() {
			var submitbutton= $(".submitbutton");
			
			$("#submitbutton").click(function(e) {
				console.log("시도~")
				submitbutton.attr("method", "POST")
				submitbutton.attr("action", "/user/order")
				submitbutton.submit();
				console.log("시도성공~")
			})

			$(".fa-times-circle").click(function(e) {

				//   console.dir(this);
				//   console.dir(this.lastChild.defaultValue);

				$.ajax({
					url : "/user/deletecart",
					data : {
						id : this.lastChild.defaultValue
					},
					type : "POST",
					success : function(result) {
						console.log(result);
						location.reload();
					},
					error : function(result) {
						console.log(result);
					}

				});
			})
		});
	</script>




	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

</body>
</html>