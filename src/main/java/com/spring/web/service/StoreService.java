package com.spring.web.service;


import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface StoreService {

	public void storeJoin(StoreVO vo);

	public StoreVO getStoreByUserId(int id);
}
