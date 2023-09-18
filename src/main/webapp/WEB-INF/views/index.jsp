<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/resources/css/index.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="/resources/js/index.js"></script>
        <title>Index</title>
    </head>

    <body>
        <!--body-->
        <%@ include file="./common/header.jsp" %>
            <div class="body">
                <div class="right-dropdown">
                    <span> <select class="dropdown" name="drop">
                            <option value="title">제목</option>
                            <option value="name">필명</option>
                            <option value="content">내용</option>
                        </select>
                    </span> <input type="text" class="search-text" name="keyword" placeholder="검색어를 입력해주세요"> <input
                        type="button" value="검색" class="search-button">
                </div>

                <div class=search-body>
                    <table class="main-table">

                        <tr class="first-tr">
                            <td><a href="./post.html"> <img src="https://i.imgur.com/8OKpmst.jpg" class="first-img">
                                </a></td>
                            <td>
                                <table>
                                    <tr>
                                        <a href="#"> <img src="https://i.imgur.com/9dnYBV4.jpg" class="image">
                                        </a>
                                    </tr>
                                    <tr>
                                        <a href="#"> <img src="https://i.imgur.com/Ms22sRJ.jpg" class="image">
                                        </a>
                                    </tr>
                                </table>
                            </td>

                            <td>
                                <table>
                                    <tr>
                                        <a href="#"> <img src="https://i.imgur.com/dDHB0Rk.jpg" class="image">
                                        </a>
                                    </tr>
                                    <tr>
                                        <a href="#"> <img src="https://i.imgur.com/tyUPXLf.jpg" class="image">
                                        </a>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 전체 tr-->

                    </table>
                    <!--전체 table-->

                    <!--카테고리 영역-->
                    <!--시, 여행, 연애, IT, 시사, 사진, 육아, 요리, 운동, 문화, 인문학, 역사, 애완동물, -->
                    <table border="1" cellspacing="0px" class="categorie-table">
                        <tr>
                            <td class="category">시</td>
                            <td class="category">여행</td>
                            <td class="category">연애</td>
                            <td class="category">IT</td>
                            <td class="category">시사</td>
                            <td class="category">사진</td>
                            <td class="category">육아</td>
                            <td class="category">요리</td>
                            <td class="category">운동</td>
                            <td class="category">문화</td>
                        </tr>
                        <tr>
                            <td class="category">인문학</td>
                            <td class="category">역사</td>
                            <td class="category">애완동물</td>
                            <td class="category">자연</td>
                            <td class="category">풍경</td>
                            <td class="category">친목</td>
                            <td class="category">영화</td>
                            <td class="category">심리</td>
                            <td class="category">음악</td>
                            <td class="category">일상</td>
                        </tr>
                    </table>

                    <table cellspacing="0px" class="writing-list">
                        <tr>
                            <td><a href="./post.html"> <img src="https://i.imgur.com/8OKpmst.jpg" alt=""
                                        class="writing-img"></td>
                            </a>
                            <td>
                                <h2>사랑의 물리학 -</h2>
                                <h3>김인육</h3>
                                <p>질량의 크기는 부피와 비례하지 않는다. 제비꽃같이 조그마한 그 계집애가 꽃잎같이 하늘거리는 그
                                    계집애가...</p>
                            </td>
                        </tr>

                        <tr>
                            <td><img src="https://i.imgur.com/J91Dzsg.jpg" alt="" class="writing-img"></td>
                            <td>
                                <h2>사랑에 답함 -</h2>
                                <h3>나태주</h3>
                                <p>예쁘지 않은 것을 예쁘게 보아주는 것이 사랑이다 좋지 않은 것을 좋게 생각해주는 것이 사랑이다...</p>
                            </td>
                        </tr>

                        <tr>
                            <td><img src="https://i.imgur.com/ajdSOy8.png" class="writing-img"></td>
                            <td>
                                <h2>아찔 -</h2>
                                <h3>오은영</h3>
                                <p>어느날 우리는 같은 시간 다른 공간에서 같은 음악을 다른 기분으로 듣는다....</p>
                            </td>
                        </tr>

                        <tr>
                            <td><img src=" https://i.imgur.com/S8A738o.png" class="writing-img"></td>
                            <td>
                                <h2>하고많은 것들 중에 당신을 사랑하였다 -</h2>
                                <h3>서덕준</h3>
                                <p>하고많은 것들 중에 하필 당신을 사랑하였으나 그는 나에게 정차하는 일이 없었다...</p>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- div class=" search-body" -->
            </div>
            <!--div class="body"-->
            <!--body-->

            <%@ include file="./common/footer.jsp" %>
    </body>

    </html>
