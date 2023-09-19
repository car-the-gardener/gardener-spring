package com.gardener.controller;

import com.gardener.domain.dto.MainImgDTO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

@Controller
@Slf4j
public class PostController {
  private final String uploadDir = Paths.get("C:", "tui-editor", "upload").toString();

  @GetMapping("/posting")
  public void posting() {
  }

  // 메인 이미지 저장
  @PostMapping(value = "/main-image", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<MainImgDTO> uploadMainImage(MultipartFile image) {
    MainImgDTO dto = new MainImgDTO();
    if (image.isEmpty()) {
      return new ResponseEntity<>(new MainImgDTO(), HttpStatus.BAD_GATEWAY);
    }

    String originalFileName = image.getOriginalFilename();
    String uuid = UUID.randomUUID().toString().substring(0, 8);
    String saveFileName = uuid + "-" + originalFileName;
    File uploadPath = new File(uploadDir, getFolder() + "\\main");

    dto.setFileName(saveFileName);
    dto.setUuid(uuid);
    dto.setUploadPath(getFolder());

    // make yyyy/MM/dd folder
    if (!uploadPath.exists()) {
      uploadPath.mkdirs();
    }

    try {
      File saveFile = new File(uploadPath, saveFileName);
      image.transferTo(saveFile);
      dto.setImage(true);
      FileOutputStream fos = new FileOutputStream(new File(uploadPath, "s-" + saveFileName));
      Thumbnailator.createThumbnail(image.getInputStream(), fos, 250, 250);
      fos.close();
      return new ResponseEntity<>(dto, HttpStatus.OK);
    } catch (IOException e) {
      e.printStackTrace();
      throw new RuntimeException();
    }
  }

  // 메인 이미지 불러오기 
  @GetMapping("/image-print-main")
  @ResponseBody
  public ResponseEntity<byte[]> getImage(String filename) {
    log.info("file name = {}", filename);
    File file = new File("c:\\tui-editor\\upload\\" + filename);
    log.info("main file = {}", file);

    ResponseEntity<byte[]> result = null;

    try {
      HttpHeaders headers = new HttpHeaders();
      headers.add("Content-Type", Files.probeContentType(file.toPath()));
      System.out.println(headers.getContentType() + " get Content Type");
      System.out.println(Files.probeContentType(file.toPath()) + " probeContetnttpoye");
      result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return result;
  }

  @PostMapping(value = "/posting", produces = "text/plain; charset=utf-8")
  public @ResponseBody String uploadEditorImage(@RequestParam final MultipartFile image) {
    if (image.isEmpty()) {
      return "";
    }

    String originalFileName = image.getOriginalFilename();
    String uuid = UUID.randomUUID().toString().substring(0, 8);
    String saveFileName = uuid + "-" + originalFileName;
    System.out.println("saveFileName =>" + saveFileName);
    File uploadPath = new File(uploadDir, getFolder() + "\\content");

    if (!uploadPath.exists()) {
      uploadPath.mkdirs();
    }
    try {
      File uploadFile = new File(uploadPath, saveFileName);
      image.transferTo(uploadFile);
      return saveFileName;
    } catch (IOException e) {
      e.printStackTrace();
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
  public @ResponseBody byte[] printEditorImage(@RequestParam final String filename, String sort) {
    log.info("sort => {}", sort);
    log.info("filename => {}", filename);

    String fileFullPath = "";
    if (sort.equals("main")) {
      log.info("main 처리 시작");
      fileFullPath = Paths.get(uploadDir, filename).toString();
    } else {
      fileFullPath = Paths.get(uploadDir, getFolder() + "\\content", filename).toString();
    }

    File uploadFile = new File(fileFullPath);
    if (!uploadFile.exists()) {
      throw new RuntimeException();
    }
    try {
      //이미지 파일을 byte[]로 변환 후 반환
      byte[] imgBytes = Files.readAllBytes(uploadFile.toPath());
      return imgBytes;
    } catch (IOException e) {
      e.printStackTrace();
      throw new RuntimeException();
    }
  }

  // 폴더 생성 함수
  private String getFolder() {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String str = sdf.format(date);
    return str.replace("-", File.separator);
  }

}
