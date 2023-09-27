<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:out value="${sessionScope.member.loginid}"/>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Carousel CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- Font Awesome CDN -->
<script src="https://kit.fontawesome.com/a00fe672c7.js" crossorigin="anonymous"></script>

<!-- CSS파일 -->
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/carousel.css">
<link rel="stylesheet" href="/resources/css/img.css">
<link rel="stylesheet" href="/resources/css/category.css">
<link rel="stylesheet" href="/resources/css/cardgrid.css">

<h1 style="text-align: center; margin-top: 10px">
    <a href="./"><img src="https://i.imgur.com/2enY1dP.png"/></a>
</h1>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#" style="font-size: 30px">작가의 정원</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:choose>
                <c:when test="${!empty sessionScope.member.loginid}">
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/library/like" style="font-size: 20px">서재</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="#" style="font-size: 20px">나의 정원</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/mypage" style="font-size: 20px">마이페이지</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/login" style="font-size: 20px">로그아웃</a>
                    </li>
                </c:when>
                <c:otherwise>
                <li class="nav-item ms-5">
                    <a class="nav-link" href="#" style="font-size: 20px">회원가입</a>
                </li>
                <li class="nav-item ms-5">
                    <a class="nav-link" href="/login" style="font-size: 20px">로그인</a>
                    </c:otherwise>
                    </c:choose>
            </ul>
        </div>
    </div>
</nav>
