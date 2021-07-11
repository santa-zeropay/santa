package com.spring.web.dto;

import lombok.Data;

@Data
public class StoreListAndImageDto {

	private int id;
	private String storename;	
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
