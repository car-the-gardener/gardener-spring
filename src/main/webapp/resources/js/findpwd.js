$(() => {
	const backURL = "http://localhost:8888/back";

	//아이디 입력란 객체찾기
	const inputloginIdObj = $('form.find-pwd>input[name=loginId]')

	//이메일 입력란 객체찾기
	const inputEmailObj = $('form.find-pwd>input[name=email]')

	//비밀번호 찾기 버튼 객체 찾기
	const btFindpwd = $('form.find-pwd button.bt-find-pwd')


	btFindpwd.click(() => {
		const loginId = $("input[name='loginId']").val();
		const email = $("input[name='email']").val();
		$.ajax({
			url: 'http://localhost:8888/back/findpwd',
			method: 'post',
			data: { 'loginId': loginId, email: email },
			success: (responseData) => {
				if (responseData != '0') {
					alert('고객님의 비밀번호는 ' + responseData + ' 입니다')					
					location.href =`${backURL}/front/html/login.html`
				} else {
					alert('잘못된 정보입니다, 다시 입력해주세요')
				}
			},
			error: ()=> {
				alert("에러발생~~~~")
			}
		})
		return false;
	})
})



