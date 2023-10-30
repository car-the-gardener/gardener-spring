<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Carousel CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/a00fe672c7.js" crossorigin="anonymous"></script>
    
    <!-- CSS파일 -->
    <link rel="stylesheet" href="/resources/css/searchresult.css">
    <link rel="stylesheet" href="/resources/css/index.css">

    <!--JS파일 -->
    <script src="/resources/js/indextest.js"></script>
    <script src="/resources/js/search.js"></script>
    
<title>검색 결과</title>
</head>
<body>

	<!-- 결과를 받는 hidden -->
	<input type="hidden" value='${searchResult}' id="searchResult"/>
	
  <!-- HEADER -->
  <%@ include file="./common/header.jsp" %>
  

  <div id="test"></div>

<!-- search ------------------------------------------------------------------------영역 -->
<div id="search" style="margin-top:30px;">
    <div class="container">
        <div class="row justify-content-md-end">
            <div class="col-md-8">
                <div class="input-group">
	            	<div class="input-group-prepend">
                    	<form method="get" action="/search">
                    	
	                        <select class="form-select" name="select" id="search_param">
	                            <option value="title" ${select eq 'title'?'selected':''}>제목</option>
	                            <option value="name" ${select eq 'name'?'selected':''}>필명</option>
	                            <option value="content" ${select eq 'content'?'selected':''}>내용</option>
	                            <option value="all" ${select eq 'all'?'selected':''}>전체</option>
	                        </select>
	                        
	                </div>
	                    
	                    <input type="text" class="form-control" name="text" placeholder="검색할 단어를 입력해주세요..." value="${text}">
	                    
	                    <span class="input-group-btn">
	                        <button class="btn btn-primary" type="button" id="searchbtn"><i class="fa-solid fa-search"></i> Search</button>
	                    </span>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ---------------------------------------------------------------search end -->

	<!-- Team -->
    <section id="team" class="pb-5">
      <div class="container">
        <h5 class="section-title h2" style="color:black">검색한 단어 : ${text}</h5>
        <div class="row">
        
          <!-- Team member -->
          <div class="col-xs-12 col-sm-6 col-md-4">
            <div class="image-flip">
              <div class="mainflip flip-0">
                <div class="frontside">
                  <div class="card">
                    <div class="card-body text-center">
                      <p>
                        <img
                          class="card-img"
                          src="https://i.imgur.com/Js4PF1j.jpg"
                          alt="card image"
                        />
                      </p>
                      <h4 class="card-title">maintitle</h4>
                      <p class="card-text">subtitle</p>
                      <p class="nickname" style="margin-bottom:0px">nickname</p>
                      
                    </div>
                  </div>
                </div>
                
                <!-- backside 보여주는 영역 -->
                <div class="backside">
                  <div class="card">
                    <div class="card-body text-center mt-4">
                      <h4 class="back-title" style="margin-top:-20px">미리보기</h4>
                      <p class="back-text">
                        backtext
                      </p>
                      
                      <div class="horizontal-list" >
	                      <p class="col-md-6"><i class="fa-solid fa-calendar-days" style="color:#007b5e"></i>
	    					 <span class="create-date">createdate</span>                  
	                      </p>
	                      <p class="col-md-6"><i class="fa-solid fa-heart" style="color:#007b5e"></i>
	                      	<span class="favorite">faverite</span>
	                      </p>
                      </div>
                      
                      <hr>
                      
                      <div>
                      	<h5 class="nickname">작가 소개</h5>
                      	<p class="writer-intro">writer-intro</p>
                      </div>
                      
                      <form method="get" action="/post">
                      	<button type="button" class="btn btn-primary">
	                      	<i class="fa fa-solid fa-magnifying-glass"></i> Read me</a>
                      	</button>
                      </form>
                      
                    </div>
                  </div>
                </div><!-- backside end -->
               
              </div>
            </div>
          </div>
          <!-- ./Team member -->
          
          
        </div>
      </div>
    </section>

  <!--footer-->
  <%@ include file="./common/footer.jsp" %>

</body>
</html>