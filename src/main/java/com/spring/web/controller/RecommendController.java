package com.spring.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.web.service.DistService;
import com.spring.web.service.ImageService;
import com.spring.web.service.MenuService;
import com.spring.web.service.StoreService;
import com.spring.web.vo.StoreVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class RecommendController {
	
	private final StoreService storeServiceImpl;
	
	@GetMapping("/recommend")
	public void recommend() {

	}
	@GetMapping("/recommendFamily")
	public void recommendFamily(Model model) {
		List<StoreVO> store = storeServiceImpl.getStoreList();
		int category = ((StoreVO) store).getCategory();
		List<StoreVO> storeCategory = storeServiceImpl.getStoreListByCategory(category);
		
		model.addAttribute("store", storeCategory);
	}
	@GetMapping("/recommendCouple")
	public void recommendCouple() {
		
		
	}
	@GetMapping("/recommendFriend")
	public void recommendFriend() {

	}
}
