package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.DistVO;
import com.spring.web.vo.ImageVO;

@Mapper
public interface DistMapper {
	public List<DistVO> getDist3();
	
	public void distJoin(DistVO vo);

	public void truncateDist();
	
}
