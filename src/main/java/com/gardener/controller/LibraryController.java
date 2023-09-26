package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.domain.Post;
import com.gardener.service.LibraryService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/library")
@RequiredArgsConstructor
@Slf4j
public class LibraryController {

  private final LibraryService libraryService;

  @GetMapping
  public void library() {

  }

  @GetMapping("/like")
  public ResponseEntity<String> getAllFavoritePost(HttpSession session) throws FindException {
    Gson gson = new Gson();
    Member member = (Member) session.getAttribute("member");

    List<Post> allPost = libraryService.getAllFavoritePost(member.getLoginid());
    if (allPost.isEmpty()) {
      throw new FindException();
    }
    log.info("all Post => {}", allPost);
    return new ResponseEntity<>(gson.toJson(allPost), HttpStatus.OK);
  }
}
