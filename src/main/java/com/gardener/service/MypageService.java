package com.gardener.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gardener.aop.exception.FindException;
import com.gardener.aop.exception.UpdateException;
import com.gardener.domain.Member;
import com.gardener.mappers.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageService {
	
	@Autowired
	private MemberMapper mapper;
	

	public Member selectById(String loginid) throws FindException {
		Member member = mapper.selectById(loginid);
		return member;
	}

	public Member findByMember(Object attribute) {
		return null;
	}
	
	public void updateMember(Member m) throws UpdateException {
		mapper.updateMember(m);

	}
	
	public boolean deleteMember(String loginid) {

		return mapper.deleteMember(loginid);
	}
	

}
	


	