package com.spring.web.dto;

import lombok.Data;

@Data
public class MenuDetailImageDto {
	private int id;
	private int store_id;
	private String menuname;	
	private int price;
	private double discountrate;
	
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
