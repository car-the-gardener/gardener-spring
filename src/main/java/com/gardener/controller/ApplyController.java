//package com.gardener.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.gardener.service.applyService;
//
//import lombok.extern.log4j.Log4j;
//
//@Controller
//@Log4j
//@RequestMapping("/apply")
//public class ApplyController {
//
//	@Autowired
//	private applyService service;
//
//	/**
//	 * 작가신청
//	 */
//	@PostMapping
//	public ResponseEntity<Boolean> updateWriter(HttpSession session) {
//		Integer memberId = (Integer) session.getAttribute("loginid");
//		if (memberId == null) {
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
//		}
//
//		boolean result = applyService.insertWriter("rudns10");
//		return ResponseEntity.ok(result);
//	}
//}
