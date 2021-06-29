<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
</head>
<body>
 <jsp:include page="../top-var.jsp" flush="false"/>
   <div class="container">
      <div class="row justify-content-center">
         <div class="login-form">
            <div class="logo-wrapper">
               <div class="tagline2"> 내 정보 </div>
            </div>
            
               <form action="../user/login" method="get" id="login-button">
              
               <div class="form-group">
                  <label for="email">이메일</label>     
                  <input type="text" class="login-input" id="email"
                  name="email" placeholder="아이디(이메일)를 입력해주세요">
               </div>
               
               <div class="form-group">
                  <label for="password">비밀번호</label> 
                  <input type="password"   class="login-input" id="password"
                  name="password" placeholder="비밀번호를 입렵해주세요">
               </div>      
                
               <div class="form-group">
                  <label for="name">이름</label>     
                  <input type="text" class="login-input" id="name"
                  name="name" placeholder="이름을 입력해주세요">
               </div>
               
               <div class="form-group">
                  <label for="phonenum">핸드폰번호</label>     
                  <input type="text" class="login-input" id="phonenum" 
                  name="phonenum" placeholder="핸드폰번호를 입력해주세요">
               </div>     
               
               <div class="form-group">
                     <label for="role">역할</label>
                     <div class="login-input">
                     <input  type="radio" name="role" id="role" value="User" checked="checked">
                     고객
            	<input  type="radio" name="role" id="role" value="Admin">사장님
                     </div>
                
             </div>
                          
               </form>
         </div>
      </div>
      </div>

  <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>