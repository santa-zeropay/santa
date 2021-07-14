<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/map.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="top-var.jsp" flush="false" />

	<div class="map">
		<img src="../../../resources/images/rrmm.JPG"
			style="width: 500px; height: 500px; margin-bottom: 20px;">
		<div class="recommend">

			<h3>친구 추천 코스</h3>
			<br>
			<p>우리는 365일 다이어트를 한다 밥도 먹고 커피도 마시고 수다도 떨어야 스트레스가 풀린다 이 것들을 다하자니
				죄책감이 든다. 그래서 칼로리의 평균을 맞춰 보려 노력중이다</p>
			<p>피그인더가든 신선한 제철 재료로 만든 고품질의 샐러드를 합리적으로 즐길수 있는 샐러드 전문점 보울 샐러드,
				플레이트 샐러드, 샌드위치 브런치 , 스프 건강함이 느껴지는 메뉴이다 다이어트를 하지 않아도 건강하게 맛있게 먹고싶으면
				피그인더가든으로!</p>
			<p>스므으커피 여느 카페와 비슷하게 생긴 외형이지만 요즘 너무나도 핫한 크로플과 타르트, 다양한 종류의 디저트와
				음료가 있는 곳이다. 시그니쳐 메뉴인 플레인 크로플과, 뉴욕치즈 타르트를 먹어보자</p>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57072453991907,
					126.99190427243208), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.57072453991907,
				126.99190427243208);
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>