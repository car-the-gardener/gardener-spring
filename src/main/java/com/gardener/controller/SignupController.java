package com.gardener.controller;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gardener.aop.exception.AddException;
import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SignupController {

	@Autowired
	MemberService service;

	@GetMapping("/signup")
	public void signup() {
	};

	@GetMapping("/id_chk")
	public ResponseEntity<String> idDupChk(String loginid) {
		try {
			log.info(loginid);
			String result = service.idDupChk(loginid);
			log.info(result);
			return new ResponseEntity(result, HttpStatus.OK);
		} catch (FindException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	};

	@GetMapping("/name_chk")
	public ResponseEntity<String> NicknameDupChk(String nickname) {
		try {
			log.info(nickname);
			String result = service.NicknameDupChk(nickname);
			log.info(result);
			return new ResponseEntity(result, HttpStatus.OK);
		} catch (FindException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	};

	@PostMapping("/signup")
	public ResponseEntity<String> signup(Member m) {
		log.info("회원가입 컨트롤러 => " + m);
		try {
			service.signup(m);
			return new ResponseEntity(HttpStatus.OK);
		} catch (AddException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

=======
public class SignupController {

>>>>>>> 5e82415eb5641d8a856f683eb36cb6dad85155ca
}
