<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 가게</title>
<link rel="stylesheet" href="resources/css/store.css">
</head>
<body>
	<div class="main-store">
		<img
			src="user/display?fileName=${store.uploadPath}/s_${store.uuid}_${store.fileName}"
			class="main-store-image"><input type="text" readonly="readonly"
			value="<c:out value="${store.storename}"/>">
	</div>
	<hr>
	<div class="big-menu">메뉴</div>
	<div class="plus-menu-list">
		<c:forEach items="${menus}" var="menu">
		<ul>
				<c:out value="${menu.menuname}" />
				<c:out value="${menu.price}" />원
				
			</ul>
		<div class="plus-menu-im">
			<img
				src="user/display?fileName=${menu.uploadPath}/s_${menu.uuid}_${menu.fileName}"
				class="menu-list-image">
				<input type="button" value="주문표에 넣기" onclick="setParentText()">
			</div>
			
		</c:forEach>
	</div>
	
	<script type="text/javascript">
	function setParentText(){
		opener.document.getElementById("parent").value=document.getElementById("child").value
	}
	</script>
</body>
</html>