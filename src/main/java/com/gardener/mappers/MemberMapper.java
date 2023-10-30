package com.gardener.mappers;

import com.gardener.domain.Member;

public interface MemberMapper {

	Member selectByLoginid(String loginid);

	Member selectByNickname(String nickname);

	void insert(Member m);

	void updateMember(Member mamber);

	boolean deleteMember(String loginid);

	boolean deleteapply(String loginid);
}
