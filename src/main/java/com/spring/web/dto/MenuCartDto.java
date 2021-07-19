package com.spring.web.dto;

import lombok.Data;

@Data
public class MenuCartDto {
	private String menuname;
	private int price;
	private int count;	
	
	private int id;
	private int store_id;
	private int menu_id;
}
