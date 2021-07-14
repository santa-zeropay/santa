<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도</title>
    
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="map" style="width:1700px;height:650px;"></div>    
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214"></script>
<script>    


// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [ 
    
];

<c:forEach items="${storeList}" var="store">
// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(<c:out
		value="${store.x}" />,<c:out
			value="${store.y}" />); 
			

// 마커를 생성합니다
var abc ={
    position: markerPosition,
    text:'${store.storename}'
   
};
console.log("${store.x}");

// 마커가 지도 위에 표시되도록 설정합니다
markers.push(abc);
</c:forEach>
console.log(markers);


var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.57072453991907, 126.99190427243208), // 이미지 지도의 중심좌표
        level: 5, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
</html>