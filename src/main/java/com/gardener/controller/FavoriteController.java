package com.gardener.controller;

import com.gardener.service.FavoriteService;
import com.gardener.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class FavoriteController {

  private final FavoriteService favoriteService;

  @GetMapping("/{postnum}/favorite")
  public void insertFavorite(@PathVariable Long postnum, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    favoriteService.insertFavorite(postnum, loginid);
  }

  @DeleteMapping("/{postnum}/favorite")
  public void deleteFavorite(@PathVariable Long postnum, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    favoriteService.deleteFavorite(postnum, loginid);
  }
}
