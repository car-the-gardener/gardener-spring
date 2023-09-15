package com.gardener.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Post {
  private Long id; // 글번호
  private String memberLoginid; // 회원.아이디(번호)시퀀스
  private String mainTitle; // 제목
  private String subTitle; // 소제목
  private String content; // 내용
  private String mainTitleImg; // 제목이미지
  private String category; // 카테고리
  private boolean publicYn; // 비공개,공개(0,1)
  private int favorite; // 좋아요
  private String createDate; // 글 생성일자
  private Comments comments; // 댓글 dto
  private Member member; // member DTO

  public Post(String memberLoginid, String mainTitle, String subTitle, String content, String mainTitleImg,
              String category, boolean publicYn, int favorite) {
    super();
    this.memberLoginid = memberLoginid;
    this.mainTitle = mainTitle;
    this.subTitle = subTitle;
    this.content = content;
    this.mainTitleImg = mainTitleImg;
    this.category = category;
    this.publicYn = publicYn;
    this.favorite = favorite;
  }

}
