package com.spring.web.service;


import java.util.List;

import com.spring.web.dto.MenuDetailImageDto;
import com.spring.web.dto.MenuListAndImageDto;
import com.spring.web.dto.StoreListAndImageDto;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface MenuService {

	public void menuJoin(MenuVO vo);

	public MenuVO getMenuById(int id);

	public List<MenuVO> getMenuByStoreId(int id);

	public void menuUpdate(MenuVO vo);
	
	public int menuDelete(int id);
	
	public MenuDetailImageDto getMenuWithImage(int id);
	
	public List<MenuListAndImageDto> getMenuListWithImage(int id);
}
