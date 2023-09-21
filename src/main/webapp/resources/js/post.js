// html태그가 있어 꺽쇠때문에 ajax로 요청한다.
const replyService = (() => {
  const add = (reply, callback, error) => {
    console.log(reply, "넘겨받은 reply")
    $.ajax({
      url        : "/reply",
      method     : "POST",
      data       : JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success    : (response) => {
        if (callback) callback(response);
      },
      error      : (status) => {
        swal("로그인 해주세요")
        console.log(status);
      }
    })
  }

  const getAllReply = (param, callback, error) => {
    const postNum = param.postNum;
    let page = 0;
    if (param.page === -1) {
      page = 1;
    } else {
      page = param.page;
    }

    $.getJSON(`/reply/${postNum}/${page}`, (response) => {
      console.log(response, "댓글 응답")
      if (callback) {
        callback(response);
      }
    }).fail((xhr, status) => {
      //if (page === -1) console.log("-1이 넘어옴")
      //else console.log(status, "가져올 댓글 없음");
    })
  }

  const remove = (id, callback, error) => {
    $.ajax({
      url    : `/reply/${id}`,
      method : "DELETE",
      success: (response) => {
        if (callback) {
          callback(response);
        }
      },
      error  : (xhr, status, err) => {
        console.log(status)
      }
    })
  }

  const modify = (reply, callback, Error) => {
    $.ajax({
      url        : `/reply/${reply.id}`,
      method     : "PUT",
      contentType: "application/json; charset=utf-8",
      data       : JSON.stringify(reply),
      success    : (response) => {
        if (callback) {
          callback(response);
        }
        alert(response);
      }
    })
  }


  // 시간 처리
  const displyTime = (timeValue) => {
    const today = new Date();
    const gap = today.getTime() - timeValue;
    const dateObj = new Date(timeValue);
    const str = "";

    // 86400초 == 24시간
    if (gap < (1000 * 60 * 60 * 24)) {
      const hh = dateObj.getHours();
      const mm = dateObj.getMinutes();
      const ss = dateObj.getSeconds();

      return [(hh > 9 ? "" : "0") + hh, ":", (mm > 9 ? "" : "0") + mm, ":", (ss > 9 ? "" : "0") + ss].join("");
    } else {
      const yy = dateObj.getFullYear();
      const mm = dateObj.getMonth() + 1;
      const dd = dateObj.getDate();

      return [yy, "/", (mm > 9 ? "" : "0") + mm, "/", (dd > 9 ? "" : "0") + dd, "/", (dd > 9 ? "" : "0") + dd].join("");
    }
  }

  return {add, getAllReply, remove, modify, displyTime}
})()
