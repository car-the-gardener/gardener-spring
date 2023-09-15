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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gardener.aop.exception.FindException;
import com.gardener.aop.exception.UpdateException;
import com.gardener.domain.Member;
import com.gardener.service.MemberMypageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/member")
public class MemberUpdateController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMypageService service;
	
	@GetMapping
	public void mypage() {
	}
	
	/*mypage클릭 시 내 정보 확인하기 
	 * */
	@PostMapping
	public String mypage(
		@RequestParam("loginid") String loginid,
		@RequestParam("pwd") String pwd,
		@RequestParam("email")String email,
		@RequestParam("name") String name,
		@RequestParam("intro")String intro,
		@RequestParam("profile")String profile,
		RedirectAttributes redirectAttributes)
		{
		
		 Member member = new Member(loginid, pwd, email, name, intro, profile);
		 
		 try {
			service.updateMember(member);
		} catch (UpdateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return "redirect:/gardener/member" ;
	
		}
	

		/*계정 삭제 시
		 * */
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
	    
	    /*계정 찾아서 수정하기
	     * */	
	    @GetMapping("/findmember")
	    public ResponseEntity<?> findMember(@RequestParam String id) {
	        try {
	            Member member = service.findByMember(id);
	            return ResponseEntity.ok(member);
	        } catch (FindException e) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Member not found");
	        }
	    }
	    
	    @PostMapping("/updatemember")
	    public ResponseEntity<?> updateMember(@RequestParam String id, @RequestParam String pwd, 
	                                          @RequestParam String email, @RequestParam String name, 
	                                          @RequestParam String intro, @RequestParam String profile) throws FindException {
	        Member member = service.findByMember(id);
	        member.setPwd(pwd);
	        member.setEmail(email);
	        member.setName(name);
	        member.setIntro(intro);
	        member.setProfile(profile);

	        try {
	            service.updateMember(member);
	            return ResponseEntity.ok("Update successful.");
	        } catch (UpdateException e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
	        }
	    }

}
