<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
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
               <div class="tagline2">메뉴수정</div>
            </div>
            
               <form action="../main" method="get" id="login-button">
              
               <div class="form-group">
                  <label for="name">메뉴 이름</label>     
                  <input type="text" class="login-input" id="name"
                  name="name" value="초기설정 이름">
               </div>
               
               <div class="form-group">
                  <label for="price">가격</label> 
                  <input type="text"   class="login-input" id="price"
                  name="price" value="초기설정 가격">
               </div>      
                
               <div class="form-group">
                  <label for="discountRate">할인율</label>     
                  <input type="text" class="login-input" id="discountRate"
                  name="discountRate" value="초기설정 할인율">
               </div>
               
               <div class="form-group">
                  <label for="image">이미지</label>     
                  <input type="file" class="login-input" id="image" 
                  name="image">
               </div>     
               
               <input class="input_button" type="button" value="수정완료"></input> 
               <input class="input_button" type="button" value="삭제"></input> 
               
               </form>
         </div>
      </div>
      </div>


</body>
</html>