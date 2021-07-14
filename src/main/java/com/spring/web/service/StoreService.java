package com.spring.web.service;


import java.util.List;

import com.spring.web.dto.StoreAndImageDto;
import com.spring.web.dto.StoreListAndImageDto;
import com.spring.web.vo.NewPageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface StoreService {

	public void storeJoin(StoreVO vo);

	public StoreVO getStoreByUserId(int id);
	
	public StoreVO getStoreById(int id);
	
	public List<StoreListAndImageDto> getStoreListWithImage(NewPageVO vo);
	
	public List<StoreVO> getStoreList();
	
	public List<StoreVO> getStoreListNotCategory(int category);
	
	public StoreAndImageDto getStoreWithImage(int id);

	public int getStoreTotal(NewPageVO vo);
}
