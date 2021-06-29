package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/user")
public class MemberController {
	@GetMapping(value = "/register")
	public void register() {
		UserVo uservo=new UserVo();

	}
	@GetMapping(value = "/login")
	public void login() {
				
	}
	@GetMapping("/cart")
    public void cart() {
       
    }
	@GetMapping("/myPage")
    public void myPage() {
       
    }
}
