package com.spring.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.mapper.CartMapper;
import com.spring.web.mapper.DistMapper;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartMapper cartMapper;
	
	@Override
	public List<MenuCartDto> getTempCartList() {
		
		return cartMapper.getTempCartList();
	}

	@Override
	public void cartEnroll(CartVO vo) {
		cartMapper.cartEnroll(vo);
		
	}

	@Override
	public List<MenuCartDto> getCartList(int id) {
		
		return cartMapper.getCartList(id);
	}

	@Override
	public void cartDelete(int id) {
		cartMapper.cartDelete(id);
		
	}

	@Override
	public void cartDeleteByUserId(int id) {
		cartMapper.cartDeleteByUserId(id);
		
	}


}
