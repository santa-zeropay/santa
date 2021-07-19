package com.spring.web.service;


import java.util.List;

import com.spring.web.dto.ThemaAndImageDto;
import com.spring.web.dto.ThemaListAndImageDto;

public interface ThemaService {

	//이미지와 테마리스트 불러오기
	public List<ThemaListAndImageDto> getThemaListWithImage();
	
	//테마+이미지 들고오기
	public ThemaAndImageDto getThemaAndImage(int id);
}
