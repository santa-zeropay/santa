package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;


@Mapper
public interface UserMapper {
	public List<UserVO> getList() throws Exception;

	//회원가입
	public void userJoin(UserVO vo);
	
	public UserVO getUser(UserVO vo);

	//정보확인
	public UserVO getUserById(int id);

	//정보수정
	public UserVO userUpdate(UserVO vo);
	
	public void imageEnroll(ImageVO vo);
	

}
