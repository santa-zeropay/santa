package com.spring.web.vo;
import java.util.List;

/*
id int AI PK 
user_id varchar(30) 
name varchar(50) 
address varchar(500) 
x double 
y double 
photo varchar(500) 
storenumber varchar(100)
 */
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class StoreVO {
	private int id;
	private int user_id;
	private String storename;
	private String address;
	private double x;
	private double y;	 
	private String storenumber;
	private List<ImageVO> imageList;
	private int category;
}
