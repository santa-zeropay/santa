package com.spring.web.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.web.dto.ThemaAndImageDto;
import com.spring.web.dto.ThemaListAndImageDto;
import com.spring.web.dto.ThemaStoreImageDto;
import com.spring.web.mapper.ImageMapper;
import com.spring.web.mapper.ThemaMapper;
import com.spring.web.vo.ImageVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class ThemaServiceImpl implements ThemaService{
	
	private final ThemaMapper themaMapper;
	
	@Override
	public List<ThemaListAndImageDto> getThemaListWithImage() {
		return themaMapper.getThemaListWithImage();
	}

	@Override
	public ThemaAndImageDto getThemaAndImage(int id) {
		return themaMapper.getThemaAndImage(id);
	}
	

}
