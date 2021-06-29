<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myStore-메뉴등록</title>
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
               <div class="tagline2">메뉴등록</div>
            </div>
            
               <form action="../main" method="get" id="login-button">
              
               <div class="form-group">
                  <label for="name">메뉴 이름</label>     
                  <input type="text" class="login-input" id="name"
                  name="name" placeholder="메뉴이름을 입력해주세요">
               </div>
               
               <div class="form-group">
                  <label for="price">가격</label> 
                  <input type="text"   class="login-input" id="price"
                  name="price" placeholder="가격을 입력해주세요">
               </div>      
                
               <div class="form-group">
                  <label for="discountRate">할인율(10%는 0.1로 적어주세요!)</label>     
                  <input type="text" class="login-input" id="discountRate"
                  name="discountRate" placeholder="할인율을 입력해주세요">
               </div>
               
               <div class="form-group">
                  <label for="image">이미지</label>     
                  <input type="file" class="login-input" id="image" 
                  name="image">
               </div>     
               <input type="button"  value="메뉴등록"></input> 
                <a href="/store/myStore"><input type="button" value="돌아가기"></input> </a>        
               </form>
         </div>
      </div>
      </div>

</body>
</html>