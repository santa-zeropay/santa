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
			src="user/display?fileName=${store.uploadPath}/s_${store.uuid}_${store.fileName}"
			class="main-store-image"><input type="text" readonly="readonly"
			value="<c:out value="${store.storename}"/>">
	</div>
	<hr>
	<div class="big-menu">메뉴</div>
	<div class="menu-list">
		<c:forEach items="${menus}" var="menu">
			<input type="button" value="전달하기" onclick="setParentText()">
			<img
				src="user/display?fileName=${menu.uploadPath}/s_${menu.uuid}_${menu.fileName}"
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