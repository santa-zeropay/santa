package com.spring.web.dto;

import lombok.Data;
//dto : 화면에 필요한 데이터를 한번에 가져오고싶을때

@Data
public class MenuListAndImageDto {
	private int id;
	private String menuname;	
	private int price;
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
