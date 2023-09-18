package com.gardener.mappers;

import com.gardener.domain.Member;

public interface MemberMapper {

	Member selectByLoginid(String loginid);

	Member selectByNickname(String nickname);

	void insert(Member m);

	Member findMember(String loginid);

	void updateMember(Member m);

	boolean deleteMember(String loginid);
}
