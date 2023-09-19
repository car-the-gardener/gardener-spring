// html태그가 있어 꺽쇠때문에 ajax로 요청한다.
const replyService = (() => {
  const add = (reply, callback, error) => {
    console.log(reply, "넘겨받은 reply")
    console.log(typeof reply, "넘겨받은 reply")
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

  const getAllReply = (param, callback, error) => {
    const postId = param.postId;
    const page = param.page || 1;

    $.getJSON(`/reply/${postId}/${page}`, (response) => {
      if (callback) {
        callback(response);
      }
    }).fail((xhr, status, err) => {
      if (error) error();
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
      }
    })
  }

  return {add, getAllReply}
})()
