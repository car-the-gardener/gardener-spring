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
	private String name; 
	private String intro; 
	private String joinDate; 
	private String profile; 

	public Member(String loginid, String pwd, String email, String name) {
		this.loginid = loginid;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
	}

	
	public Member(String loginid, String pwd, String email, String name, String intro, String profile) {
		this.loginid = loginid;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
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