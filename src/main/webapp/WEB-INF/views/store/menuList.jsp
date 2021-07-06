<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/menuList.css">
</head>
<body>
	<div id="menu_id">가게이름</div>

	<div class="menu_table_wrap">
		<input type="hidden" name="id" value="<c:out value="${menu.id}"/>">
		<table class="menu_table">
			<thead>
				<tr>
					<td class="th_column_1">메뉴이름</td>
					<td class="th_column_2">가격</td>
					<td class="th_column_3">할인율</td>
				</tr>
			</thead>

			<tr>
			
				<td><a href="/store/menuDetail"><input type="text"
						value="<c:out value="${menu.name}"/>"></a></td>
				<td><input type="text" value="<c:out value="${menu.price}"/>"></td>
				<td><input type="text"
					value="<c:out value="${menu.discountrate}"/>"></td>
			</tr>
			<tr>
				<td><a href="/store/menuDetail"><input type="text"
						value="<c:out value="${menu.name}"/>"></a></td>
				<td><input type="text" value="<c:out value="${menu.price}"/>"></td>
				<td><input type="text"
					value="<c:out value="${menu.discountrate}"/>"></td>
			</tr>
			<tr>
				<td><a href="/store/menuDetail"><input type="text"
						value="<c:out value="${menu.name}"/>"></a></td>
				<td><input type="text" value="<c:out value="${menu.price}"/>"></td>
				<td><input type="text"
					value="<c:out value="${menu.discountrate}"/>"></td>
			</tr>
		</table>

		<a href="/store/myStore" class="goback"> <input type="button"
			value="돌아가기"></input></a>
	</div>
</body>
</html>