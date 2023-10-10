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