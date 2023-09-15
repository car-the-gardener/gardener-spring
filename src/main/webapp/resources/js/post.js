$(() => {
	
  //header를 넣을 태그 찾기
  const header = $("body>div.header");
  //div.header class속성에 header.html불러오기
  header.load("./header.html");

  //footer를 넣을 태그 찾기
  const footer = $("body>div.footer");
  //div.header class속성에 header.html불러오기
  footer.load("./footer.html");
	
    const num = sessionStorage.getItem("num");
    const pn = $(".pagination");
    $.ajax({
        url    : "/back/post",
        data   : `num=${num}`,
        success: (response) => {
			console.log(response, " -- post 응답")
            const article = response.content
                .replace(
                    /!\[([^\]]*)\]\((https:\/\/i\.imgur\.com\/[a-zA-Z0-9]+\.[a-z]+)\)/g,
                    function (match, altText, src) {
                        if (altText !== "") {
                            return (
                                '<div class="content-img"><img src="' +
                                src +
                                '" alt="' +
                                altText +
                                '"/></div>'
                            );
                        } else {
                            return (
                                '<div class="content-img"><img src="' +
                                src +
                                '" alt=img/></div>'
                            );
                        }
                    }
                )
                .replace(/\n/g, "<br>");
            $(".section-header-main-title").text(response.mainTitle);
            $(".section-header-main-subtitle").text(response.subTitle);
            $(".main-image").css("background-image", `url(${response.mainTitleImg})`);
            $(".section-header-info-writer").text(response.member.name);
            $(".section-header-info-date").text(response.createPost.substring(0, 19));
            $("article").html(article);
            $(".section-header-icon span").text(response.favorite);
            $(".writer-profile-name").text(response.member.name);
            $(".writer-profile-intro").text(response.member.intro);
            $(".writer-profile-pic > img").attr("src", response.member.profile);
        },
    })
    .then((result,reject)=>{
			$(".writer-profile-pic > img").click((e)=>{
				location.href="/back/front/html/writer.html"
			});

	// 작가 프로필 이동 시작
	
	// 작가 프로필 이동 끝

    // 수정 버튼 시작
    $(".modify-btn button:first-child").click(() => {
        $.ajax({
            url    : "http://localhost:8888/back/updatepost",
            data   : `num=${sessionStorage.getItem("num")}`,
            success: (response) => {
                sessionStorage.setItem("article", JSON.stringify(response));
                location.href = "./posting.html";
            },
            error  : (err, status) => {
                console.log(err, status);
            },
        });
    });
    // 수정 버튼 끝

    // 삭제 버튼 시작
    $(".modify-btn button:last-child").click(() => {
    })
    // 삭제 버튼 끝

    // 댓글 등록 버튼 시작
    $(".section-comment > div > button").click((e) => {
		if(sessionStorage.getItem("name")=== null){
			$(".section-comment > div > button").attr("disabled","disabled");
			swal("로그인을 먼저 해주세요")
			return ;
		} 
        const num = sessionStorage.getItem("num");
        const content = $(e.target).prev().val();

        const data = {
            content: content,
            num    : num,
        };
        $.ajax({
            url    : "/back/comments",
            method : "POST",
            data   : data,
            success: (response) => {
                $("textarea").val("");
                $("section-comment h3").text(`${response}개 댓글`)
                history.go(0);
            },
            error  : (state, err) => {
                console.log(state, err);
            },
        });
    });
    // 댓글 등록 버튼 끝

    // 댓글 가져오기 시작
    $.ajax({
        url    : "/back/comments",
        data   : `num=${num}&cNum=1`,
        success: (response) => {
            let commentDiv = "";
            $(".section-comment h3").text(`${response.totalCnt}개 댓글`);
            for (let i = 0; i < response.comments.length; i++) {
                commentDiv = `
        <div class="section-comment-wrap ${response.comments[i].member.loginid}">
        <div class='section-comment-write'>
        <div>
        <div class='section-comment-write name'>${response.comments[i].member.name}</div>
        <div class='section-comment-write date'>${response.comments[i].createDate}</div>
        </div>
        <div>
        <button>댓글 수정</button>
        <button>댓글 삭제</button>
        <img src="../images/report.png" alt="신고 이미지">
        </div>
        </div>
        <p class='section-comment-write content'>${response.comments[i].content}</p>
        <hr>
        </div>
        `;
                $(".section-comment").append(commentDiv);
            }
            pageN(response);
        },
        error  : (state, err) => {
            console.log(state, err);
        }
		})
    })
    // 댓글 가져오기 끝

    // 페이지네이션 이동 시작
    pn.click((e) => {
        const cNum = $(e.target).attr("class").slice(4);
        sessionStorage.setItem("cNum", cNum);
        $.ajax({
            url    : "/back/comments",
            data   : `num=${num}&cNum=${sessionStorage.getItem("cNum")}`,
            success: (response) => {
                console.log(response);
                $(".section-comment-wrap").remove();

                for (let i = 0; i < response.comments.length; i++) {
                    commentDiv = `
          <div class='section-comment-wrap'>
          <div class='section-comment-write'>
          <div>
          <div class='section-comment-write name'>${response.comments[i].member.name}</div>
          <div class='section-comment-write date'>${response.comments[i].createDate}</div>
          </div>
          <div>
          <button>댓글 수정</button>
          <button>댓글 삭제</button>
          <img src="../images/report.png" alt="신고 이미지">
          </div>
          </div>
          <p class='section-comment-write content'>${response.comments[i].content}</p>
          <hr>
          </div>
          `;
                    $(".section-comment").append(commentDiv);
                }
                pageN(response);
            },
        });
    });

    const pageN = (response) => {
        $(".pagination").empty();
        // 페이지네이션
        if (response.startPage > 1) {
            pn.append(`
        <span class=page${response.startPage - 1}>이전</span>&nbsp;&nbsp;
      `);
        }
        for (let i = response.startPage; i <= response.endPage; i++) {
            pn.append(`
        <span class=page${i}>${i}</span>&nbsp;&nbsp;
      `);
        }
        if (response.totalPage > response.endPage) {
            pn.append(`
        <span class=page${response.endPage + 1}>다음</span>
      `);
        }
    };
    // 페이지네이션 이동 끝
});
