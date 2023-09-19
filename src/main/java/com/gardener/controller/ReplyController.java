package com.gardener.controller;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.Reply;
import com.gardener.service.ReplyService;
import com.gardener.util.Criteria;
import com.gardener.util.ReplyPaging;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.format.ResolverStyle;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reply")
@Slf4j
public class ReplyController {

  private final ReplyService service;

  @PostMapping
  public ResponseEntity<String> insertReply(@RequestBody Reply reply, HttpSession session) {
    String loginid = (String) session.getAttribute("loginid");
    reply.setMemberLoginid(loginid);
    log.info("reply => {}", reply);
    int result = service.insert(reply);

    return result == 1 ? new ResponseEntity<>("Success", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @GetMapping(value = "/{postId}/{page}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public ResponseEntity<List<Reply>> getAllReply(@PathVariable Long postId, @PathVariable int page) throws FindException {
    Criteria cri = new Criteria(page, 5);
    List<Reply> allReply = service.findAll(cri, postId);
    log.info("all reply => {}", allReply);

    if (allReply.isEmpty()) {
      throw new FindException();
    }

    return new ResponseEntity<>(allReply, HttpStatus.OK);
  }

  @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{id}")
  public ResponseEntity<String> modify(@RequestBody Reply reply) {
    int result = service.update(reply);

    return result == 1
            ? new ResponseEntity<>("result " + result, HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @DeleteMapping("/{id}")
  public ResponseEntity<String> remove(@PathVariable Long id) {
    int result = service.delete(id);

    return result == 1
            ? new ResponseEntity<>("result " + result, HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
