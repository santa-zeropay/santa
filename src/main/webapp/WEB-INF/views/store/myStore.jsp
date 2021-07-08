<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myStore</title>
<link rel="stylesheet" href="/resources/css/myStore.css">
</head>
<body>
	<jsp:include page="../top-var.jsp" flush="false" />

	<div class="main-store">
		<input type="hidden" name="id" value="<c:out value="${store.id}"/>">
			<div class="form_section main-store-image">
				<div id="uploadResult"></div>
		</div>
		<input type="text" readonly="readonly" id="storename" name="storename"
			value="<c:out value="${store.storename}"/>">
	</div>

	<div class="menu">
		<a href="/store/enrollMenu" class="menu-list">메뉴등록</a> <a
			href="/store/menuList" class="menu-list">메뉴목록</a>
	</div>


	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script>
$(document).ready(function(){

	console.log(${store_id});

$.ajax({
	url:"/user/getImageList",
	data:{"id" : ${store_id}},
	dataType:"JSON",
	type:"POST",
	success:function(result){
		let str="";
		let uploadResult = $("#uploadResult");
		let obj=result[0];
	
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/user/display?fileName=" + fileCallPath +"'>";
		str += "</div>";		
		
		uploadResult.html(str);		
	},
	error:function(result){
		console.log(result);
		alert("삭제실패")
	}

});



});

</script>

</body>
</html>