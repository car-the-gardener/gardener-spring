package com.gardener.controller;

import com.gardener.domain.Post;
import com.gardener.domain.dto.MainImgDTO;
import com.gardener.service.PostService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PostController {
  private final PostService postService;
  private final String uploadDir = Paths.get("C:", "tui-editor", "upload").toString();

  @GetMapping("/posting")
  public void posting() {
  }

  // 수정 시 페이지 이동
  @GetMapping("/posting/{postnum}")
  public String suwan(@PathVariable Long postnum, HttpServletRequest request) {
    Gson gson = new Gson();
    Post post = postService.findPostByPostnum(postnum);
    String postToJson = gson.toJson(post);
    log.info("넘길 데이터 => {}", postToJson);
    request.setAttribute("post", postToJson);
    return "/posting";
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
    } finally {
    }
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
      return getFolder() + "\\content\\" + saveFileName;
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
      log.info("fileFullPath main => {}", fileFullPath);
    } else {
      fileFullPath = Paths.get(uploadDir, filename).toString();
      log.info("fileFullPath content => {}", fileFullPath);
    }

    File uploadFile = new File(fileFullPath);

    if (!uploadFile.exists()) {
      throw new RuntimeException();
    }

    try {
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
