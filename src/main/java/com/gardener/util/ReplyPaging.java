package com.gardener.util;

import lombok.Getter;
import lombok.ToString;

@ToString
public class ReplyPaging {
  private int startNum;
  private int endNum;

  public ReplyPaging() {
    this(1, 10);
  }

  public ReplyPaging(int startNum, int endNum) {
    this.startNum = startNum;
    this.endNum = endNum;
  }
}
