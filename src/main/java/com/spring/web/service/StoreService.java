package com.spring.web.service;


import java.util.List;

import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface StoreService {

	public void storeJoin(StoreVO vo);

	public StoreVO getStoreByUserId(int id);
	
	public StoreVO getStoreById(int id);
	
	public List<StoreVO> getStoreList();
	
	public List<StoreVO> getStoreListByCategory(int category);
}
