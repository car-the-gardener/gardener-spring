<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
                    	<form method="get" action="/search">
                    	
	                        <select class="form-select" name="select" id="search_param">
	                            <option name="title" value="title">제목</option>
	                            <option name="name" value="name">필명</option>
	                            <option name="content" value="content">내용</option>
	                            <option name="all" value="all">전체</option>
	                        </select>
	                        
	                </div>
	                    
	                    <input type="text" class="form-control" name="text" placeholder="검색할 단어를 입력해주세요...">
	                    <!-- <input type="hidden" name="result" class="result"> -->
	                    
	                    <span class="input-group-btn">
	                        <button class="btn btn-primary" type="button" id="searchbtn"><i class="fa-solid fa-search"></i> Search</button>
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
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 text-center d-flex align-items-center justify-content-center blue">
                                <img src="https://freepngimg.com/thumb/pen/14-pen-png-image.png"
       							/>
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Poem</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
                                <img
                                	src="https://www.freepnglogos.com/uploads/plane-png/plane-png-fort-wayne-international-airport-2.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Travel</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-purple">
                                <img
                                	src="https://freepngimg.com/thumb/love/7-2-love-free-png-image.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Love</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-3 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-cyan">
                                <img
                                	src="https://freepngimg.com/thumb/android/31165-8-android-hd.png"
                                 />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>IT</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-3 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center gray">
                                <img
                                	src="https://freepngimg.com/thumb/photography/3-2-photography-silhouette-png.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>photo</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-3 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-green">
                                <img
                                	src="https://freepngimg.com/thumb/clapperboard/6-2-clapperboard-png-picture.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Movie</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
                                <img
                                	src="https://freepngimg.com/thumb/musical_notes/5-2-musical-notes-picture.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Music</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                        	<div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pink">
                                <img
                                	src="https://freepngimg.com/thumb/dog/9-dog-png-image-picture-download-dogs.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Pet</b>
                                </a>
                            </div>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pista">
                                <img src="https://freepngimg.com/thumb/egg/7-fried-egg-png-image.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Cooking</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 my-lg-0 my-3" >
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-purple">
                                <img src="https://freepngimg.com/thumb/teddy_bear/8-2-teddy-bear-png-file.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Child</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-cyan">
                                <img src="https://freepngimg.com/thumb/sports_equipment/22346-3-sport-transparent-background.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Sports</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 my-lg-0 my-3">
                    <div class="box bg-white">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
                                <img src="https://freepngimg.com/thumb/book/2-books-png-image.png"
                                />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Library</b>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- div.category end -->
    <!-- category영역 --------------------------------------------------------------------end -->

    <!-- 추천하는 글 영역-------------------------------------------------------------------- -->
    <div class="h4 font-weight-bold text-center py-3">Gardener Recommendation</div>
    <p class="text-muted text-center py-3" style="margin-top:-30px">작가의 정원에서 추천하는 글</p>

    <table cellspacing="0px" class="writing-list">
        <tr>
            <td>
                <a href="./post.html">
                    <img src="https://i.imgur.com/8OKpmst.jpg" class="writing-img">
                </a>
            </td>
            <td>
                <h2>사랑의 물리학 -</h2>
                <h2>김인육</h2>
                <p>질량의 크기는 부피와 비례하지 않는다. 제비꽃같이 조그마한 그 계집애가 꽃잎같이 하늘거리는 그
                    계집애가...</p>
            </td>
        </tr>

        <tr>
            <td>
                <img src="https://i.imgur.com/J91Dzsg.jpg" class="writing-img">
            </td>
            <td>
                <h2>사랑에 답함 -</h2>
                <h2>나태주</h2>
                <p>예쁘지 않은 것을 예쁘게 보아주는 것이 사랑이다 좋지 않은 것을 좋게 생각해주는 것이 사랑이다...</p>
            </td>
        </tr>

        <tr>
            <td>
                <img src="https://i.imgur.com/ajdSOy8.png" class="writing-img" >
            <td>
                <h2>아찔 -</h2>
                <h2>오은영</h2>
                <p>어느날 우리는 같은 시간 다른 공간에서 같은 음악을 다른 기분으로 듣는다....</p>
            </td>
        </tr>

        <tr>
            <td>
                <img src="https://i.imgur.com/svjft1X.jpg" class="writing-img">
            </td>
            <td>
                <h2>하고많은 것들 중에 당신을 사랑하였다 -</h2>
                <h2>서덕준</h2>
                <p>하고많은 것들 중에 하필 당신을 사랑하였으나 그는 나에게 정차하는 일이 없었다...</p>
            </td>
        </tr>
    </table>
    <!-- 추천하는글 end ---------------------------------------------------------------------- -->

    <!-- card grid -->
    <div class="cardgrid">
    	<div class="h4 font-weight-bold text-center py-3">Writer Collection</div>
        <p class="text-muted text-center py-3" style="margin-top:-30px">작가의 다양한 글 모음</p>
        <%@ include file="./common/cardgrid.jsp" %>
    </div>

</div><!-- body end -->

<!-- FOOTER -->
<%@ include file="./common/footer.jsp" %>
</body>
</html>