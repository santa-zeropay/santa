package com.spring.web.service;


import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface MenuService {

	public void menuJoin(MenuVO vo);

	public MenuVO getMenu(MenuVO vo);

	public StoreVO getMenuById(int id);
	
	public void imageEnroll(ImageVO vo);


}
