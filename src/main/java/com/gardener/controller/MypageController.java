package com.gardener.controller;

import java.io.File;

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
import org.springframework.web.multipart.MultipartFile;

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
		Member member = (Member) session.getAttribute("member");
		log.info("loginid => " + member);
		model.addAttribute("member", member);
	}

	/**
	 * Mypage 프로필 변경
	 */
	@PostMapping("/profile")
	public ResponseEntity<String> uploadFormPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
		for (MultipartFile multipartFile : uploadFile) {
			log.info("--------------------------");
			log.info("upload File Name:" + multipartFile.getOriginalFilename());
			log.info("upload File Size:" + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return null;
	}

	/**
	 * 계정 삭제
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> deleteMember(@RequestParam String loginid, HttpSession session) {
		if (loginid == null) {
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
	public ResponseEntity<String> updateMember(@RequestParam String loginid, @RequestParam String pwd,
			@RequestParam String email, @RequestParam String nickname, @RequestParam String intro, HttpSession session)
			throws FindException {

		try {
			Member member = service.selectByLoginid(loginid);

			member.setLoginid(loginid);
			member.setPwd(pwd);
			member.setEmail(email);
			member.setNickname(nickname);
			member.setIntro(intro);

			service.updateMember(member);
			session.setAttribute("member", member);

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
	public ResponseEntity<String> deleteapply(@RequestParam String loginid, HttpSession session) {
		if (loginid == null) {
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