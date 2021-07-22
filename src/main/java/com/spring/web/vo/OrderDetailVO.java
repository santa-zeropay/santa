package com.spring.web.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class OrderDetailVO {
	private int id;
	private int order_id;
	private int menu_id;
	private int count;	
}