<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gardener.domain.Search" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.lang.Long" %>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/carousel.css">
    <link rel="stylesheet" href="/resources/css/img.css">
    <link rel="stylesheet" href="/resources/css/category.css">
    <link rel="stylesheet" href="/resources/css/cardgrid.css">


    <!-- JS파일 -->
    <script src="/resources/js/indextest.js"></script>
    <script src="/resources/js/indexsub.js"></script>

    <title>작가의 정원</title>
</head>
<body>

	<!-- 결과를 받는 hidden -->
	<input type="hidden" value="${resultNone}" class="resultNone"/>
	
	<!-- HEADER -->
	<%@ include file="./common/header.jsp" %>

<!-- search 영역------------------------------------------------------------------------ -->
<div id="search" style="margin-top:30px;">
    <div class="container">
        <div class="row justify-content-md-end">
            <div class="col-md-8">
                <div class="input-group">
	            	<div class="input-group-prepend">
                    	<form method="get" action="/search" class="search-form">

	                        <select class="form-select" name="select" id="search_param">
	                            <option value="title" ${select eq 'title'?'selected':''}>제목</option>
	                            <option value="name" ${select eq 'name'?'selected':''}>필명</option>
	                            <option value="content" ${select eq 'content'?'selected':''}>내용</option>
	                            <option value="all" ${select eq 'all'?'selected':''}>전체</option>
	                        </select>
	                </div>


	                    <input type="text" class="form-control" name="text" placeholder="검색할 단어를 입력해주세요..." value="${text}">

	                    <span class="input-group-btn">
	                        <button class="btn btn-primary" type="button" id="searchbtn" style="background-color:#007b5e; border-color:#007b5e;">
	                        <i class="fa-solid fa-search"></i> Search</button>
	                    </span>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- search 영역------------------------------------------------------------------------ -->

<!-- main img carousel 영역 ------------------------------------------------------------ -->
<div class="body" style="margin-top:-70px">

    <div id="carousel img" >
        <div class="content">
            <div class="container">
                <div class="owl-carousel slide-one-item">
                    <div class="d-md-flex testimony-29101 align-items-stretch">
                        <div class="image" style="background-image: url('/resources/images/main1.png')"></div>
                        <div class="text">
                            <blockquote>
                            	<h4>사랑의 물리학</h4>
                                <p style="margin-top:30px">
                                    질량의 크기는 부피와 비례하지 않는다<br>
                                    제비꽃같이 조그마한 그 계집애가<br>
                                    꽃잎처럼 하늘거리는 그 계집애가<br>
                                    지구보다 더 큰 질량으로 나를 끌어당긴다<br>
                                    순간 나는<br>
                                    뉴턴의 사과처럼<br>
                                    사정없이 그녀에게로 굴러 떨어졌다<br>
                                    쿵 소리를 내며 쿵쿵 소리를 내며<br>
                                    심장이<br>
                                    하늘에서 땅까지<br>
                                    아찔한 진자운동을 하였다.<br>
                                    첫사랑이었다.
                                </p>

                                <div class="author">&mdash; 김인육</div>
                            </blockquote>
                        </div>
                    </div>

                    <!-- .item -->
                    <div class="d-md-flex testimony-29101 align-items-stretch">
                        <div class="image" style="background-image: url('/resources/images/main3.png')"></div>
                        <div class="text">
                            <blockquote>
                            	<h4>이유</h4>
                                <p style="margin-top:30px">
                                    네 눈이 그리도 이뻣던 것은<br>
                                    가을 햇빛 탓이었을 것이다<br><br>                                 
                                    네 눈이 그리도 맑았던 것은<br>
                                    가을바람 탓이었을 것이다<br><br>
                                    아니다 우리 앞에 이별의 시간이<br>
                                    다가왔기 때문이다<br><br>
                                    눈물이 하늘 강물이 너의 눈을<br>
                                    더 이쁘게 맑게 보이도록 했던 것이다.
                                </p>

                                <div class="author">&mdash; 나태주</div>
                            </blockquote>
                        </div>
                    </div> <!-- .item -->

                    
                </div>
            </div>
        </div>
    </div>
<!-- main img carousel 영역 ------------------------------------------------------------ -->

<!-- category ----------------------------------------------------------------------영역 -->
    <div class="category" style="margin-top:-70px">
        <div class="container bg-white rounded">
            <div class="h4 font-weight-bold text-center py-3">Keyword Search</div>
            <p class="text-muted text-center py-3" style="margin-top:-30px">키워드로 분류된 다양한 글 모음</p>

            <div class="row">

               	<div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=시">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 text-center d-flex align-items-center justify-content-center blue">
	                                <img src="https://freepngimg.com/thumb/pen/14-pen-png-image.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Poem</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                 <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=여행">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
	                                <img src="https://www.freepnglogos.com/uploads/plane-png/plane-png-fort-wayne-international-airport-2.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Travel</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=연애">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-purple">
	                                <img src="https://freepngimg.com/thumb/love/7-2-love-free-png-image.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Love</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=IT">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
	                        	<div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-cyan">
	                                <img src="https://freepngimg.com/thumb/android/31165-8-android-hd.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>IT</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=사진">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
	                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center gray">
	                                <img src="https://freepngimg.com/thumb/photography/3-2-photography-silhouette-png.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>photo</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=영화">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            	<div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-green">
	                                <img src="https://freepngimg.com/thumb/clapperboard/6-2-clapperboard-png-picture.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Movie</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=음악">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
	                                <img src="https://freepngimg.com/thumb/musical_notes/5-2-musical-notes-picture.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Music</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

               <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=애완동물">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                        	<div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pink">
	                                <img src="https://freepngimg.com/thumb/dog/9-dog-png-image-picture-download-dogs.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Pet</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=요리">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pista">
	                                <img src="https://freepngimg.com/thumb/egg/7-fried-egg-png-image.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Cooking</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=육아">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-purple">
	                                <img src="https://freepngimg.com/thumb/teddy_bear/8-2-teddy-bear-png-file.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Child</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=운동">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-cyan">
	                                <img src="https://freepngimg.com/thumb/sports_equipment/22346-3-sport-transparent-background.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Sports</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>

                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
					 <a href="/category?category=도서">
	                    <div class="box bg-white">
	                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
	                                <img src="https://freepngimg.com/thumb/book/2-books-png-image.png" />
	                            </div>
	                            <div class="d-flex flex-column">
	                                <b>Library</b>
	                            </div>
	                        </div>
	                    </div>
		            </a>
                </div>
            </div>
        </div>
    </div> <!-- div.category end -->
    <!-- category영역 --------------------------------------------------------------------end -->

    <!-- 추천하는 글 영역-------------------------------------------------------------------- -->
    <div class="h4 font-weight-bold text-center py-3">Gardener Recommendation</div>
    <p class="text-muted text-center py-3" style="margin-top:-30px">작가의 정원에서 추천하는 글</p>

    <table cellspacing="0px" class="writing-list">

    <% int faveriteTopSize = (int)request.getAttribute("faveriteTopSize");
        List<Search> faveriteTop = (List<Search>) request.getAttribute("faveriteTop");

        	for(int i=0; i<faveriteTopSize; i++){
        		//객체 하나 가져온다
        		 Search recommend = faveriteTop.get(i);

        		//timestamp 포멧팅
        		 Timestamp timestamp = Timestamp.valueOf(recommend.getCreatedate());
        	     Date date = new Date(timestamp.getTime());
        	     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        	     String formatDate = dateFormat.format(date);

        	   //content html태그 빼기
        	     String content = recommend.getContent().replaceAll("<[^>]*>", "");

        	   //postnum Long타입으로 변환
        	   //String postnumStr =  recommend.getPostnum();
        	   //long postnum = Long.parseLong(postnumStr);
        %>
	         <tr class="search-postnum" data-postnum="<%=recommend.getPostnum()%>">
	            <td>
	                 <img src= <%=recommend.getMaintitleimg() %> class="writing-img">
	            </td>
	            <td>
	                <h2><%=recommend.getMaintitle() %> -</h2>
	                <h2><%=recommend.getNickname() %></h2>
	                <p><%=recommend.getSubtitle() %></p>
	                <p class="recommend-content"><%=content%></p>
	            </td>
	        </tr>
        </form>
 		<%
        	}
        %>
    </table>
    <!-- 추천하는글 end ---------------------------------------------------------------------- -->

    <!-- Writer Collection 영역 ---------------------------------------------------------->
    	<div class="h4 font-weight-bold text-center py-3">Writer Collection</div>
        <p class="text-muted text-center py-3" style="margin-top:-30px">작가의 다양한 글 모음</p>
    <div class="cardgrid">
        <div class="container" style="margin-top:10px">
      		<ul class="cards">

      		<% int TopCollectionSize = (int)request.getAttribute("TopCollectionSize");

	            List<Search> topcollection = (List<Search>) request.getAttribute("TopCollection");

	            	for(int i=0; i<TopCollectionSize; i++){
	            		//객체 하나 가져온다
	            		 Search collection = topcollection.get(i);

	            		//timestamp 포멧팅
	            		 Timestamp timestamp = Timestamp.valueOf(collection.getCreatedate());
	            	     Date date = new Date(timestamp.getTime());
	            	     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	            	     String formatDate = dateFormat.format(date);

	            	   //content html태그 빼기
	            	     String content = collection.getContent().replaceAll("<[^>]*>", "");

            %>
      			 <li class="card">
			          <div>
			            <img src=<%=collection.getMaintitleimg() %>; style="width: 270px; height: 150px; margin-bottom:10px" />
			            <h3 class="card-title"><%=collection.getMaintitle() %></h3>
			            <p style="color:black;"><%=collection.getNickname() %></p>
			            <div class="card-content">
			              <p style="color:black;"><%=collection.getSubtitle() %></p>
			            </div>
			          </div>
			          <div class="card-link-wrapper">
			            <a href="/post/<%=collection.getPostnum() %>" class="card-link" style="border-color:#007b5e;">Click me</a>
			          </div>
			        </li>
		<%
        	}
        %>
			</ul>
    	</div>
    </div>
	<!-- Writer Collection 영역 --------------------------------------------->




</div><!-- body end -->

<!-- FOOTER -->
<%@ include file="./common/footer.jsp" %>
</body>
</html>