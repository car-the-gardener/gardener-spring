package com.gardener.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberLoginController {

  @Autowired
  private MemberService service;

  @GetMapping("/login")
  public void login() {
  }

  ;

  @PostMapping("/login") // 로그인
  public ResponseEntity<String> login(@RequestParam("loginid") String id, @RequestParam("password") String pwd,
                                      HttpServletRequest request) throws FindException {

    Member m = service.login(id, pwd);
    if (m != null) {
      HttpSession session = request.getSession();
      session.setAttribute("loginid", id);
      session.setAttribute("nickname", m.getNickname());
      session.setAttribute("writer", m.getWriter().isType());
      //session.setMaxInactiveInterval(1800); // 유효시간설정 (1800초 = 30분)
      return new ResponseEntity("1", HttpStatus.OK);
    } else {
      return new ResponseEntity("0", HttpStatus.INTERNAL_SERVER_ERROR);
    }

  }

  @GetMapping("/find_id") // ID찾기
  public void findloginid() {
  }

  ;

  @PostMapping("/find_id")
  public ResponseEntity<String> findloginid(@RequestParam("nickname") String name,
                                            @RequestParam("email") String email, HttpServletRequest request) throws FindException {

    try {
      String m = service.findLoginid(name, email);
      return new ResponseEntity(m, HttpStatus.OK);
    } catch (FindException e) {
      throw new FindException();
    }
  }
}
