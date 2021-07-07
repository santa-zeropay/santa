package com.spring.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.spring.web.mapper.UserMapper;
import com.spring.web.vo.ImageVO;
import com.spring.web.vo.StoreVO;
import com.spring.web.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	private final UserMapper userMapper;
	
	@Override
	public void userJoin(UserVO vo){
		//TODO 이메일 중복 체크, 비밀번호 암호화
		log.info("회원가입 동작");
	
		userMapper.userJoin(vo);
	}
	
	@Override
	public UserVO getUser(UserVO vo) {

		return userMapper.getUser(vo);
	}

	@Override
	public UserVO getUserById(int id) {
		return userMapper.getUserById(id);
	}

	@Override
	public UserVO userUpdate(UserVO vo) {
		return userMapper.userUpdate(vo);
		
	}

	@Override
	public Map<String, String> validateHandling(Errors errors) {
		 Map<String, String> validatorResult = new HashMap<>();

	        for (FieldError error : errors.getFieldErrors()) {
	            String validKeyName = String.format("valid_%s", error.getField());
	            validatorResult.put(validKeyName, error.getDefaultMessage());
	        }

	        return validatorResult;
	}
}
