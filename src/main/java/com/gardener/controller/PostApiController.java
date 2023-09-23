package com.gardener.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.gardener.domain.Post;
import com.gardener.service.PostService;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/post")
public class PostApiController {

  private final PostService postService;
  static String path = "C:\\Users\\swans\\Documents\\workspace-sts-3.9.18.RELEASE\\gardener-spring\\src\\main\\webapp\\resources\\images\\post\\";

  // 게시글 저장
  @PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long savePost(HttpSession session, @RequestBody Post post) {
    post.setLoginid((String) session.getAttribute("loginid"));
    log.info("requestbody {}", post);
    return postService.savePost(post);
  }

  // 게시글 조회
  @GetMapping("/{postnum}")
  public ModelAndView findPostBypostnum(@PathVariable Long postnum) {
    Post post = postService.findPostByPostnum(postnum);
    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.setViewName("/post");
    return mv;
  }

  @RequestMapping(value = "/{postnum}", method = {RequestMethod.PATCH, RequestMethod.PUT}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long updatePostBypostnum(@RequestBody Post post, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    post.setLoginid(loginid);
    log.info("수정할 post => {}", post);
    postService.updatePostByPostnum(post);

    return post.getPostnum();
  }
}
