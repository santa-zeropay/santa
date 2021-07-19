package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.dto.ThemaAndImageDto;
import com.spring.web.dto.ThemaListAndImageDto;
import com.spring.web.dto.ThemaStoreImageDto;

@Mapper
public interface ThemaMapper {
	public List<ThemaListAndImageDto> getThemaListWithImage();
	
	public ThemaAndImageDto getThemaAndImage(int id);
}
