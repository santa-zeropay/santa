package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web.dto.MenuDetailImageDto;
import com.spring.web.dto.MenuListAndImageDto;
import com.spring.web.service.ImageService;
import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
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
public class MenuController {
	
	private final StoreService storeServiceImpl;
	private final MenuService menuServiceImpl;
	private final ImageService imageServiceImpl;
	
	@GetMapping("/enrollMenu")
	public void enrollMenu() {

	}
	@PostMapping("/enrollMenuPlay")
	public String enrollMenuPlay(MenuVO vo) {
		
		menuServiceImpl.menuJoin(vo);	
		
		for (ImageVO image:vo.getImageList()) {
			image.setMenu_id(vo.getId());
			imageServiceImpl.MenuImageEnroll(image);
			System.out.println("image:"+image);
		}

		return "/store/myStore";

	}

	@GetMapping("/menuList")
	public void menuList(HttpSession httpSession,Model model) {
		int id = (int) httpSession.getAttribute("id");
		int sid = (int) httpSession.getAttribute("store_id");
		log.info(" 가게의 아아디"+sid);

		//서비스안의 회원정보보기 메서드 호출
		StoreVO store = storeServiceImpl.getStoreByUserId(id);
		List<MenuVO> menus=menuServiceImpl.getMenuByStoreId(sid);
		log.info("menu"+menus);
		log.info("store는 "+store);
		model.addAttribute("store", store);
		model.addAttribute("menus", menus);
	}

	@GetMapping("/menuDetail")
	public void menuDetail(MenuVO vo, HttpSession httpSession,Model model) {
		int id = (int) httpSession.getAttribute("id");
		int sid = (int) httpSession.getAttribute("store_id");
		log.info(" 메뉴 디테일 유저 아이디 "+id);
		log.info(" 메뉴 디테일의 store 아이디 "+sid);
		int mid = vo.getId();
		log.info("메뉴의 id : "+mid);
	
		MenuDetailImageDto menu = menuServiceImpl.getMenuWithImage(mid);
		log.info("메뉴 : "+menu);
		model.addAttribute("menu", menu);

	}

	@GetMapping("/modifyMenu")
	public String modifyMenu(MenuVO vo,Model model) {
		int mid = vo.getId();
		MenuDetailImageDto menu = menuServiceImpl.getMenuWithImage(mid);
		
		
		model.addAttribute("menu", menu);
		return "store/modifyMenu";
	}
	@PostMapping("/UpdateMenu")
	public String update(MenuVO vo, HttpSession httpSession) {
		
		int sid = (int) httpSession.getAttribute("store_id");
		vo.setStore_id(sid);
		log.info("이름" +vo);
		menuServiceImpl.menuUpdate(vo);
		log.info("수정완료");
		return "redirect:/store/menuDetail?id="+vo.getId();
	}
	

	@GetMapping("/deleteMenu")
	public String deleteMenu(MenuVO vo) {
		int id=vo.getId();
		
		int result1 = imageServiceImpl.imageDelete(id);
		int result2 = menuServiceImpl.menuDelete(id);
		log.info("이미지 삭제완료"+result1);
		log.info("메뉴 삭제완료"+result2);
		return "redirect:/store/menuList";
	}
}
