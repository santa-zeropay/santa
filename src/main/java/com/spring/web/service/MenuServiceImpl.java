package com.spring.web.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.dto.MenuListAndImageDto;
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
	public MenuVO getMenuById(int id) {
		return menuMapper.getMenuById(id);
	}

	@Override
	public List<MenuVO> getMenuByStoreId(int id) {
		return menuMapper.getMenuByStoreId(id);
	}


	@Override
	public MenuVO menuUpdate(MenuVO vo) {
		return menuMapper.menuUpdate(vo);
	}

	@Override
	public void menuDelete(int id) {
		menuMapper.menuDelete(id);
		
	}

	@Override
	public List<MenuListAndImageDto> getMenuListWithImage(int id) {
		return menuMapper.getMenuListWithImage(id);
	}


}
