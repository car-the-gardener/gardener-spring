package com.gardener.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gardener.service.ApplyService;
import com.gardener.service.MypageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/apply")
public class ApplyController {

	@Autowired
	private ApplyService service;

	@Autowired
	private MypageService s;

	/**
	 * 작가신청
	 */
	@GetMapping
	public String apply() {
		return "apply";
	}

	@PostMapping
	public ResponseEntity<Boolean> insertWriter(@RequestParam("loginid") String loginid, HttpSession session) {
		if (loginid == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
		}

		boolean result = service.insertWriter(loginid);
		return ResponseEntity.ok(result);
	}
}
