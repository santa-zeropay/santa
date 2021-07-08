package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.mapper.StoreMapper;
import com.spring.web.mapper.UserMapper;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService{
	private final StoreMapper storeMapper;

	@Override
	public void storeJoin(StoreVO vo) {

		log.info("오너 회원가입 동작");
		storeMapper.storeJoin(vo);
	}

	@Override
	public StoreVO getStoreByUserId(int id) {
		return storeMapper.getStoreByUserId(id);
		
	}

	@Override
	public List<StoreVO> getStoreList() {
		return storeMapper.getStoreList();
	}

	@Override
	public StoreVO getStoreById(int id) {
		return storeMapper.getStoreById(id);
	}

	@Override
	public List<StoreVO> getStoreListByCategory(int category) {
		return storeMapper.getStoreListByCategory(category);
	}
}
