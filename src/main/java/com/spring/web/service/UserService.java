package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.UserVO;

public interface UserService {

	List<UserVO> getList() throws Exception;

	public void userJoin(UserVO vo) throws Exception;
	
	UserVO getUser(UserVO vo);
}
