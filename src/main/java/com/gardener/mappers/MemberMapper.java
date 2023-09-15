package com.gardener.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.gardener.domain.Member;


public interface MemberMapper {

	
	public Member selectById(String id);
	public void findMember(Member m);
	public void updateMember(Member m);
	public boolean deleteMember(String loginId);
	
	
}
