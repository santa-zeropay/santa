package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.mapper.UserMapper;
import com.spring.web.vo.UserVo;


@Service
public class UserServiceImpl implements UserService{

	@Autowired //Mapper와 연결
	private UserMapper usermapper;
	
	@Override
	public List<UserVo> getList() throws Exception {
		return usermapper.getList();
	}

	@Override
	public void userJoin(UserVo vo) throws Exception{
		System.out.println("회원가입 동작");
		if(vo==null) {
			return;
		}
		usermapper.userJoin(vo);
	
	}
}
