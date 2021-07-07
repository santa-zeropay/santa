package com.spring.web.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

@Mapper
public interface StoreMapper {

	//가게 등록
	public void storeJoin(StoreVO vo);
	
	//userid로 가게 불러오기
	public StoreVO getStoreByUserId(int id);
}
