package com.spring.web.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.ImageVO;

@Mapper
public interface ImageMapper {
	//가게 이미지 등록
	public void StoreImageEnroll(ImageVO vo);
	
	//메뉴 이미지 등록
	public void MenuImageEnroll(ImageVO vo);
}
