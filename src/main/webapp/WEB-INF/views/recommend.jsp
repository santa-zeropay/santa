<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recommend Pacakage</title>
<link rel="stylesheet" href="resources/css/recommend.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
 <jsp:include page="top-var.jsp" flush="false"/>

	<div class="main-title">추천 패키지</div>

	<div class="store">
		<div class="store-list">
			<img src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
				 class="store-list-image"> 
			<img src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
				 class="store-list-image"> <div class="store-list-text">치킨+피자</div>
		</div>
		<div class="store-list">
			<img src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
				 class="store-list-image">
			<img src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
				 class="store-list-image"> <div class="store-list-text">치킨+떡볶이</div>
		</div>
		<div class="store-list">
			<img src="https://i.pinimg.com/236x/a3/1b/7e/a31b7e4662445694887e61e17da158b4.jpg"
			 class="store-list-image">
			<img src="https://i.pinimg.com/236x/a3/1b/7e/a31b7e4662445694887e61e17da158b4.jpg"
				class="store-list-image"><div class="store-list-text">햄버거+피자</div>
		</div>
		<div class="store-list">
			<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg"
				class="store-list-image">
			<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg"
				 class="store-list-image"><div class="store-list-text">짬뽕+치킨</div>
		</div>
	</div>
	<div class="store">
		<div class="store-list">
			<img src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
				 class="store-list-image"> 
			<img src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
				 class="store-list-image"><div class="store-list-text">치킨+피자</div>
		</div>
		<div class="store-list">
			<img src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
				 class="store-list-image">
			<img src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
				 class="store-list-image"> <div class="store-list-text">치킨+떡볶이</div>
		</div>
		<div class="store-list">
			<img src="https://i.pinimg.com/236x/a3/1b/7e/a31b7e4662445694887e61e17da158b4.jpg"
			 class="store-list-image">
			<img src="https://i.pinimg.com/236x/a3/1b/7e/a31b7e4662445694887e61e17da158b4.jpg"
				class="store-list-image"><div class="store-list-text"> 햄버거+피자</div>
		</div>
		<div class="store-list">
			<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg"
				class="store-list-image">
			<img src="https://pbs.twimg.com/media/EGsNsB4U0AAeo-Z.jpg"
				 class="store-list-image"><div class="store-list-text">짬뽕+치킨</div>
		</div>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>