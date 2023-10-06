<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 style="text-align: center; margin-top:10px;">
  <a href="./"><img src="https://i.imgur.com/2enY1dP.png"/></a>
</h1>

<nav class="navbar navbar-expand-lg navbar-light">
	<div class="container">
		<a class="navbar-brand" href="./" style="font-size: 30px;">작가의 정원</a>
		<button
				class="navbar-toggler"
				type="button"
				data-bs-toggle="collapse"
				data-bs-target="#navbarNav"
				aria-controls="navbarNav"
				aria-expanded="false"
				aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:choose>
                <c:when test="${!empty sessionScope.member.loginid}">
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/posting" style="font-size: 20px">글쓰기</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/library" style="font-size: 20px">서재</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/mygarden" style="font-size: 20px">나의 정원</a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="nav-link" href="/mypage" style="font-size: 20px">작가신청</a>
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
                    <a class="nav-link" href="/magazine" style="font-size: 20px">매거진</a>
                </li>
                <li class="nav-item ms-5">
                    <a class="nav-link" href="/singup" style="font-size: 20px">회원가입</a>
                </li>
                <li class="nav-item ms-5">
                    <a class="nav-link" href="/login" style="font-size: 20px">로그인</a>
                </li>
                    </c:otherwise>
                    </c:choose>
            </ul>
        </div>
    </div>
</nav>