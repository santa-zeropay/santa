package com.spring.web.dto;

import lombok.Data;

@Data
public class StoreAndImageDto {

	private int id;
	private String storename;	
	private String address;
	private double x;
	private double y;
	
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
