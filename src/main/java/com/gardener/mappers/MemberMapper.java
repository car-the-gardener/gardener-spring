package com.gardener.mappers;

import com.gardener.domain.Member;

public interface MemberMapper {
	public Member selectByLoginid(String loginid);
	public Member selectByNickname(String nickname);
	public void insert(Member m);
	public Member findMember(String loginid);
	public void updateMember(Member m);
	public boolean deleteMember(String loginid);
}
