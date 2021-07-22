<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recommend Pacakage</title>
<link rel="stylesheet" href="resources/css/recommend.css">

</head>
<body>
	<jsp:include page="header.jsp" flush="false" />

	<div class="main-title">추천 테마</div>

	<div class="store-list">
		<c:forEach items="${themaListAndImage}" var="thema">
			<a href="/recommendDetail?id=<c:out value="${thema.id}"/>"> <img
				src=" user/display?fileName=${thema.uploadPath}/s_${thema.uuid}_${thema.fileName}"
				class="store-list-image">
				<div class="store-list-text">
					<c:out value="${thema.name}" />
				</div></a>

		</c:forEach>
	</div>
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>