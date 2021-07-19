package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;


@Mapper
public interface UserMapper {
	
	//회원가입
	public void userJoin(UserVO vo);
	
	//로그인
	public UserVO getUser(UserVO vo);

	//내정보확인
	public UserVO getUserById(int id);

	//정보수정
	public void userUpdate(UserVO vo);
	
	
}
