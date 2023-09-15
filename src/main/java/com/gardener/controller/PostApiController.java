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
@RequestMapping("/post")
@RequiredArgsConstructor
@Slf4j
public class PostApiController {

  private final PostService postService;

  // 게시글 저장
  @PostMapping
  public Long savePost(@RequestBody Post post) {
    log.info("requestbody {}", post);
    return postService.savePost(post);
  }

  //게시글 조회
  @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public ModelAndView findPostById(@PathVariable Long id) {
    Post post = postService.findPostById(id);
    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.setViewName("/post");
    return mv;
  }

  // 모든 게시글 조회
  @GetMapping
  public List<Post> findAllPost() {
    List<Post> posts = postService.findAllPost();
    return posts;
  }

}
