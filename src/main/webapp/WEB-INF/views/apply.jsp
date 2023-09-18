<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="../css/apply.css">
        <title>apply</title>
    </head>

    <body>
        <div style="text-align: center;">
            <div class="apply">작가 신청</div>
        </div>

        <div class="Introduce">
            <h3>01. 작가소개</h3>
            <fieldset class="fieldset">
                <legend>작가님이 궁금해요</legend>
                <label>
                    <span>작가님이 누구인지 이해하고 <br>앞으로 작가의 정원에서 어떤 활동을 보여주실지 알려주세요.</span><br><br>
                    <textarea name="introduce" rows="6" clos="300" style="resize : none"
                        placeholder="작가 소개를 입력해 주세요.(300자내외)"></textarea>
                </label>
            </fieldset>
        </div>
        </div>
        </div>

        <div class="Activity">
            <h3>02. 작가의정원 활동 계획</h3>
            <fieldset class="fieldset">
                <legend>어떤 글을 작성하실 건가요?</legend>
                <label>
                    <span>발행하고자 하는 글의 주제나 소재, 대략의 목차를 알려주세요.</span>
                    <span><br>작가님의 활동을 기대할 수 있도록 미리 알려주세요.</span><br><br>
                    <textarea name="plan" rows="6" clos="300" style="resize : none"
                        placeholder="활동 계획을 입력해주세요.(300자내외)"></textarea>
                </label>
            </fieldset>
        </div>

        <div class="Writing">
            <h3>03. 자료첨부</h3>
            <div class="bundle_tit">
            </div>
            <fieldset class="fieldset">
                <legend class="screen_out">작가님의 글을 공유해주세요</legend>
                <span>작가님이 쓰셨던 글들을 공유해주세요.</span><br>


                <span class="txt_lab">이 외에 온라인매체 기고글이나 출간 책 주소를 입력해주세요.</span><br><br>
                <span class="bundle_tf" style="margin-bottom: 10px;">
                    <input name="refUrl" type="url" class="ur" placeholder="http://">
                </span>

                </label>
            </fieldset>


            <br>
            <button>제출하기</button>

        </div>




    </body>

    </html>