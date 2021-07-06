package com.spring.web.controller;

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

//	private final StoreService StoreServiceImpl;
	
	private final MenuService menuServiceImpl;
    @GetMapping("/myStore")
    public void myStore() {
       
    }
    @GetMapping("/enrollMenu")
    public void enrollMenu() {
       
    }
    
    @PostMapping("/enrollMenuPlay")
    public String enrollMenuPlay(MenuVO vo) {
		log.info("join 진입");
		System.out.println(vo);
		
		menuServiceImpl.menuJoin(vo);
		
		MenuVO menuvo=menuServiceImpl.getMenu(vo);
		
		return "/store/myStore";
    	
    }

//    @GetMapping("/menuList")
//    public void menuList(HttpSession httpSession,Model model) {
//    	int id = (int) httpSession.getAttribute("id");
//		log.info(" 가게의 아이디 "+id);
//
//		//서비스안의 회원정보보기 메서드 호출
//		StoreVO store = StoreServiceImpl.getStoreById(id);
//		log.info(""+store);
//		model.addAttribute("user", store);
//    }
//    @GetMapping("/menuDetail")
//    public void menuDetail(HttpSession httpSession,Model model) {
//    		int id = (int) httpSession.getAttribute("id");
//    		log.info(" 회원정보보기 GET의 아이디 "+id);
//
//    		//서비스안의 회원정보보기 메서드 호출
//    		MenuVO menu = MenuServiceImpl.getMenuById(id);
//    		log.info(""+menu);
//    		model.addAttribute("user", menu);
//   
//    }
    @GetMapping("/modifyMenu")
    public void modifyMenu() {
       
    }

}
