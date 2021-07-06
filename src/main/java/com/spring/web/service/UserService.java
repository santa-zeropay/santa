package com.spring.web.service;


import java.util.Map;

import org.springframework.validation.Errors;

import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

public interface UserService {
	public void userJoin(UserVO vo);
	
	public UserVO getUser(UserVO vo);

	public UserVO getUserById(int id);

	public UserVO userUpdate(UserVO vo);
	
	public void imageEnroll(ImageVO vo);

	public Map<String, String> validateHandling(Errors errors);
}
