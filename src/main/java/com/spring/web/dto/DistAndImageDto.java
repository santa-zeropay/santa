package com.spring.web.dto;

import lombok.Data;

@Data
public class DistAndImageDto {
	private int id;
	private int store_id;
	private String name;	//비교당하는가게
	private double distance;	//두가게의 거리
	
	private String uuid;
	private String fileName;
	private String uploadPath;
}
