package com.spring.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.service.CartService;
import com.spring.web.service.OrderService;
import com.spring.web.service.StoreService;
import com.spring.web.service.UserService;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderDetailVO;
import com.spring.web.vo.OrderVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class OrderController {
	
	private final OrderService orderServiceImpl;
	private final CartService cartServiceImpl;

	
	@PostMapping("/order")
	public String orderList(HttpSession httpSession,Model model,OrderVO vo,OrderDetailVO orderdetail) {
		
		int id = (int) httpSession.getAttribute("id");
		log.info(" 회원정보보기 GET의 아이디 "+id);
		List<MenuCartDto> menuCartDtos = cartServiceImpl.getCartList(id);
		vo.setUser_id(id);
		orderServiceImpl.orderInfo(vo);
		
		log.info(" menucart "+menuCartDtos);
		
		
		int order_id=orderServiceImpl.getOrderId(id).getId();
		log.info("oid:"+order_id);
		
		for (MenuCartDto item:menuCartDtos) {
			orderdetail.setOrder_id(order_id);
			orderdetail.setCount(item.getCount());
			orderdetail.setMenu_id(item.getMenu_id());
			log.info("orderdetail:"+orderdetail);
			orderServiceImpl.orderInfo_Details(orderdetail);
		}
		
		
		List<OrderVO> OrderIdList=orderServiceImpl.getOrderListByUserId(id);
		log.info("OrderIdList:"+OrderIdList);

		List<OrderDetailVO> orderDetailVO=orderServiceImpl.getOrderDetail(order_id);
		
		
		model.addAttribute("OrderIdList", OrderIdList);
		model.addAttribute("order_id", order_id);
		model.addAttribute("orderDetailVO", orderDetailVO);
		
		cartServiceImpl.cartDeleteByUserId(id);
		
		return "/user/orderList";
	}
	
	
	
	
	
}