package com.spring.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.spring.web.service.UserService;
import com.spring.web.vo.UserVo;



@RestController   //Controller + ResponseBody
@MapperScan(basePackages="com.spring.web.mapper")
public class testController {
	
	@Autowired
	private UserService userServiceImpl;
	
	@RequestMapping("/user01")
	public List<UserVo> getList() throws Exception{
		List<UserVo> userVo = userServiceImpl.getList();
		return userVo;
	};
//	
//	@RequestMapping("/userJoin")
//	public String userJoin(UserVo vo) {
//		userServiceImpl.userJoin(vo);		
//		
//		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
//		return "redirect:/member/login";
//		}
}