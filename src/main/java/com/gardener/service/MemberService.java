package com.gardener.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gardener.aop.exception.AddException;
import com.gardener.aop.exception.FindException;
import com.gardener.domain.Member;
import com.gardener.mappers.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	public void signup(Member m) throws AddException {
		mapper.insert(m);
	}

	public void idDupChk(String loginId) throws FindException {
		Member m = null;	
		m = mapper.selectByLoginid(loginId);
		
		if (m != null) {
			throw new FindException("이미 사용중인 아이디 입니다");
			// loginId에 해당 고객이 있는 경우(중복인 경우)
		} else {
			System.out.println("사용 가능한 아이디 입니다");
			// loginId에 해당 고객이 없는 경우(id 사용가능한 경우)
		}
	}

	public void NicknameDupChk(String nickname) throws FindException {
		Member m = null;
		m = mapper.selectByNickname(nickname);

		if (m != null) {
			throw new FindException("이미 사용중인 필명입니다");
			// 필명에 해당 고객이 있는 경우(중복인 경우)
		} else {
			System.out.println("사용 가능한 필명 입니다");
			// 필명에 해당 고객이 없는 경우(필명 사용 가능)
		}
	}

	// 로그인
	public Member login(String loginId, String pwd) throws FindException {
		Member m = mapper.selectByLoginid(loginId);
		if (pwd.equals(m.getPwd())) {
			return m; // 로그인 성공
		} else {
			throw new FindException("로그인 실패");
		}
	}

	// 아이디찾기
	public String findLoginid(String name, String email) throws FindException {

		Member m = mapper.selectByNickname(name);

		if (m != null) {
			if (name.equals(m.getNickname()) && email.equals(m.getEmail())) {
				return m.getLoginid();
			} else {
				throw new FindException("잘못된 정보입니다");
			}
		} else {
			throw new FindException("잘못된 정보입니다");
		}
	}

	// 비밀번호찾기
	public String findPwd(String loginId, String email) throws FindException {
		Member m = mapper.selectByLoginid(loginId);
		if (loginId.equals(m.getLoginid()) && email.equals(m.getEmail())) {
			return m.getPwd();
		} else {
			throw new FindException("잘못된 정보입니다, 다시 입력해주세요");
		}
	}

}
