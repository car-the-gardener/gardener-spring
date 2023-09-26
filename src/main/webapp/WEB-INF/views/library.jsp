<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="/resources/js/library.js" defer></script>
    <link rel="stylesheet" href="/resources/css/library.css">
    <title>찜</title>
</head>
<body>
<c:out value="${sessionScope.member.nickname}"/>
<input type="hidden" class="nickname" value="${sessionScope.member.nickname}">

<a href="javascript:void(0)">좋아요</a>
<a href="javascript:void(0)">구독</a>

</body>
</html>
