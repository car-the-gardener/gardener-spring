// html태그가 있어 꺽쇠때문에 ajax로 요청한다.
const replyService = (() => {
  const add = (reply, callback, error) => {
    $.ajax({
      url        : "/reply",
      method     : "POST",
      data       : JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success    : (response) => {
        if (callback) callback(response);
      },
      error      : (status) => {
        console.log(status);
      }
    })
  }

  const getAllReply = (param, callback) => {
    const postId = param.postId;
    const page = param.page || 1;

    $.getJSON(`/reply/${postId}/${page}`, (response) => {
      if (callback) {
        callback(response);
      }
    }).fail((xhr, status) => {
      console.log(status, "댓글 추가 에러");
      return;
    })

  }

  const remove = (id, callback, error) => {
    $.ajax({
      url       : `/reply/${id}`,
      method    : "DELETE",
      statusCode: {
        500: (response) => {
          swal("이미 삭제된 댓글입니다.");
        }
      },
      success   : (response) => {
        if (callback) {
          callback(response);
        }
      }
    })
  }

  const modify = (reply, callback, Error) => {
    console.log("받은 reply", typeof reply);
    console.log("받은 reply", reply);
    console.log("받은 reply", typeof JSON.stringify(reply));
    console.log("받은 reply", JSON.stringify(reply));
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
