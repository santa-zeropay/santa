package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.UserVO;



@Mapper
public interface UserMapper {
	  public List<UserVO> getList() throws Exception;
	  
	  //회원가입
	  public void userJoin(UserVO vo);
	  
	  public UserVO getUser(UserVO vo);
}
