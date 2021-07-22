package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.service.CartService;
import com.spring.web.service.StoreService;
import com.spring.web.service.UserService;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class CartController {

	private final CartService cartServiceImpl;

	@GetMapping("/cart")
	public String cart(HttpSession httpSession,Model model) {
	
		int id = (int) httpSession.getAttribute("id");
		log.info(" 회원정보보기 GET의 아이디 "+id);
		List<MenuCartDto> menuCartDtos = cartServiceImpl.getCartList(id);
		model.addAttribute("carts", menuCartDtos);
		log.info("cccaarr"+menuCartDtos);
		int total=0;
		for(MenuCartDto cart:menuCartDtos) {
			int priceCount=cart.getPrice()*cart.getCount();
			total=total+priceCount;
		}
		log.info("total:"+total);
		model.addAttribute("total", total);
		
		 return "user/cart";

	}
	@PostMapping("/joincart")
	@ResponseBody
	public String joincart(CartVO vo,Model model,HttpSession httpSession) {
		log.info("1.vo~~"+vo);
		int id = (int) httpSession.getAttribute("id");
		vo.setUser_id(id);
		log.info("2.vo~~"+vo);
		cartServiceImpl.cartEnroll(vo);

		return "good";

	}
	@PostMapping("/deletecart")
	@ResponseBody
	public String deletecart(CartVO vo,Model model,HttpSession httpSession) {

		log.info("1.vo:"+vo);
		int id = (int) httpSession.getAttribute("id");
		vo.setUser_id(id);
		log.info("2.vo:"+vo);
		cartServiceImpl.cartDelete(vo.getId());

		return "good";

	}

}
