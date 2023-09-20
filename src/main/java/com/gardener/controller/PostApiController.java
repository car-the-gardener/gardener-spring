package com.gardener.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gardener.domain.Post;
import com.gardener.service.PostService;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/post")
public class PostApiController {

  private final PostService postService;

  // 게시글 저장
  @PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long savePost(HttpSession session, @RequestBody Post post) {
    post.setLoginid((String) session.getAttribute("loginid"));
    log.info("requestbody {}", post);
    return postService.savePost(post);
  }

  // 게시글 조회
  @GetMapping(value = "/{id}")
  public ModelAndView findPostById(@PathVariable Long id) {
    Post post = postService.findPostById(id);
    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.setViewName("/post");
    return mv;
  }

}
