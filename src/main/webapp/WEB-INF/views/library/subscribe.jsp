<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/subscribe.js"></script>
<link rel="stylesheet" href="/resources/css/subscribe.css">

<div class="section-subscribe-wrapper"></div>

<script>
  let subscribeResponse = ${member};
  let subscribe = "";
  if (subscribeResponse.length === 0) {
    $.get("/resources/exception-page/subscribe-exception.html", (response) => {
      $("section").html(response);
    })
  } else {
    for (m of subscribeResponse) {
      subscribe += `<div class="section-subscribe-wrapper--writer"><div><img src='\${m.profile}' alt='프로필 이미지'></div>`;
      subscribe += `<div><p>\${m.nickname}</p><hr><p>\${m.intro}</p></div></div>`;
    }
    $(".section-subscribe-wrapper").html(subscribe);
  }

</script>