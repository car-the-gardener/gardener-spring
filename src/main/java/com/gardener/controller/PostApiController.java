package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.domain.Post;
import com.gardener.service.LibraryService;
import com.gardener.service.PostService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/post")
public class PostApiController {

  static String path = "C:\\Users\\swans\\Documents\\workspace-sts-3.9.18.RELEASE\\gardener-spring\\src\\main\\webapp\\resources\\images\\post\\";
  private final PostService postService;
  private final LibraryService libraryService;

  /**
   * @param post
   * @param session
   * @return 저장된 게시글 번호
   * 게시글 저장
   */
  @PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public Long savePost(@RequestBody Post post, HttpSession session) {
    Member member = (Member) session.getAttribute("member");
    post.setLoginid(member.getLoginid());
    return postService.savePost(post);
  }

  @GetMapping
  public List<Post> getAllMyPost(String loginid) {
    postService.findAllMyPost(loginid);
    return null;
  }

  /**
   * @param postnum
   * @return post -> json
   * 게시물 상세보기
   */
  @GetMapping("/{postnum}")
  public ModelAndView findPostBypostnum(@PathVariable Long postnum, HttpSession session) throws FindException {
    Member member = (Member) session.getAttribute("member");
    Post post = postService.findPostByPostnum(postnum);
    String result = libraryService.findSubscribe(member.getLoginid(), post.getLoginid());

    if (post == null) {
      throw new FindException();
    }

    ModelAndView mv = new ModelAndView();
    Gson gson = new Gson();
    mv.addObject("post", gson.toJson(post));
    mv.addObject("subscribe", result);
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
    Member member = (Member) session.getAttribute("member");
    post.setLoginid(member.getLoginid());
    postService.updatePostByPostnum(post);
    return post.getPostnum();
  }

}
