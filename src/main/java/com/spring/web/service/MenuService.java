package com.spring.web.service;


import java.util.List;

import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface MenuService {

	public void menuJoin(MenuVO vo);

	public MenuVO getMenuById(int id);

	public List<MenuVO> getMenuByStoreId(int id);

	public MenuVO menuUpdate(MenuVO vo);
	
	public void menuDelete(int id);
}
