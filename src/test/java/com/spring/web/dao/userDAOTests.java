package com.spring.web.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.web.mapper.UserMapper;
import com.spring.web.vo.UserVO;


@SpringBootTest
public class userDAOTests {

	@Autowired
	public UserMapper usermapper;			//userMapper.java 인터페이스 의존성 주입

	//회원가입 쿼리 테스트 메서드
	@Test
	public void userJoin() throws Exception{
		UserVO user = new UserVO();

		user.setId(2);					//순서
		user.setEmail("test");			//회원 이메일(아이디)
		user.setPassword("test");		//회원 비밀번호
		user.setName("test");			//회원 이름
		user.setRole(1);				//회원 역할
		user.setPhonenum("test2");		//회원 번호

		System.out.println(user);
	
		System.out.println(usermapper);
		
		usermapper.userJoin(user);		 		//쿼리 메서드 실행

	}


}
