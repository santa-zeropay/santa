package com.spring.web.dto;

import lombok.Data;

@Data
public class ThemaAndImageDto {

	private int id;
	private String name;
	private int category;
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
