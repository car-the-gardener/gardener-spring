package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.mappers.PostMapper;
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

  /**
   * @param post
   * @param session
   * @return 저장된 게시글 번호
   * 게시글 저장
   */
  @PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long savePost(@RequestBody Post post, HttpSession session) {
    post.setLoginid((String) session.getAttribute("loginid"));
    log.info("requestbody {}", post);
    return postService.savePost(post);
  }

  /**
   * @param postnum
   * @return post -> json
   * 게시물 상세보기
   */
  @GetMapping("/{postnum}")
  public ModelAndView findPostBypostnum(@PathVariable Long postnum) throws FindException {
    Post post = postService.findPostByPostnum(postnum);
    if (post == null) {
      throw new FindException();
    }
    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.setViewName("/post");
    return mv;
  }

  /**
   * @param post
   * @param session
   * @return 수정된 포스트 넘버
   * 게시물 수정
   */
  @RequestMapping(value = "/{postnum}", method = {RequestMethod.PATCH, RequestMethod.PUT}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long updatePostBypostnum(@RequestBody Post post, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    post.setLoginid(loginid);
    log.info("수정할 post => {}", post);
    postService.updatePostByPostnum(post);

    return post.getPostnum();
  }

  @DeleteMapping(value = "/{postnum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long deletePostByPostnum(@PathVariable Long postnum) {
    postService.deletePostByPostnum(postnum);
    return postnum;
  }

}
