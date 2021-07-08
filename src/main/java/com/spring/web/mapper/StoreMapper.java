package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

@Mapper
public interface StoreMapper {

	//가게 등록
	public void storeJoin(StoreVO vo);

	//user_id로 가게 불러오기
	public StoreVO getStoreByUserId(int id);
	//id로 가게 불러오기
	public StoreVO getStoreById(int id);
	//전체 가게 리스트 불러오기
	public List<StoreVO> getStoreList();
	//카테코리가 다른 가게 리스트 불러오기
	public List<StoreVO> getStoreListByCategory(int category);
}
