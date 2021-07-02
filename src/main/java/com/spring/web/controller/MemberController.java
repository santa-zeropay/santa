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
	public String userJoin(UserVO vo) throws Exception {
		logger.info("join 진입");

		userServiceImpl.userJoin(vo);		

		logger.info("join 성공");

		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/user/loginPage";
	}
	@GetMapping("/loginPage")
    public String loginPage() {
		logger.info("로그인 페이지 진입");
       return "user/loginPage";
    }
	@GetMapping(value = "/login")
	public String login(UserVO vo,HttpSession httpSession) {
		System.out.println("MemberController-login");
		
		System.out.println(vo);
		
		UserVO user=userServiceImpl.getUser(vo);
		System.out.println(user);
		
		if(user!=null) {
			httpSession.setAttribute("email", user.getEmail());
			httpSession.setAttribute("password", user.getPassword());
			
			return "main";
		}
		else return "store";
		
	}

	@GetMapping("/cart")
	public void cart() {

	}
	@GetMapping("/myPage")
	public void myPage() {

	}
}
