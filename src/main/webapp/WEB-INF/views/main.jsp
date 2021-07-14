<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Package</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="top-var.jsp" flush="false" />

	<div class="main-title">STORE</div>

	<div class="store">
		<c:forEach items="${storeList}" var="store">
			<div class="store-list">
				<a href="/store?id=<c:out value="${store.id}"/>"> <img
					src="user/display?fileName=${store.uploadPath}/s_${store.uuid}_${store.fileName}"
					style="display: block;" class="store-list-image"> <c:out
						value="${store.storename}" />
				</a>
			</div>
		</c:forEach>
	</div>

	<div class="search_wrap">
		<form id="searchForm" action="/main" method="get">
			<div class="search_input">
				<input type="text" name="keyword"
					value='<c:out value="${pageMaker.vo.keyword}"></c:out>'> <input
					type="hidden" name="pageNum"
					value='<c:out value="${pageMaker.vo.pageNum }"></c:out>'> <input
					type="hidden" name="amount" value='${pageMaker.vo.amount}'>
				<button class='btn search_btn'>검 색</button>
			</div>
		</form>
	</div>

	<!-- 페이지 이름 인터페이스 영역 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.pageStart -1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }"
				end="${pageMaker.pageEnd }" var="num">
				<li class="pageMaker_btn"><a href="${num}"> ${num} </a></li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.pageEnd + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>
	<form id="moveForm" action="/main" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.vo.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.vo.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.vo.keyword}">
	</form>


	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script>
var searchForm = $("#searchForm");
var moveForm = $('#moveForm');


/* 작거 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	alert("search")
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});


/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	alert('페이지이동버튼실행')
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});


</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

</body>

</html>


