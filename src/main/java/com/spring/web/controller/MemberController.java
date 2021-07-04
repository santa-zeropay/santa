package com.spring.web.controller;



import javax.servlet.http.HttpSession;

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
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class MemberController {
	private final UserService userServiceImpl;
	
	@GetMapping("/register")
	public void joinGET() {
		log.info("회원가입 페이지 집입");
	}

	@PostMapping("/register")
	public String userJoin(UserVO vo) {
		log.info("join 진입");

		userServiceImpl.userJoin(vo);		

		log.info("join 성공");

		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/user/loginPage";
	}
	
	@GetMapping("/loginPage")
	public String loginPage() {
		log.info("로그인 페이지 진입");
		return "user/loginPage";
	}
	
	@PostMapping("/login")
	public String login(UserVO vo,HttpSession httpSession) {
		UserVO user=userServiceImpl.getUser(vo);

		if(user!=null) {
			httpSession.setAttribute("email", user.getEmail());
			httpSession.setAttribute("password", user.getPassword());

			return "/main";
		}
		return "/user/loginPage";
	}

	@GetMapping("/cart")
	public void cart() {

	}
	
	@GetMapping("/myPage")
	public void myPage() {

	}
}
