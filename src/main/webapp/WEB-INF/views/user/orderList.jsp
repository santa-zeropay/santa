<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공?!</title>
</head>
<body>

	<div class="cart-title">성공성공!!</div>
	<h1>주문번호: <c:out value="${order_id}" />   주문이 완료되었습니다.</h1>
</body>
</html>