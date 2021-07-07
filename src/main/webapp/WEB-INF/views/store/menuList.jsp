<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/menuList.css">
</head>
<body>
	<div id="menu_id"><input type="text" readonly="readonly" id="storename"
			name="storename" value="<c:out value="${store.storename}"/>"></div>

	<div class="menu_table_wrap">
	
		<table class="menu_table">
			<thead>
				<tr>
					<td class="th_column_1">메뉴이름</td>
					<td class="th_column_2">가격</td>
					<td class="th_column_3">할인율</td>
				</tr>
			</thead>
			<c:forEach items="${menus}" var="menu">
				<tr class="menu-list">

					<td><a href="/store/menuDetail?id=<c:out value="${menu.id}"/>">
					<input type="text"
							value="<c:out value="${menu.menuname}"/>"></a></td>
					<td><input type="text" value="<c:out value="${menu.price}"/>"></td>
					<td><input type="text"
						value="<c:out value="${menu.discountrate}"/>"></td>
				</tr>
			</c:forEach>
			
		</table>

		<a href="/store/myStore" class="goback"> <input type="button"
			value="돌아가기"></input></a>
	</div>
</body>
</html>