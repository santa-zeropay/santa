<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
  <div class="container">
      <div class="row justify-content-center">
         <div class="login-form">
            <div class="logo-wrapper">
               <img class="logo" src="../../../resources/images/wp_logo.png">
               <div class="tagline2">메뉴상세</div>
            </div>
            
               <form action="../main" method="get" id="login-button">
              	<input type="hidden" name="id" value="<c:out value="${menu.id}"/>">
               <div class="form-group">
                  <label for="name">메뉴 이름</label>     
                  <input type="text" class="login-input" id="name"
                  name="name" value="<c:out value="${menu.name}"/>" readonly="readonly">
               </div>
               
               <div class="form-group">
                  <label for="price">가격</label> 
                  <input type="text"   class="login-input" id="price"
                  name="price" value="<c:out value="${menu.price}"/>" readonly="readonly">
               </div>      
                
               <div class="form-group">
                  <label for="discountRate">할인율</label>     
                  <input type="text" class="login-input" id="discountRate"
                  name="discountRate" value="<c:out value="${menu.name}"/>" readonly="readonly">
               </div>
               
               <div class="form-group">
                  <label for="image">이미지</label>     
               <img src="a/a/a/a/a">
               </div>     
               
                        
               <a href="/store/modifyMenu"> <input type="button" value="메뉴수정"></input> 
              <a href="/store/menuList"> <input type="button" value="돌아가기"></input>  </a>
               </form>
         </div>
      </div>
      </div>

</body>
</html>