package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.service.CartService;
import com.spring.web.service.StoreService;
import com.spring.web.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class CartController {
	
	private final CartService cartServiceImpl;
	
	@GetMapping("/cart")
	public void cart(HttpSession httpSession,Model model) {
		int id = (int) httpSession.getAttribute("id");
		log.info(" 회원정보보기 GET의 아이디 "+id);
		List<MenuCartDto> menuCartDtos = cartServiceImpl.getCartList(id);
		model.addAttribute("cart", menuCartDtos);
		log.info("cccaarr"+menuCartDtos);

	}
}
