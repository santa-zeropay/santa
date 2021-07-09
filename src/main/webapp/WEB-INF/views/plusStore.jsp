<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-store">
		<img
			src="https://i.pinimg.com/236x/79/26/0b/79260b6c5360cab2894c7471ad759216.jpg"
			class="main-store-image"><input type="text" readonly="readonly"
			value="<c:out value="${store.storename}"/>">
	</div>
	<hr>
	<div class="big-menu">메뉴</div>
	<div class="menu-list">
		<c:forEach items="${menus}" var="menu">
			<input type="button" value="전달하기" onclick="setParentText()">
			<img
				src="https://i.pinimg.com/originals/ff/f5/94/fff5940628d5287ea6c6ba871b4866f9.png"
				style="display: block;" class="menu-list-image">
			<ul>
				<c:out value="${menu.menuname}" />
				<c:out value="${menu.price}" />
			</ul>
		</c:forEach>
	<input id="child" type="button" value="전달하기" onclick="setParentText()">
	</div>
	
	<script type="text/javascript">
	function setParentText(){
		opener.document.getElementById("parent").value=document.getElementById("child").value
	}
	</script>
</body>
</html>