package com.spring.web.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	
	private int id;
	private String email;
	private String password;
	private String name;
	private int role;   // 0: 사장님 1:고객
	private String phonenum;
	
	public UserVO() {
		
	}
	public UserVO(int id, String email, String password, String name, int role, String phonenum) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.role = role;
		this.phonenum = phonenum;
	}
	
}
