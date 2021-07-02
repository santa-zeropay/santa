package com.spring.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.UserVo;


@Mapper
public interface UserMapper {
	  public List<UserVo> getList() throws Exception;
	  
	  //회원가입
	  public void userJoin(UserVo vo);
}
