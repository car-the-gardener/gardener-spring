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
	public void mypage(Model model) {
		Member member = null;
		try {
			member = service.selectById("rudns10");
			log.warn(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	 * 계정 내 정보 수정하기
	 */

	@PostMapping("/updatemember")
	public ResponseEntity<?> updateMember(@RequestParam String id, @RequestParam String pwd, @RequestParam String email,
			@RequestParam String name, @RequestParam String intro, @RequestParam String createDate,
			@RequestParam String profile) throws FindException {
		Member member = service.findByMember(id);
		member.setPwd(pwd);
		member.setEmail(email);
		member.setNickname(name);
		member.setIntro(intro);
		member.setCreateDate(createDate);
		member.setProfile(profile);

		try {
			service.updateMember(member);
			return ResponseEntity.ok("Update successful.");
		} catch (UpdateException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
		}
	}

}
