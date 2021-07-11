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
			src="user/display?fileName=${store.uploadPath}/s_${store.uuid}_${store.fileName}"
			class="main-store-image"><input type="text" readonly="readonly"
			value="<c:out value="${store.storename}"/>">
		<div class="main-store-place">
			<div id="map" style="width: 300px; height: 300px;"></div>
			<c:out value="${store.address}" />
		</div>
	</div>
	<div class="menu-cart">
	<h2>~~장바구니목록~~</h2>
	<input id="parent" type="text" name="menu-cart">
	</div>
	<hr>
	<div class="big-menu">메뉴</div>
	<div class="menu-list">
		<c:forEach items="${menuImage}" var="menu">
			<img
				src="user/display?fileName=${menu.uploadPath}/s_${menu.uuid}_${menu.fileName}"
				style="display: block;" class="menu-list-image">
			<ul>
				<c:out value="${menu.menuname}" />
				<c:out value="${menu.price}" />
			</ul>
		</c:forEach>
	</div>
	<hr>
	<div class="big-plus-store">추가 가게들</div>
	<div class="store-list">
		<c:forEach items="${distImage}" var="dist">
			<a href="javascript:plusStore(<c:out value="${dist.store_id}" />)"> <img
				src="user/display?fileName=${dist.uploadPath}/s_${dist.uuid}_${dist.fileName}"
				style="display: block;" class="store-list-image">
			</a>
			<ul>
				<c:out value="${dist.name}" />
				<hr>
				<h6>거리 :</h6>
				<c:out value="${dist.distance}" />km
			</ul>
		</c:forEach>
	</div>
	<script type="text/javascript">
	function plusStore(store_id){
		console.log(store_id);
		window.open("/plusStore?id="+store_id,"plus","width=400, height=400");
	}
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(<c:out
					value="${store.x}" />, <c:out
						value="${store.y}" />), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<c:out
				value="${store.x}" />, <c:out
					value="${store.y}" />); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>