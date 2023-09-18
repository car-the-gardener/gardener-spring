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
	};

	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestParam("loginid") String id, @RequestParam("password") String pwd,
			HttpServletRequest request) throws FindException {

		Member m = service.login(id, pwd);
		log.warn("member:" + m);
		if (m != null) {
			HttpSession session = request.getSession(); // 세션을 가져옴
			session.setAttribute("loginid", id);
			session.setMaxInactiveInterval(1800); // 유효시간설정 (1800초 = 30분)
			return new ResponseEntity("1", HttpStatus.OK);

		} else {
			return new ResponseEntity("0", HttpStatus.OK);
		}

	}

}
