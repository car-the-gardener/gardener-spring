package com.gardener.domain;


import lombok.*;
import org.springframework.stereotype.Service;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
public class Reply {
  private Long id; // pk
  private String memberLoginid; // fk
  private Long postId; // fk
  private String content; // 600자까지
  private String createDate;
  private int report; // 좋아요 신고 수??
  private Member member; // 댓글을 쓴 사람

  // insert
  public Reply(String memberLoginid, Long postId, String content, int report) {
    this.postId = postId;
    this.memberLoginid = memberLoginid;
    this.content = content;
    this.report = report;
  }

  // update
  public Reply(Long id, String content) {
    this.id = id;
    this.content = content;
  }
}
