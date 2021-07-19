package com.spring.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.web.dto.StoreAndImageDto;
import com.spring.web.dto.StoreListAndImageDto;
import com.spring.web.dto.ThemaAndImageDto;
import com.spring.web.dto.ThemaListAndImageDto;
import com.spring.web.dto.ThemaStoreImageDto;
import com.spring.web.service.DistService;
import com.spring.web.service.ImageService;
import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
import com.spring.web.service.StoreServiceImpl;
import com.spring.web.service.ThemaService;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.ThemaVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class RecommendController {
	
	private final ThemaService themaServiceImpl;
	private final StoreService storeServiceImpl;
	
	@GetMapping("/recommend")
	public void recommend(Model model) {
		List<ThemaListAndImageDto> themaListAndImage = themaServiceImpl.getThemaListWithImage();
		
		model.addAttribute("themaListAndImage", themaListAndImage);
		log.info("ddd"+themaListAndImage);
	}
	@GetMapping("/recommendDetail")
	public void recommendFamily(int id, Model model) {
		
		
		ThemaAndImageDto themaAndImage = themaServiceImpl.getThemaAndImage(id);
		int category = themaAndImage.getCategory();
		
		List<StoreListAndImageDto> storeImage = storeServiceImpl.getStoreListByCategory(category);
		
		model.addAttribute("themaAndImage", themaAndImage);
		model.addAttribute("storeImage", storeImage);
		log.info("rrr"+themaAndImage);
		log.info("qqq"+storeImage);
		
	}
}
