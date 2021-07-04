package com.spring.web.service;


import com.spring.web.vo.UserVO;

public interface UserService {
	public void userJoin(UserVO vo);
	
	UserVO getUser(UserVO vo);
}
