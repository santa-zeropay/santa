package com.spring.web.controller;



import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.web.service.UserService;
import com.spring.web.vo.UserVo;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MapperScan(basePackages="com.spring.web.mapper")
@RequestMapping(value = "/user")
public class MemberController {

	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private UserService userServiceImpl;

	@GetMapping("/register")
	public void joinGET() {
		logger.info("회원가입 페이지 집입");
	}

	@PostMapping("/register")
	public String userJoin(UserVo vo) throws Exception {
		logger.info("join 진입");

		userServiceImpl.userJoin(vo);		

		logger.info("join 성공");

		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/user/login";
	}
	@GetMapping(value = "/login")
	public void login() {
		logger.info("로그인 페이지 진입");

	}
	@GetMapping("/cart")
	public void cart() {

	}
	@GetMapping("/myPage")
	public void myPage() {

	}
}
