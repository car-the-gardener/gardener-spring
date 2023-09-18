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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gardener.aop.exception.FindException;
import com.gardener.aop.exception.UpdateException;
import com.gardener.domain.Member;
import com.gardener.service.MypageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService service;
	

	
	@GetMapping
	public void mypage(Model model) {
		 Member member = null;		 
		 try {
			 member = service.selectById("rudns10");
			 log.warn(member);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		model.addAttribute("member",member);
	}
	
	/**
	 * Mypage 내 정보 확인 
	 */
	@PostMapping
	public String mypage(
		String loginid,
		String pwd,
		String email,
		String name,
		String intro,
		String profile,
		RedirectAttributes redirectAttributes)
		{
		
		 Member member = new Member(loginid, pwd, email, name, intro, profile);
		 
		 try {
			service.updateMember(member);
		} catch (UpdateException e) {			
			e.printStackTrace();
		}
		 
		return "redirect:/gardener/mypage" ;
	
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

	        // 회원 탈퇴 로직 수행
	        boolean isDeleted = service.deleteMember(loginid);

	        // 회원 탈퇴 결과에 따라 응답을 보냄
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
//	    @GetMapping("/findmember")
//	       public ResponseEntity<Member> findMember(@RequestParam String id) {
//	           try {
//	               Member member = service.findByMember(id);
//	               return ResponseEntity.ok(member);
//	           } catch (FindException e) {
//	               return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//	           }
//	       }
//	       
//	       @PostMapping("/updatemember")
//	       public ResponseEntity<?> updateMember(@RequestParam String id, @RequestParam String pwd, 
//	                                             @RequestParam String email, @RequestParam String name, 
//	                                             @RequestParam String intro, @RequestParam String profile) throws FindException {
//	           Member member = service.findByMember(id);
//	           member.setPwd(pwd);
//	           member.setEmail(email);
//	           member.setName(name);
//	           member.setIntro(intro);
//	           member.setProfile(profile);
//
//	           try {
//	               service.updateMember(member);
//	               return ResponseEntity.ok("Update successful.");
//	           } catch (UpdateException e) {
//	               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
//	           }
//	       }
//	    

}
