package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.dto.FavoriteDTO;
import com.gardener.service.FavoriteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/post")
@Slf4j
public class FavoriteController {

  private final FavoriteService favoriteService;

  @GetMapping(value = "/{postnum}/favorite", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Map<String, List<FavoriteDTO>> test(@PathVariable Long postnum, HttpSession session) throws FindException {
    String loginid = (String) session.getAttribute("loginid");
    Map<String, List<FavoriteDTO>> map = favoriteService.selectFavoByloginid(postnum, loginid);
    log.info("Map<String, List<FavoriteDTO>> => {}", map);
    return map;
  }

  @PostMapping("/{postnum}/favorite")
  public String insertFavorite(@PathVariable Long postnum, HttpSession session) throws FindException {
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
