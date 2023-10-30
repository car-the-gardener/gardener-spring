package com.gardener.domain.dto;

import lombok.Data;

@Data
public class MainImgDTO {
  private String fileName;
  private String uploadPath;
  private String uuid;
  private boolean image;
}
