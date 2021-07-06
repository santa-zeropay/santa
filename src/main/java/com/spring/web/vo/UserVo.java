package com.spring.web.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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
	
	 @Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	 
	 @NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	private String password;
	private String name;
	private int role;   // 0: 사장님 1:고객
	private String phonenum;
	
}
