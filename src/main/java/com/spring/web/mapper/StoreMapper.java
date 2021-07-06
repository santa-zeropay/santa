package com.spring.web.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

@Mapper
public interface StoreMapper {

	public void storeJoin(StoreVO vo);
	
	public StoreVO getStoreById(int id);
	
	public StoreVO getStore(StoreVO vo);
}
