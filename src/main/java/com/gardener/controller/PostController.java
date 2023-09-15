package com.gardener.controller;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Controller
@Slf4j
public class PostController {
  private final String uploadDir = Paths.get("C:", "tui-editor", "upload").toString();

  @GetMapping("/posting")
  public void posting() {
  }

  @PostMapping("/posting")
  public @ResponseBody String uploadEditorImage(@RequestParam final MultipartFile image) {
    if (image.isEmpty()) {
      return "";
    }

    String originalFileName = image.getOriginalFilename();
    String uuid = UUID.randomUUID().toString().replaceAll("-", "");
    String extennsion = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
    String saveFileName = uuid + "." + extennsion;
    System.out.println("saveFileName =>" + saveFileName);
    String fileFullPath = Paths.get(uploadDir, saveFileName).toString();
    System.out.println("fileFullPath = > " + fileFullPath);

    File dir = new File(uploadDir);
    if (dir.exists() == false) {
      dir.mkdirs();
    }

    try {
      File uploadFile = new File(fileFullPath);
      image.transferTo(uploadFile);
      return saveFileName;
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * 디스크에 업로드된 파일을 byte[]로 반환
   *
   * @param filename 디스크에 업로드된 파일명
   * @return image byte array
   */
  @GetMapping(value = "/image-print", produces = {MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE})
  public @ResponseBody byte[] printEditorImage(@RequestParam final String filename) {
    String fileFullPath = Paths.get(uploadDir, filename).toString();

    File uploadFile = new File(fileFullPath);
    if (uploadFile.exists() == false) {
      throw new RuntimeException();
    }

    try {
      //이미지 파일을 byte[]로 변환 후 반환
      byte[] imgBytes = Files.readAllBytes(uploadFile.toPath());
      return imgBytes;
    } catch (IOException e) {
      throw new RuntimeException();
    }
  }

}
