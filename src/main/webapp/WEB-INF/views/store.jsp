<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Page</title>
<link rel="stylesheet" href="resources/css/store.css">
</head>
<body>
	<jsp:include page="top-var.jsp" flush="false" />

	<div class="main-store">
		<img
			src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
			class="main-store-image"><input type="text" readonly="readonly"
			 value="<c:out value="${store.storename}"/>"></div>
		<div class="main-store-place"><c:out value="${store.address}"/>"> ~~지도~~</div>
	</div>
	<hr>
	<div class="menu">
		<h2>메뉴</h2>
		<div class="menu-list">
		<c:forEach items="${menus}" var="menu">
			
				<img
					src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
					style="display: block;" class="store-list-image">
				<ul>
					<c:out value="${menu.menuname}" />
					<c:out value="${menu.price}" />
				</ul>
		</c:forEach>
		</div>
	</div>
	<hr>
	<div class="plus-store-list">추가 가게들</div>
	<div class="store">
		<c:forEach items="${storeCategory}" var="store">
			<div class="store-list">
				<a href="/store?id=<c:out value="${store.id}"/>"> <img
					src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
					style="display: block;" class="store-list-image"> <c:out
						value="${store.storename}" />
				</a>
			</div>
		</c:forEach>
	</div>	
	
	<script>

	</script>
	
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>