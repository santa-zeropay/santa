package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.mapper.UserMapper;
import com.spring.web.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{

	@Autowired //Mapper와 연결
	private UserMapper userMapper;
	
	@Override
	public List<UserVO> getList() throws Exception {
		return userMapper.getList();
	}

	@Override
	public void userJoin(UserVO vo) throws Exception{
		System.out.println("회원가입 동작");
		if(vo==null) {
			return;
		}
		userMapper.userJoin(vo);
	
	}
	
	@Override
	public UserVO getUser(UserVO vo) {

		return userMapper.getUser(vo);
	}
}
