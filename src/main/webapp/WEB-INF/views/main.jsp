<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Package</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty user}">
			<jsp:include page="top-var2.jsp" flush="false" />
		</c:when>
		<c:otherwise>
			<jsp:include page="top-var.jsp" flush="false" />
		</c:otherwise>
	</c:choose>
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


	<!-- 페이지 이름 인터페이스 영역 -->
	<div class="pageMaker_wrap">

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center page-click">
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev }">
					<li class="pageMaker_btn prev"><a class="page-link"
						href="${pageMaker.pageStart -1}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->

				<c:forEach begin="${pageMaker.pageStart }"
					end="${pageMaker.pageEnd }" var="num">
					<li class="pageMaker_btn"><a class="page-link " href="${num}">
							${num}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a class="page-link"
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>
			</ul>
		</nav>

	</div>
	<form id="moveForm" action="/main" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.vo.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.vo.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.vo.keyword}">
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script>
		var moveForm = $('#moveForm');

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

</body>

</html>