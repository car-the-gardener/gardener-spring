<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Carousel CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/a00fe672c7.js" crossorigin="anonymous"></script>

    <!-- CSS파일 -->
    <link rel="stylesheet" href="/resources/css/index.css">
 	<link rel="stylesheet" href="/resources/css/login.css" /> 
    
    <!-- JS파일 -->
    <script src="/resources/js/login.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>로그인</title>
  </head>


  <body>

	
	
    
	    	<div class="logo" >
	    	<a href="./" style="color:black">
		      <img src="/resources/images/logo.png" style="width:300px; height:200px; border:solid 1px; border-bottom:none;"/>
	    	</a>
		    </div>
		
		    <form class="login" method="post" name="f1" style="width:300px; text-align:center; margin-bottom:50px; border:solid 1px; border-top:none">
		    <!--내용 입력란-->
		      <input type="text" name="loginid" placeholder="아이디" /><br />
		      <input type="password" name="password" placeholder="비밀번호" /><br />
		
		      <div><input class="checkbox" type="checkbox" />아이디 저장</div>
		      <br>
		      <input class="loginbtn" type="submit" value="로그인"><br />
		      <!--<button class="loginbtn"><a href="../index.html">로그인</a></button><br />-->
		
		      <!--링크-->
		      <div class="sign-wrap">
		        <span class="signup">
		          <a href="./signup">회원 가입</a>
		        </span>
		
		        <span class="find-loginId">
		          <a href="./find_loginId.jsp">아이디 찾기</a>
		        </span>
		
		        <span class="find-pwd">
		          <a href="./find_pwd.jsp">비밀번호 찾기</a>
		        </span>
		      </div>
		    </form>
    	
    
    
    

  </body>

  </html>