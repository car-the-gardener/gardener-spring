package com.gardener.controller;

import com.gardener.service.FavoriteService;
import com.gardener.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/post")
@Slf4j
public class FavoriteController {

  private final FavoriteService favoriteService;

  @GetMapping("/{postnum}/favorite")
  public String insertFavorite(@PathVariable Long postnum, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    favoriteService.insertFavorite(postnum, loginid);
    return "success";
  }

  @DeleteMapping("/{postnum}/favorite")
  public String deleteFavorite(@PathVariable Long postnum, HttpSession session) {
    log.info("좋아요 삭제 => {}", postnum);
    String loginid = (String) session.getAttribute("loginid");
    favoriteService.deleteFavorite(postnum, loginid);
    return "false";
  }
}
