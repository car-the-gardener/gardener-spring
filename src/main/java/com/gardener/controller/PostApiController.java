package com.gardener.controller;

import com.gardener.domain.Post;
import com.gardener.service.PostService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/post")
public class PostApiController {

  private final PostService postService;

  // 게시글 저장
  @PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long savePost(@RequestBody Post post) {
    log.info("requestbody {}", post);
    return postService.savePost(post);
  }

  //게시글 조회
  @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public ModelAndView findPostById(@PathVariable Long id) {
    Post post = postService.findPostById(id);
    log.info("시발 post {}", post);
    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.setViewName("/post");
    return mv;
  }



}
