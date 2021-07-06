package com.spring.web.service;


import org.springframework.stereotype.Service;

import com.spring.web.mapper.MenuMapper;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService{
	private final MenuMapper menuMapper;

	@Override
	public void menuJoin(MenuVO vo) {
		log.info("메뉴등록");
		menuMapper.menuJoin(vo);
	}

	@Override
	public MenuVO getMenu(MenuVO vo) {
		return menuMapper.getMenu(vo);
	}

	@Override
	public void imageEnroll(ImageVO vo) {
		log.info("이미지등록시작");
		menuMapper.imageEnroll(vo);
	}

	@Override
	public StoreVO getMenuById(int id) {
		// TODO Auto-generated method stub
		return null;
	}



}
