package com.spring.web.service;


import com.spring.web.vo.UserVO;

public interface UserService {
	public void userJoin(UserVO vo);
	
	UserVO getUser(UserVO vo);

	public UserVO getUserById(int id);

	public UserVO userUpdate(UserVO vo);
}
