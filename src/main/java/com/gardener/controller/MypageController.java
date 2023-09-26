package com.gardener.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gardener.aop.exception.FindException;
import com.gardener.aop.exception.UpdateException;
import com.gardener.domain.Member;
import com.gardener.domain.Writer;
import com.gardener.service.MypageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

  @Autowired
  private MypageService service;

  /**
   * Mypage 내 정보 확인
   */
  @GetMapping
  public void mypage(Model model, HttpSession session) {
    // String loginid = (String) session.getAttribute("loginid");
    Member member = (Member) session.getAttribute("member");
    log.info("loginid => " + member);
    model.addAttribute("member", member);
  }

  /**
   * 계정 삭제
   */
  @PostMapping("/delete")
  @ResponseBody
  public ResponseEntity<String> deleteMember(@RequestParam("loginid") String loginid, HttpSession session) {
    if (loginid == null || loginid.isEmpty()) {
      String errorMessage = "사용자 ID가 전달되지 않았습니다.";
      return ResponseEntity.badRequest().body(errorMessage);
    }

    boolean isDeleted = service.deleteMember(loginid);

    if (isDeleted) {
      String successMessage = "회원탈퇴가 성공적으로 처리되었습니다.";
      session.removeAttribute("loginid");
      session.invalidate();

      return ResponseEntity.ok(successMessage);
    } else {
      String errorMessage = "회원탈퇴를 처리하는 중에 오류가 발생했습니다.";
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
    }
  }

  /**
   * 내 정보 수정하기
   */

  @PostMapping(value = "/update")
  public ResponseEntity<String> updateMember(@RequestParam("loginid") String loginid, @RequestParam("pwd") String pwd,
                                             @RequestParam("email") String email, @RequestParam("nickname") String nickname,
                                             @RequestParam("intro") String intro) throws FindException {

    try {
      log.warn("loginid:" + loginid);
      Member member = service.selectByLoginid(loginid);

      // Member 객체의 필드들을 업데이트
      member.setLoginid(loginid);
      member.setPwd(pwd);
      member.setEmail(email);
      member.setNickname(nickname);
      member.setIntro(intro);

      // 업데이트된 Member 객체를 데이터베이스에 저장
      service.updateMember(member);

      return ResponseEntity.ok("Update successful.");
    } catch (UpdateException e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
    }
  }

  /**
   * 작가 취소
   */
  @PostMapping("/applydelete")
  @ResponseBody
  public ResponseEntity<String> deleteapply(@RequestParam("loginid") String loginid, HttpSession session) {
    if (loginid == null || loginid.isEmpty()) {
      String errorMessage = "사용자 ID가 전달되지 않았습니다.";
      return ResponseEntity.badRequest().body(errorMessage);
    }

    boolean isDeleted = service.deleteapply(loginid);
    Writer w = new Writer();
    if (isDeleted) {
      String successMessage = "작가취소가 성공적으로 처리되었습니다.";
      session.removeAttribute("loginid");
      try {
        service.selectByLoginid(loginid);
      } catch (FindException e) {
        e.printStackTrace();
      }
      session.setAttribute("writer", w.isType());
      return ResponseEntity.ok(successMessage);
    } else {
      String errorMessage = "작가취소를 처리하는 중에 오류가 발생했습니다.";
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
    }
  }

}