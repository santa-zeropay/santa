package com.spring.web.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * id int AI PK 
store_id int 
name varchar(100) 
price int 
image varchar(300) 
discountrate double
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class MenuVO {
	private int id;
	private int store_id;
	private String name;
	private int price;
	private String image; 
	private double discountrate;
}
