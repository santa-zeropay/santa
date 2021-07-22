package com.spring.web.dto;

import lombok.Data;

@Data
public class MenuCartDto {
	
	private String menuname;
	private int price;
	
	
	private int id;
	private int user_id;
	private int menu_id;
	private int count;
}
