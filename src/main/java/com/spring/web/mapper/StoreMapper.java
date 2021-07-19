package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.dto.StoreAndImageDto;
import com.spring.web.dto.StoreListAndImageDto;
import com.spring.web.vo.NewPageVO;
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
	//카테코리가 같은 가게 리스트 불러오기
	public List<StoreListAndImageDto> getStoreListByCategory(int category);
	//카테코리가 다른 가게 리스트 불러오기
	public List<StoreVO> getStoreListNotCategory(int category);
	//id로 가게+이미지 불러오기
	public StoreAndImageDto getStoreWithImage(int id);
	//전체 가게 리스트+이미지 불러오기
	public List<StoreListAndImageDto> getStoreListWithImage(NewPageVO vo);
	//가게 총 개수
	public int getStoreTotal(NewPageVO vo);
}
