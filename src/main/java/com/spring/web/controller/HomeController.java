package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.web.dto.DistAndImageDto;
import com.spring.web.dto.MenuCartDto;
import com.spring.web.dto.MenuListAndImageDto;
import com.spring.web.dto.StoreAndImageDto;
import com.spring.web.dto.StoreListAndImageDto;
import com.spring.web.service.CartService;
import com.spring.web.service.DistService;
import com.spring.web.service.ImageService;
import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
import com.spring.web.service.UserService;
import com.spring.web.vo.DistVO;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.NewPageMakerVO;
import com.spring.web.vo.NewPageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	private final StoreService storeServiceImpl;
	private final MenuService menuServiceImpl;
	private final DistService distServiceImpl;
	private final CartService cartServiceImpl;
	private final UserService userServiceImpl;

	@GetMapping("/main")
	public void main(Model model,NewPageVO vo,UserVO uvo,HttpSession httpSession) {
		if(httpSession.getAttribute("id")!=null) {
			int id = (int) httpSession.getAttribute("id");
			//서비스안의 회원정보보기 메서드 호출
			UserVO user = userServiceImpl.getUserById(id);
			log.info("사람"+user);
			model.addAttribute("user", user);
		}
		
	
		List<StoreListAndImageDto> storeListAndImageDtos= storeServiceImpl.getStoreListWithImage(vo);
		log.info("storeListAndImageDtos는 "+storeListAndImageDtos);
		log.info("사이즈: "+storeListAndImageDtos.size() );
		int total = storeServiceImpl.getStoreTotal(vo);

		model.addAttribute("storeList", storeListAndImageDtos);
		model.addAttribute("pageMaker",new NewPageMakerVO(vo, total));
	}
	@GetMapping("/store")
	public void store(int id,Model model) {

		StoreVO store = storeServiceImpl.getStoreById(id);
		StoreAndImageDto storeAndImageDtos= storeServiceImpl.getStoreWithImage(id);
		List<MenuListAndImageDto> menuListAndImageDtos=menuServiceImpl.getMenuListWithImage(id);
		List<MenuCartDto> menuCartDtos = cartServiceImpl.getTempCartList();
		DistVO dvo = new DistVO();
		int category = store.getCategory();
		List<StoreVO> storeNotCategory = storeServiceImpl.getStoreListNotCategory(category);
		double x= store.getX();
		double y= store.getY();
		log.info("x는 "+x);
		log.info("y는 "+y);
		int i=1;
		for(StoreVO catestore:storeNotCategory) {

			double cax= catestore.getX();
			double cay= catestore.getY();
			String name = catestore.getStorename();
			log.info("다른x는 "+cax);
			log.info("다른y는 "+cay);

			double dis = distServiceImpl.distance(x, y, cax, cay);
			dvo.setId(i);
			dvo.setStore_id(catestore.getId());
			dvo.setName(name);
			dvo.setDistance(dis);

			distServiceImpl.distJoin(dvo);
			log.info("아"+dvo);
			i=i+1;

		};

		List<DistAndImageDto> distImage = distServiceImpl.distWithImage();

		model.addAttribute("store", storeAndImageDtos);
		model.addAttribute("cart", menuCartDtos);
		log.info("cccaarr"+menuCartDtos);
		model.addAttribute("distImage", distImage);
		log.info("~~"+distImage);
		model.addAttribute("menuImage", menuListAndImageDtos);

		distServiceImpl.truncateDist();

	}
	@GetMapping("/plusStore")
	public void plusStore(int id,Model model) {

		StoreAndImageDto storeAndImageDtos= storeServiceImpl.getStoreWithImage(id);
		List<MenuListAndImageDto> menuListAndImageDtos=menuServiceImpl.getMenuListWithImage(id);
		model.addAttribute("store",storeAndImageDtos);
		model.addAttribute("menus", menuListAndImageDtos);


	}

	@GetMapping("/map")
	public void map(Model model) {
		List<StoreVO> storeList = storeServiceImpl.getStoreList();
		log.info("~~~~~~");
		model.addAttribute("storeList", storeList);
	}
	

}
