package com.gardener.domain;
import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {

	private String loginid; 
	private String pwd; 
	private String email; 
	private String nickname; 
	private String intro; 
	private String createDate; 
	private String profile; 

	public Member(String loginid, String pwd, String email, String nickname) {
		this.loginid = loginid;
		this.pwd = pwd;
		this.email = email;
		this.nickname = nickname;
	}

	
	public Member(String loginid, String pwd, String email, String nickname, String intro, String profile) {
		this.loginid = loginid;
		this.pwd = pwd;
		this.email = email;
		this.nickname = nickname;
		this.intro = intro;
		this.profile = profile;
	}

	public String toJsonString() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}


	public void print() {

	}

}