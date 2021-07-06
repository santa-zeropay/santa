package com.spring.web.service;


import com.spring.web.vo.StoreVO;

public interface StoreService {
//	public StoreVO getStoreById(int id);
	public void storeJoin(StoreVO vo);

	public StoreVO getStore(StoreVO svo);
}
