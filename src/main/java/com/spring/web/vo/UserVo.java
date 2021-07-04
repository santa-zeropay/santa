package com.spring.web.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor   // 기본 생성자
public class UserVO {
	private int id;
	private String email;
	private String password;
	private String name;
	private int role;   // 0: 사장님 1:고객
	private String phonenum;
}
