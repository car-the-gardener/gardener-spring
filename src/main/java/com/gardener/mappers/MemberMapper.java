package com.gardener.mappers;

import com.gardener.domain.Member;

public interface MemberMapper {
	public Member selectById(String loginid);
	public Member selectByNickname(String nickname);
	public void insert(Member m);
}
