package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.domain.Post;
import com.gardener.service.LibraryService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/library")
@RequiredArgsConstructor
@Slf4j
public class LibraryController {

  private final LibraryService libraryService;


  @GetMapping
  public void getAllFavoritePost(HttpSession session, Model model) throws FindException {
    String allFavoritePostWithPaging = getAllFavoritePostWithPaging(session, model, 1);
    model.addAttribute("post", allFavoritePostWithPaging);
  }

  // produces 없으면 한글이 꺠짐,
  @GetMapping(value = "/favorite/{num}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public @ResponseBody String getAllFavoritePostWithPaging(HttpSession session, Model model, @PathVariable int num) throws FindException {
    Gson gson = new Gson();
    Member member = (Member) session.getAttribute("member");

    List<Post> allPost = libraryService.getAllFavoritePostWithPaging(member.getLoginid(), num);
    if (!allPost.isEmpty()) {
      allPost.forEach(post -> {
        String s = post.getContent().replaceAll("<[^>]*>", "");
        post.setContent(s);
      });
    }

    return gson.toJson(allPost);
  }

  @GetMapping("/subscribe")
  public void getAllSubscribe() {
    log.info("지야 안녕!");
  }
}
