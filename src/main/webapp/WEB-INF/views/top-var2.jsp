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
		<div class="dropdown">
			<button class="dropbtn">
				<i class="fas fa-bars fa-2x"></i>
			</button>
			<div class="dropdown-content">
				<a href="/main">홈</a> <a href="/map">지도로 보기</a> <a href="/recommend">추천
					테마</a> <a href="/user/register">회원가입</a> <a href="/user/loginPage">로그인</a>
			</div>
		</div>
		<div class="list">W.P</div>
		<a href="/main" class="list">가게 리스트</a> <a href="/map" class="list">지도로
			보기</a> <a href="/recommend" class="list">추천 테마</a> <a
			href="/user/register">회원가입</a> <a href="/user/loginPage">로그인</a>
		<div class="search_wrap list">
			<form id="searchForm" action="/main" method="get">
				<div class="search_input">
					<input type="text" name="keyword"
						value='<c:out value="${pageMaker.vo.keyword}"></c:out>'> <input
						type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.vo.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.vo.amount}'>
					<button class='btn search_btn page-link'>
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
		</div>

		<a href="/user/cart" class="list"><i
			class="fas fa-shopping-cart fa-2x "></i></a>

	</div>
	<script>
		var searchForm = $("#searchForm");
		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			alert("search")

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});
	</script>
</body>
</html>