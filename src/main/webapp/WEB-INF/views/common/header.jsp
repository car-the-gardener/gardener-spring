<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/login.js"></script>
<link rel="stylesheet" href="/resources/css/login.css" />
<link rel="stylesheet" href="/resources/css/header.css" />


<h1 style="text-align: center; margin-top: 10px">
	<a href="./"><img src="https://i.imgur.com/2enY1dP.png" /></a>
</h1>

<nav class="navbar navbar-expand-lg navbar-light">
	<div class="container">
		<a class="navbar-brand" href="#" style="font-size: 30px">작가의 정원</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item ms-5"><a class="nav-link" href="#"
					style="font-size: 20px">서재</a></li>
				<li class="nav-item ms-5"><a class="nav-link" href="#"
					style="font-size: 20px">나의 정원</a></li>
				<li class="nav-item ms-5"><a class="nav-link" href="/mypage"
					style="font-size: 20px">마이페이지</a></li>
				<li class="nav-item ms-5"><a class="nav-link" href="/signup"
					style="font-size: 20px">회원가입</a></li>


				<!-- 모달태그 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-hidden="true" aria-labelledby="myModalLabel">
					<div class="modal-dialog modal-fullsize">
						<div class="modal-content modal-fullsize">
							<div class="modal-header">
						<!-- 		<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button> -->
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">

								<!--로고-->
								<body>
									<div class="logo">
										<img src="/resources/images/logo.png" />
									</div>

									<!--로그인 내용 입력란-->
									<form class="login" method="post" name="f1">
										<input type="text" name="loginid" placeholder="아이디" /><br />
										<input type="password" name="password" placeholder="비밀번호" /><br />

										<div>
											<input class="checkbox" type="checkbox" />아이디 저장
										</div>
										<br /> <input class="loginbtn" type="submit" value="로그인"><br />
										<!--<button class="loginbtn"><a href="../index.html">로그인</a></button><br />-->

										<!--링크-->
										<div class="sign-wrap">
											<span class="signup"> <a
												href="http://localhost:8888/signup">회원 가입</a>
											</span> <span class="find-loginId"> <a
												href="http://localhost:8888/find_id">아이디 찾기</a>
											</span> <span class="find-pwd"> <a
												href="http://localhost:8888/find_pwd">비밀번호 찾기</a>
											</span>
										</div>
									</form>
									
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									id="closebtn" data-dismiss="modal">close</button>
						<!-- 		<button type="button" class="btn btn-primary">로그인</button> -->
							</div>
						</div>
					</div>
				</div>
				<!-- 모달태그 끝 -->

				<li class="nav-item ms-5"><a class="nav-link" href="/login"
					style="font-size: 20px">로그인</a></li>
			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">
$(() => {
	$('li.nav-item.ms-5 a.nav-link[href="/login"]').click(function(e) {
		e.preventDefault(); 	
		$('#myModal').modal('show');
	});	
	
	$("#closebtn").on("click", () =>{
		location.href = "/"; //페이지 이동
	})	 
			
	const url = "http://localhost:8888";  
	const formObj = $("form.login");
	const data = $(e.target).serialize();
	$.ajax({
	      url: "/",
	      method: "post",
	      data: data,
	      success: (response) => {
	        console.log(response, "response")
	        if (response.trim() == 1) {
		         //로그인 성공인 경우
		         swal("환영합니다");
	          location.href = "/"; //페이지 이동
	        } else if (response.trim() == 0) {
	          //로그인 실패인 경우
	          $("form.login>input[name=id]").focus();
	        }
	      },
	      error: (xhr) => {
		         swal("잘못된 정보입니다. 다시 입력해주세요.");			       
		  }
	});

});
</script>