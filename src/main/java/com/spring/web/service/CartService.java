package com.spring.web.service;

import java.util.List;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.vo.CartVO;

public interface CartService {
	public List<MenuCartDto> getTempCartList();
	
	public List<MenuCartDto> getCartList(int id);

	public void cartEnroll(CartVO vo);
}
