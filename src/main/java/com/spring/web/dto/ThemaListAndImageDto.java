package com.spring.web.dto;

import lombok.Data;

@Data
public class ThemaListAndImageDto {

	private int id;
	private String name;	
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
