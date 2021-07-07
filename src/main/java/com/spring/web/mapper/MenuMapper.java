package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.ImageVO;
import com.spring.web.vo.MenuVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;


@Mapper
public interface MenuMapper {

	//메뉴등록
	public void menuJoin(MenuVO vo);

	//id로 메뉴가져오기(상세 메뉴)
	public MenuVO getMenuById(int id);

	//store_id로 메뉴들 가져오기(메뉴리스트)
	public List<MenuVO> getMenuByStoreId(int id);
}
