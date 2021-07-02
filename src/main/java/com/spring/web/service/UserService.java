package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.UserVo;

public interface UserService {

	List<UserVo> getList() throws Exception;

	public void userJoin(UserVo vo) throws Exception;
}
