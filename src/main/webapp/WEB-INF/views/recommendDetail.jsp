<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/temp.css">
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />

	<div class="main-store">
		<img
			src="user/display?fileName=${themaAndImage.uploadPath}/s_${themaAndImage.uuid}_${themaAndImage.fileName}"
			style="width: 500px; height: 500px; margin-bottom: 20px; padding-right:30px;">
		<div class="image-couple">
			<c:out value="${themaAndImage.name}" />
		</div>

	</div>
	<div class="big-plus-store">추천 가게들</div>
	<div class="store-list">
		<c:forEach items="${storeImage}" var="store">
			<a href="/store?id=<c:out value="${store.id}" />">
				<img
				src="user/display?fileName=${store.uploadPath}/s_${store.uuid}_${store.fileName}"
				style="display: block;" class="store-list-image">
				<div class="store-list-name"><c:out value="${store.storename}"/></div>
			</a>

		</c:forEach>
</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214"></script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>