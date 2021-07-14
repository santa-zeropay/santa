<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top-area</title>
<link rel="stylesheet" href="/resources/css/top-var.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
	<div class="top-area">
		<div class="dropdown"> <button
				class="dropbtn"><i class="fas fa-bars fa-2x"></i></button>
		<div class="dropdown-content">
			<a href="/main">홈</a> <a href="/map">지도로 보기</a> 
			 <a href="/recommend">추천 테마</a>
			<a href="/user/myPage">내 정보</a> <a
				href="/store/myStore">내 가게</a>
		</div>
	</div>
	<div class="list">W.P</div>
	<a href="/main" class="list">가게 리스트</a>
	<a href="/map" class="list">지도로 보기</a>
	<a href="/recommend" class="list">추천 테마</a>
	<a href="/user/myPage" class="list">내 정보</a>
	<a href="/store/myStore" class="list">내 가게</a>
	<div class="status-var">
		<div>
			<input type="text"> <i class="fas fa-search fa-2x"></i>
		</div>
		<a href="/user/cart"><i class="fas fa-shopping-cart fa-2x "></i></a>
	</div>

	</div>
</body>
</html>