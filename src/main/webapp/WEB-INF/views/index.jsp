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
    <script src="/resources/js/index.js"></script>
    <script src="/resources/js/indexsub.js"></script>

    <title>IntelliJ index</title>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="./common/header.jsp" %>

<!-- search ------------------------------------------------------------------------영역 -->
<div id="search" style="margin-top:30px;">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-8 offset-md-4">
                <div class="input-group">
                    <div class="input-group-prepend">
                         <select class="form-select" name="search_param" id="search_param">
	                        <option value="title">제목</option>
	                        <option value="name">필명</option>
	                        <option value="content">내용</option>
                    	</select>
                    </div>
                    <input type="text" class="form-control" name="searchtext" placeholder="검색할 단어를 입력해주세요...">
                    <span class="input-group-btn">
		            	<button class="btn btn-primary" type="button" id="searchbtn"><i class="fa-solid fa-search"></i> Search</button>
		            </span>
                </div>
            </div>
        </div>
    </div>
</div><!-- ---------------------------------------------------------------search end -->

<!-- carousel ----------------------------------------------------------------------영역 -->
<div class="body" style="margin-top:-70px">

    <div id="carousel img" >
        <div class="content">
            <div class="container">

                <div class="owl-carousel slide-one-item">
                    <div class="d-md-flex testimony-29101 align-items-stretch">
                        <div class="image" style="background-image: url('/resources/images/main1.png')"></div>
                        <div class="text">
                            <blockquote>
                                <p>
                                    &ldquo; 질량의 크기는 부피와 비례하지 않는다
                                    제비꽃같이 조그마한 그 계집애가
                                    꽃잎처럼 하늘거리는 그 계집애가
                                    지구보다 더 큰 질량으로 나를 끌어당긴다
                                    순간 나는
                                    뉴턴의 사과처럼
                                    사정없이 그녀에게로 굴러 떨어졌다
                                    쿵 소리를 내며 쿵쿵 소리를 내며
                                    심장이
                                    하늘에서 땅까지
                                    아찔한 진자운동을 하였다.
                                    첫사랑이었다.&rdquo;
                                </p>

                                <div class="author">&mdash;김인육</div>
                            </blockquote>
                        </div>
                    </div>

                    <!-- .item -->
                    <div class="d-md-flex testimony-29101 align-items-stretch">
                        <div class="image" style="background-image: url('/resources/images/main3.png')"></div>
                        <div class="text">
                            <blockquote>
                                <p>
                                    &ldquo; 어느날 우리는 같은 시간 다른 공간에서
                                    같은 음악을 다른 기분으로 듣는다.
                                    종착역 보다 늦게 도착한다.
                                    선율만 흐를뿐이다.&rdquo;
                                </p>

                                <div class="author">&mdash;오은</div>
                            </blockquote>
                        </div>
                    </div> <!-- .item -->
                </div>
            </div>
        </div>
    </div><!-- ------------------------------------------------------------------carousel img end -->

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
                                <img src="https://freepngimg.com/thumb/microphone/11-microphone-png-image-thumb.png" alt="" />
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
                                <img src="https://freepngimg.com/thumb/email_marketing/5-2-email-png-thumb.png" alt="" />
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
                                        src="https://freepngimg.com/thumb/technology/40061-1-machining-robot-download-free-image-thumb.png"
                                        alt=""
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
                                        src="https://freepngimg.com/thumb/brain/80003-learning-human-albert-play-scientist-behavior-einstein-thumb.png"
                                        alt=""
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
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pink">
                                <img
                                        src="https://freepngimg.com/thumb/google/66809-google-docs-drive-plus-android-document-thumb.png"
                                        alt=""
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
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
                                <img
                                        src="https://www.freepnglogos.com/uploads/plane-png/plane-png-fort-wayne-international-airport-2.png"
                                        alt=""
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
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-orange">
                                <img
                                        src="https://www.freepnglogos.com/uploads/whatsapp-circle-message-messaging-messenger-round-icon--24.png"
                                        alt=""
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
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-green">
                                <img
                                        src="https://freepngimg.com/thumb/technology/63219-bin-recycling-computer-recycle-electronics-waste-electronic-thumb.png"
                                        alt=""
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
                            <div class="rounded-circle mx-3 d-flex align-items-center justify-content-center pale-pista">
                                <img src="https://freepngimg.com/thumb/happy_person/4-2-happy-person-transparent-thumb.png" alt="" />
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <b>Cooking</b>
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
        <%@ include file="./common/cardgrid.jsp" %>
    </div>

</div><!-- body end -->

<!-- FOOTER -->
<%@ include file="./common/footer.jsp" %>
</body>
</html>