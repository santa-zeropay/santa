package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.web.service.DistService;
import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
import com.spring.web.vo.DistVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	private final StoreService storeServiceImpl;
	private final MenuService menuServiceImpl;
	private final DistService distServiceImpl;

	@GetMapping("/main")
	public void main(HttpSession httpSession,Model model) {

		List<StoreVO> storeList = storeServiceImpl.getStoreList();
		log.info("storeList는 "+storeList);
		model.addAttribute("storeList", storeList);
	}
	@GetMapping("/store")
	public void store(int id,Model model) {

		StoreVO store = storeServiceImpl.getStoreById(id);
		List<MenuVO> menus=menuServiceImpl.getMenuByStoreId(id);
		DistVO dvo = new DistVO();
		int category = store.getCategory();
		List<StoreVO> storeCategory = storeServiceImpl.getStoreListByCategory(category);
		double x= store.getX();
		double y= store.getY();
		log.info("x는 "+x);
		log.info("y는 "+y);
		int i=1;
		for(StoreVO catestore:storeCategory) {

			double cax= catestore.getX();
			double cay= catestore.getY();
			String name = catestore.getStorename();
			log.info("다른x는 "+cax);
			log.info("다른y는 "+cay);

			double dis = distServiceImpl.distance(x, y, cax, cay);
			dvo.setId(i);
			dvo.setName(name);

			dvo.setDistance(dis);
			
			distServiceImpl.distJoin(dvo);
			log.info("아"+dvo);
			i=i+1;
			
		};

		List<DistVO> dist3 = distServiceImpl.getDist3();
		
		log.info("menu"+menus);
		model.addAttribute("store",store);
		model.addAttribute("menus", menus);
		model.addAttribute("dist3", dist3);
		
		distServiceImpl.truncateDist();

	}
	@GetMapping("/recommend")
	public void recommend() {

	}
	@GetMapping("/map")
	public void map() {

	}
}
