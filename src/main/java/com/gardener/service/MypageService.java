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
	

	public Member findByMember(String loginid) throws FindException {
		Member m = new Member();
		m.setLoginid(loginid);
		mapper.findMember(loginid);
		return m;
	}

	public Member findByMember(Object attribute) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void updateMember(Member m) throws UpdateException {
		mapper.updateMember(m);

	}
	
	public boolean deleteMember(String loginid) {

		return mapper.deleteMember(loginid);
	}
	

}
	


	