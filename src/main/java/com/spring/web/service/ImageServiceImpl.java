package com.spring.web.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.mapper.ImageMapper;
import com.spring.web.vo.ImageVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService{
	
	private final ImageMapper imageMapper;

	@Override
	public void StoreImageEnroll(ImageVO vo) {
		log.info("가게 이미지 등록시작");
		imageMapper.StoreImageEnroll(vo);		
	}

	@Override
	public void MenuImageEnroll(ImageVO vo) {
		log.info("메뉴 이미지 등록시작");
		imageMapper.MenuImageEnroll(vo);	
	}


}
