<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종각역 지도로 보기</title>
<link rel="stylesheet" href="/resources/css/map.css">
</head>
<body>

	<div id="map" style="width: 1700px; height: 650px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57072453991907, 126.99190427243208), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		<c:forEach items="${storeList}" var="store">
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<c:out
				value="${store.x}" />,<c:out
					value="${store.y}" />); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		</c:forEach>
	</script>
</body>
</html>