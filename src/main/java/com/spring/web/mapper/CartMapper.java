package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.dto.MenuCartDto;
import com.spring.web.vo.CartVO;
import com.spring.web.vo.OrderVO;

@Mapper
public interface CartMapper {
	public List<MenuCartDto> getTempCartList();
	
	public List<MenuCartDto> getCartList(int id);
	
	public void cartEnroll(CartVO vo);

	public void cartDelete(int id);
	
	public void cartDeleteByUserId(int id);
}
