<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myStore</title>
<link rel="stylesheet" href="/resources/css/myStore.css">
</head>
<body>
	<jsp:include page="../top-var.jsp" flush="false" />

	<div class="main-store">
			<input type="hidden" name="id" value="<c:out value="${store.id}"/>">
		<img
			src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
			class="main-store-image"><input type="text" readonly="readonly" id="storename"
			name="storename" value="<c:out value="${store.storename}"/>">
	</div>

	<div class="menu">
		<a href="/store/enrollMenu" class="menu-list">메뉴등록</a> <a
			href="/store/menuList" class="menu-list">메뉴목록</a>
	</div>


	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

</body>
</html>