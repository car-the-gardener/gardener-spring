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
	private int postNum; // 글번호
	private int userNum; // 회원.아이디(번호)시퀀스
	private String mainTitle; // 제목
	private String subTitle; // 소제목
	private String content; // 내용
	private String mainTitleImg; // 제목이미지
	private String category; // 카테고리
	private int postPublic; // 비공개,공개(0,1)
	private int favorite; // 좋아요
	private String createPost; // 글 생성일자
	private Comments comments; // 댓글 dto
	private Member member; // member DTO

	public Post(int postNum, int userNum, String mainTitle, String subTitle, String content, String mainTitleImg,
			String category, int postPublic, int favorite, String createPost) {
		super();
		this.postNum = postNum;
		this.userNum = userNum;
		this.mainTitle = mainTitle;
		this.subTitle = subTitle;
		this.content = content;
		this.mainTitleImg = mainTitleImg;
		this.category = category;
		this.postPublic = postPublic;
		this.favorite = favorite;
		this.createPost = createPost;
	}

}
