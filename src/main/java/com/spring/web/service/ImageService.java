package com.spring.web.service;


import java.util.List;

import com.spring.web.vo.ImageVO;

public interface ImageService {

	public void StoreImageEnroll(ImageVO vo);

	public void MenuImageEnroll(ImageVO vo);
	
	public List<ImageVO> getImageList(int id);
}
