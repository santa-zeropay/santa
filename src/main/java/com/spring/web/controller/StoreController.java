package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
import com.spring.web.service.StoreServiceImpl;
import com.spring.web.service.UserService;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping(value = "/store")
@RequiredArgsConstructor
public class StoreController {

	private final StoreService storeServiceImpl;
	private final UserService userServiceImpl;

	@RequestMapping("/myStore")
	public void myStore(HttpSession httpSession,Model model) {
		
		int id = (int) httpSession.getAttribute("id");
		int sid = (int) httpSession.getAttribute("store_id");
		log.info(" user_id는  "+id);
		log.info(" store_id는  "+sid);

		//서비스안의 회원정보보기 메서드 호출
		StoreVO store = storeServiceImpl.getStoreByUserId(id);
		UserVO user = userServiceImpl.getUserById(id);
		log.info(""+store);
		model.addAttribute("user", user);
		model.addAttribute("store", store);
	}


}
